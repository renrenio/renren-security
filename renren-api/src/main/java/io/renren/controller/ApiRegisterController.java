package io.renren.controller;


import io.renren.common.utils.R;
import io.renren.common.validator.Assert;
import io.renren.entity.UserEntity;
import io.renren.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 注册
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-26 17:27
 */
@RestController
@RequestMapping("/app")
@Api("APP注册接口")
public class ApiRegisterController {
    @Autowired
    private UserService userService;

    @PostMapping("register")
    @ApiOperation("注册")
    public R register(String mobile, String password){
        Assert.isBlank(mobile, "手机号不能为空");
        Assert.isBlank(password, "密码不能为空");

        UserEntity user = new UserEntity();
        user.setMobile(mobile);
        user.setUsername(mobile);
        user.setPassword(DigestUtils.sha256Hex(password));
        user.setCreateTime(new Date());
        userService.insert(user);

        return R.ok();
    }
}
