/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.common.constant.Constant;
import io.renren.common.page.PageData;
import io.renren.common.service.impl.BaseServiceImpl;
import io.renren.common.utils.ConvertUtils;
import io.renren.modules.security.user.SecurityUser;
import io.renren.modules.security.user.UserDetail;
import io.renren.modules.sys.dao.SysRoleDao;
import io.renren.modules.sys.dto.SysRoleDTO;
import io.renren.modules.sys.entity.SysRoleEntity;
import io.renren.modules.sys.enums.SuperAdminEnum;
import io.renren.modules.sys.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 角色
 * 
 * @author Mark sunlightcs@gmail.com
 */
@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRoleDao, SysRoleEntity> implements SysRoleService {
	@Autowired
	private SysRoleMenuService sysRoleMenuService;
	@Autowired
	private SysRoleDataScopeService sysRoleDataScopeService;
	@Autowired
	private SysRoleUserService sysRoleUserService;
	@Autowired
	private SysDeptService sysDeptService;

	@Override
	public PageData<SysRoleDTO> page(Map<String, Object> params) {
		IPage<SysRoleEntity> page = baseDao.selectPage(
			getPage(params, Constant.CREATE_DATE, false),
			getWrapper(params)
		);

		return getPageData(page, SysRoleDTO.class);
	}

	@Override
	public List<SysRoleDTO> list(Map<String, Object> params) {
		List<SysRoleEntity> entityList = baseDao.selectList(getWrapper(params));

		return ConvertUtils.sourceToTarget(entityList, SysRoleDTO.class);
	}

	private QueryWrapper<SysRoleEntity> getWrapper(Map<String, Object> params){
		String name = (String)params.get("name");

		QueryWrapper<SysRoleEntity> wrapper = new QueryWrapper<>();
		wrapper.like(StringUtils.isNotBlank(name), "name", name);

		//普通管理员，只能查询所属部门及子部门的数据
		UserDetail user = SecurityUser.getUser();
		if(user.getSuperAdmin() == SuperAdminEnum.NO.value()) {
			List<Long> deptIdList = sysDeptService.getSubDeptIdList(user.getDeptId());
			wrapper.in(deptIdList != null, "dept_id", deptIdList);
		}

		return wrapper;
	}

	@Override
	public SysRoleDTO get(Long id) {
		SysRoleEntity entity = baseDao.selectById(id);

		return ConvertUtils.sourceToTarget(entity, SysRoleDTO.class);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void save(SysRoleDTO dto) {
		SysRoleEntity entity = ConvertUtils.sourceToTarget(dto, SysRoleEntity.class);

		//保存角色
		insert(entity);

		//保存角色菜单关系
		sysRoleMenuService.saveOrUpdate(entity.getId(), dto.getMenuIdList());

		//保存角色数据权限关系
		sysRoleDataScopeService.saveOrUpdate(entity.getId(), dto.getDeptIdList());
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void update(SysRoleDTO dto) {
		SysRoleEntity entity = ConvertUtils.sourceToTarget(dto, SysRoleEntity.class);

		//更新角色
		updateById(entity);

		//更新角色菜单关系
		sysRoleMenuService.saveOrUpdate(entity.getId(), dto.getMenuIdList());

		//更新角色数据权限关系
		sysRoleDataScopeService.saveOrUpdate(entity.getId(), dto.getDeptIdList());
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void delete(Long[] ids) {
		//删除角色
		baseDao.deleteBatchIds(Arrays.asList(ids));

		//删除角色用户关系
		sysRoleUserService.deleteByRoleIds(ids);

		//删除角色菜单关系
		sysRoleMenuService.deleteByRoleIds(ids);

		//删除角色数据权限关系
		sysRoleDataScopeService.deleteByRoleIds(ids);
	}

}