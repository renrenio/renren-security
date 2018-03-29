/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package io.renren.modules.sys.controller;


import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import io.renren.common.utils.R;
import io.renren.modules.sys.shiro.ShiroUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * 登录相关
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年11月10日 下午1:15:31
 */
@Controller
public class SysLoginController {
	@Autowired
	private Producer producer;
	private String  errorNumber = "errorNumber";
	@Value("${captcha.error.number:5}")
	private Integer captchaErrorNumber;

	/**
	 * 生成验证码
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("captcha.jpg")
	public void captcha(HttpServletResponse response)throws IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");
        //生成文字验证码
        String text = producer.createText();
        //生成图片验证码
        BufferedImage image = producer.createImage(text);
        //保存到shiro session
        ShiroUtils.setSessionAttribute(Constants.KAPTCHA_SESSION_KEY, text);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
	}

	/**
	 * 登陆是否需要输入验证码
	 * @return
	 */
	@GetMapping("/sys/captcha")
	@ResponseBody
	public R geterrorNumber(HttpSession session){
		//判断次数
		Integer errorNum = (Integer) session.getAttribute(errorNumber);
		if (captchaErrorNumber==null){
			captchaErrorNumber = 0;
		}
		if(errorNum == null||errorNum < captchaErrorNumber){
			return R.ok().put("code",0);
		}else{
			return R.error("请求次数过多,需要显示验证码").put("code",1);
		}
	}

	
	/**
	 * 登录
	 */
	@ResponseBody
	@RequestMapping(value = "/sys/login", method = RequestMethod.POST)
	public R login(String username, String password, String captcha,HttpSession session) {
		String kaptcha = ShiroUtils.getKaptcha(Constants.KAPTCHA_SESSION_KEY);
		//验证码输错次数
		Integer errorNum = (Integer) session.getAttribute(errorNumber);
		if (captchaErrorNumber==null){
			captchaErrorNumber = 0;
		}
		if(errorNum != null&&errorNum >= captchaErrorNumber){
			if(!captcha.equalsIgnoreCase(kaptcha)){
				return R.error("验证码不正确");
			}
		}

		try{
			Subject subject = ShiroUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			subject.login(token);
		}catch (UnknownAccountException e) {
			addErrorNumber(session);
			return R.error(e.getMessage());
		}catch (IncorrectCredentialsException e) {
			addErrorNumber(session);
			return R.error("账号或密码不正确");
		}catch (LockedAccountException e) {
			addErrorNumber(session);
			return R.error("账号已被锁定,请联系管理员");
		}catch (AuthenticationException e) {
			addErrorNumber(session);
			return R.error("账户验证失败");
		}
	    
		return R.ok();
	}

	/**
	 * 增加验证错误次数
	 */
	private void addErrorNumber(HttpSession session) {
		Integer errorNum = (Integer) session.getAttribute(errorNumber);
		session.setAttribute(errorNumber, (errorNum==null?0:errorNum) + 1);
	}


	/**
	 * 退出
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {
		ShiroUtils.logout();
		return "redirect:login.html";
	}
	
}
