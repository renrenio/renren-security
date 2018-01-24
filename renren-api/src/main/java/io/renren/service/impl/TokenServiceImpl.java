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

package io.renren.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.renren.dao.TokenDao;
import io.renren.entity.TokenEntity;
import io.renren.service.TokenService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


@Service("tokenService")
public class TokenServiceImpl extends ServiceImpl<TokenDao, TokenEntity> implements TokenService {
	//12小时后过期
	private final static int EXPIRE = 3600 * 12;

	@Override
	public TokenEntity queryByToken(String token) {
		return this.selectOne(new EntityWrapper<TokenEntity>().eq("token", token));
	}

	@Override
	public Map<String, Object> createToken(long userId) {
		//生成一个token
		String token = UUID.randomUUID().toString();
		//当前时间
		Date now = new Date();

		//过期时间
		Date expireTime = new Date(now.getTime() + EXPIRE * 1000);

		//判断是否生成过token
		TokenEntity tokenEntity = this.selectById(userId);
		if(tokenEntity == null){
			tokenEntity = new TokenEntity();
			tokenEntity.setUserId(userId);
			tokenEntity.setToken(token);
			tokenEntity.setUpdateTime(now);
			tokenEntity.setExpireTime(expireTime);

			//保存token
			this.insert(tokenEntity);
		}else{
			tokenEntity.setToken(token);
			tokenEntity.setUpdateTime(now);
			tokenEntity.setExpireTime(expireTime);

			//更新token
			this.updateById(tokenEntity);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("token", token);
		map.put("expire", EXPIRE);

		return map;
	}
}
