/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.job.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.common.constant.Constant;
import io.renren.common.page.PageData;
import io.renren.common.service.impl.BaseServiceImpl;
import io.renren.common.utils.ConvertUtils;
import io.renren.modules.job.dao.ScheduleJobDao;
import io.renren.modules.job.dto.ScheduleJobDTO;
import io.renren.modules.job.entity.ScheduleJobEntity;
import io.renren.modules.job.service.ScheduleJobService;
import io.renren.modules.job.utils.ScheduleUtils;
import org.apache.commons.lang3.StringUtils;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ScheduleJobServiceImpl extends BaseServiceImpl<ScheduleJobDao, ScheduleJobEntity> implements ScheduleJobService {
	@Autowired
	private Scheduler scheduler;

	@Override
	public PageData<ScheduleJobDTO> page(Map<String, Object> params) {
		IPage<ScheduleJobEntity> page = baseDao.selectPage(
			getPage(params, Constant.CREATE_DATE, false),
			getWrapper(params)
		);
		return getPageData(page, ScheduleJobDTO.class);
	}

	@Override
	public ScheduleJobDTO get(Long id) {
		ScheduleJobEntity entity = baseDao.selectById(id);

		return ConvertUtils.sourceToTarget(entity, ScheduleJobDTO.class);
	}

	private QueryWrapper<ScheduleJobEntity> getWrapper(Map<String, Object> params){
		String beanName = (String)params.get("beanName");

		QueryWrapper<ScheduleJobEntity> wrapper = new QueryWrapper<>();
		wrapper.like(StringUtils.isNotBlank(beanName), "bean_name", beanName);

		return wrapper;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void save(ScheduleJobDTO dto) {
		ScheduleJobEntity entity = ConvertUtils.sourceToTarget(dto, ScheduleJobEntity.class);

		entity.setStatus(Constant.ScheduleStatus.NORMAL.getValue());
        this.insert(entity);
        
        ScheduleUtils.createScheduleJob(scheduler, entity);
    }
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void update(ScheduleJobDTO dto) {
		ScheduleJobEntity entity = ConvertUtils.sourceToTarget(dto, ScheduleJobEntity.class);

        ScheduleUtils.updateScheduleJob(scheduler, entity);
                
        this.updateById(entity);
    }

	@Override
	@Transactional(rollbackFor = Exception.class)
    public void deleteBatch(Long[] ids) {
    	for(Long id : ids){
    		ScheduleUtils.deleteScheduleJob(scheduler, id);
    	}
    	
    	//删除数据
    	this.deleteBatchIds(Arrays.asList(ids));
	}

	@Override
    public int updateBatch(Long[] ids, int status){
    	Map<String, Object> map = new HashMap<>(2);
    	map.put("ids", ids);
    	map.put("status", status);
    	return baseDao.updateBatch(map);
    }
    
	@Override
	@Transactional(rollbackFor = Exception.class)
    public void run(Long[] ids) {
    	for(Long id : ids){
    		ScheduleUtils.run(scheduler, this.selectById(id));
    	}
    }

	@Override
	@Transactional(rollbackFor = Exception.class)
    public void pause(Long[] ids) {
        for(Long id : ids){
    		ScheduleUtils.pauseJob(scheduler, id);
    	}
        
    	updateBatch(ids, Constant.ScheduleStatus.PAUSE.getValue());
    }

	@Override
	@Transactional(rollbackFor = Exception.class)
    public void resume(Long[] ids) {
    	for(Long id : ids){
    		ScheduleUtils.resumeJob(scheduler, id);
    	}

    	updateBatch(ids, Constant.ScheduleStatus.NORMAL.getValue());
    }
    
}