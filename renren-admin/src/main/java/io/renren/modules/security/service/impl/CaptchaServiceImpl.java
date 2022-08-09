/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.security.service.impl;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.base.Captcha;
import io.renren.common.redis.RedisKeys;
import io.renren.common.redis.RedisUtils;
import io.renren.modules.security.service.CaptchaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * 验证码
 *
 * @author Mark sunlightcs@gmail.com
 */
@Service
public class CaptchaServiceImpl implements CaptchaService {
    @Autowired
    private RedisUtils redisUtils;
    @Value("${renren.redis.open: false}")
    private boolean open;
    /**
     * Local Cache  5分钟过期
     */
    Cache<String, String> localCache = CacheBuilder.newBuilder().maximumSize(1000).expireAfterAccess(5, TimeUnit.MINUTES).build();

    @Override
    public void create(HttpServletResponse response, String uuid) throws IOException {
        response.setContentType("image/gif");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //生成验证码
        SpecCaptcha captcha = new SpecCaptcha(150, 40);
        captcha.setLen(5);
        captcha.setCharType(Captcha.TYPE_DEFAULT);
        captcha.out(response.getOutputStream());

        //保存到缓存
        setCache(uuid, captcha.text());
    }

    @Override
    public boolean validate(String uuid, String code) {
        //获取验证码
        String captcha = getCache(uuid);

        //效验成功
        if(code.equalsIgnoreCase(captcha)){
            return true;
        }

        return false;
    }

    private void setCache(String key, String value){
        if(open){
            key = RedisKeys.getCaptchaKey(key);
            redisUtils.set(key, value, 300);
        }else{
            localCache.put(key, value);
        }
    }

    private String getCache(String key){
        if(open){
            key = RedisKeys.getCaptchaKey(key);
            String captcha = (String)redisUtils.get(key);
            //删除验证码
            if(captcha != null){
                redisUtils.delete(key);
            }

            return captcha;
        }

        String captcha = localCache.getIfPresent(key);
        //删除验证码
        if(captcha != null){
            localCache.invalidate(key);
        }
        return captcha;
    }
}