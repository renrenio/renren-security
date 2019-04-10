/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.dao.TokenDao;
import io.renren.entity.TokenEntity;
import io.renren.service.TokenService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;


@Service("tokenService")
public class TokenServiceImpl extends ServiceImpl<TokenDao, TokenEntity> implements TokenService {
	/**
	 * 12小时后过期
	 */
	private final static int EXPIRE = 3600 * 12;

	@Override
	public TokenEntity queryByToken(String token) {
		return this.getOne(new QueryWrapper<TokenEntity>().eq("token", token));
	}

	@Override
	public TokenEntity createToken(long userId) {
		//当前时间
		Date now = new Date();
		//过期时间
		Date expireTime = new Date(now.getTime() + EXPIRE * 1000);

		//生成token
		String token = generateToken();

		//保存或更新用户token
		TokenEntity tokenEntity = new TokenEntity();
		tokenEntity.setUserId(userId);
		tokenEntity.setToken(token);
		tokenEntity.setUpdateTime(now);
		tokenEntity.setExpireTime(expireTime);
		this.saveOrUpdate(tokenEntity);

		return tokenEntity;
	}

	@Override
	public void expireToken(long userId){
		Date now = new Date();

		TokenEntity tokenEntity = new TokenEntity();
		tokenEntity.setUserId(userId);
		tokenEntity.setUpdateTime(now);
		tokenEntity.setExpireTime(now);
		this.saveOrUpdate(tokenEntity);
	}

	private String generateToken(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}
