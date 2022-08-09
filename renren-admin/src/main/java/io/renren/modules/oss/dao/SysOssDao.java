/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.oss.dao;

import io.renren.common.dao.BaseDao;
import io.renren.modules.oss.entity.SysOssEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 文件上传
 * 
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface SysOssDao extends BaseDao<SysOssEntity> {
	
}
