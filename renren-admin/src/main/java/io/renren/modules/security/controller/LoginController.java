/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.security.controller;

import io.renren.common.exception.ErrorCode;
import io.renren.common.exception.RenException;
import io.renren.common.utils.IpUtils;
import io.renren.common.utils.Result;
import io.renren.common.validator.AssertUtils;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.log.entity.SysLogLoginEntity;
import io.renren.modules.log.enums.LoginOperationEnum;
import io.renren.modules.log.enums.LoginStatusEnum;
import io.renren.modules.log.service.SysLogLoginService;
import io.renren.modules.security.dto.LoginDTO;
import io.renren.modules.security.password.PasswordUtils;
import io.renren.modules.security.service.CaptchaService;
import io.renren.modules.security.service.SysUserTokenService;
import io.renren.modules.security.user.SecurityUser;
import io.renren.modules.security.user.UserDetail;
import io.renren.modules.sys.dto.SysUserDTO;
import io.renren.modules.sys.enums.UserStatusEnum;
import io.renren.modules.sys.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * 登录
 * 
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@Api(tags="登录管理")
public class LoginController {
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserTokenService sysUserTokenService;
	@Autowired
	private CaptchaService captchaService;
	@Autowired
	private SysLogLoginService sysLogLoginService;

	@GetMapping("captcha")
	@ApiOperation(value = "验证码", produces="application/octet-stream")
	@ApiImplicitParam(paramType = "query", dataType="string", name = "uuid", required = true)
	public void captcha(HttpServletResponse response, String uuid)throws IOException {
		//uuid不能为空
		AssertUtils.isBlank(uuid, ErrorCode.IDENTIFIER_NOT_NULL);

		//生成验证码
		captchaService.create(response, uuid);
	}

	@PostMapping("login")
	@ApiOperation(value = "登录")
	public Result login(HttpServletRequest request, @RequestBody LoginDTO login) {
		//效验数据
		ValidatorUtils.validateEntity(login);

		//验证码是否正确
		boolean flag = captchaService.validate(login.getUuid(), login.getCaptcha());
		if(!flag){
			return new Result().error(ErrorCode.CAPTCHA_ERROR);
		}

		//用户信息
		SysUserDTO user = sysUserService.getByUsername(login.getUsername());

		SysLogLoginEntity log = new SysLogLoginEntity();
		log.setOperation(LoginOperationEnum.LOGIN.value());
		log.setCreateDate(new Date());
		log.setIp(IpUtils.getIpAddr(request));
		log.setUserAgent(request.getHeader(HttpHeaders.USER_AGENT));
		log.setIp(IpUtils.getIpAddr(request));

		//用户不存在
		if(user == null){
			log.setStatus(LoginStatusEnum.FAIL.value());
			log.setCreatorName(login.getUsername());
			sysLogLoginService.save(log);

			throw new RenException(ErrorCode.ACCOUNT_PASSWORD_ERROR);
		}

		//密码错误
		if(!PasswordUtils.matches(login.getPassword(), user.getPassword())){
			log.setStatus(LoginStatusEnum.FAIL.value());
			log.setCreator(user.getId());
			log.setCreatorName(user.getUsername());
			sysLogLoginService.save(log);

			throw new RenException(ErrorCode.ACCOUNT_PASSWORD_ERROR);
		}

		//账号停用
		if(user.getStatus() == UserStatusEnum.DISABLE.value()){
			log.setStatus(LoginStatusEnum.LOCK.value());
			log.setCreator(user.getId());
			log.setCreatorName(user.getUsername());
			sysLogLoginService.save(log);

			throw new RenException(ErrorCode.ACCOUNT_DISABLE);
		}

		//登录成功
		log.setStatus(LoginStatusEnum.SUCCESS.value());
		log.setCreator(user.getId());
		log.setCreatorName(user.getUsername());
		sysLogLoginService.save(log);

		return sysUserTokenService.createToken(user.getId());
	}

	@PostMapping("logout")
	@ApiOperation(value = "退出")
	public Result logout(HttpServletRequest request) {
		UserDetail user = SecurityUser.getUser();

		//退出
		sysUserTokenService.logout(user.getId());

		//用户信息
		SysLogLoginEntity log = new SysLogLoginEntity();
		log.setOperation(LoginOperationEnum.LOGOUT.value());
		log.setIp(IpUtils.getIpAddr(request));
		log.setUserAgent(request.getHeader(HttpHeaders.USER_AGENT));
		log.setIp(IpUtils.getIpAddr(request));
		log.setStatus(LoginStatusEnum.SUCCESS.value());
		log.setCreator(user.getId());
		log.setCreatorName(user.getUsername());
		log.setCreateDate(new Date());
		sysLogLoginService.save(log);

		return new Result();
	}
	
}