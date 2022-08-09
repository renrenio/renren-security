/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.controller;

import io.renren.common.annotation.LogOperation;
import io.renren.common.exception.ErrorCode;
import io.renren.common.utils.Result;
import io.renren.common.validator.AssertUtils;
import io.renren.common.validator.ValidatorUtils;
import io.renren.common.validator.group.DefaultGroup;
import io.renren.modules.security.user.SecurityUser;
import io.renren.modules.security.user.UserDetail;
import io.renren.modules.sys.dto.SysMenuDTO;
import io.renren.modules.sys.enums.MenuTypeEnum;
import io.renren.modules.security.service.ShiroService;
import io.renren.modules.sys.service.SysMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * 菜单管理
 * 
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("/sys/menu")
@Api(tags="菜单管理")
public class SysMenuController {
	@Autowired
	private SysMenuService sysMenuService;
	@Autowired
	private ShiroService shiroService;

	@GetMapping("nav")
	@ApiOperation("导航")
	public Result<List<SysMenuDTO>> nav(){
		UserDetail user = SecurityUser.getUser();
		List<SysMenuDTO> list = sysMenuService.getUserMenuList(user, MenuTypeEnum.MENU.value());

		return new Result<List<SysMenuDTO>>().ok(list);
	}

	@GetMapping("permissions")
	@ApiOperation("权限标识")
	public Result<Set<String>> permissions(){
		UserDetail user = SecurityUser.getUser();
		Set<String> set = shiroService.getUserPermissions(user);

		return new Result<Set<String>>().ok(set);
	}

	@GetMapping("list")
	@ApiOperation("列表")
	@ApiImplicitParam(name = "type", value = "菜单类型 0：菜单 1：按钮  null：全部", paramType = "query", dataType="int")
	@RequiresPermissions("sys:menu:list")
	public Result<List<SysMenuDTO>> list(Integer type){
		List<SysMenuDTO> list = sysMenuService.getAllMenuList(type);

		return new Result<List<SysMenuDTO>>().ok(list);
	}

	@GetMapping("{id}")
	@ApiOperation("信息")
	@RequiresPermissions("sys:menu:info")
	public Result<SysMenuDTO> get(@PathVariable("id") Long id){
		SysMenuDTO data = sysMenuService.get(id);

		return new Result<SysMenuDTO>().ok(data);
	}

	@PostMapping
	@ApiOperation("保存")
	@LogOperation("保存")
	@RequiresPermissions("sys:menu:save")
	public Result save(@RequestBody SysMenuDTO dto){
		//效验数据
		ValidatorUtils.validateEntity(dto, DefaultGroup.class);

		sysMenuService.save(dto);

		return new Result();
	}

	@PutMapping
	@ApiOperation("修改")
	@LogOperation("修改")
	@RequiresPermissions("sys:menu:update")
	public Result update(@RequestBody SysMenuDTO dto){
		//效验数据
		ValidatorUtils.validateEntity(dto, DefaultGroup.class);

		sysMenuService.update(dto);

		return new Result();
	}

	@DeleteMapping("{id}")
	@ApiOperation("删除")
	@LogOperation("删除")
	@RequiresPermissions("sys:menu:delete")
	public Result delete(@PathVariable("id") Long id){
		//效验数据
		AssertUtils.isNull(id, "id");

		//判断是否有子菜单或按钮
		List<SysMenuDTO> list = sysMenuService.getListPid(id);
		if(list.size() > 0){
			return new Result().error(ErrorCode.SUB_MENU_EXIST);
		}

		sysMenuService.delete(id);

		return new Result();
	}

	@GetMapping("select")
	@ApiOperation("角色菜单权限")
	@RequiresPermissions("sys:menu:select")
	public Result<List<SysMenuDTO>> select(){
		UserDetail user = SecurityUser.getUser();
		List<SysMenuDTO> list = sysMenuService.getUserMenuList(user, null);

		return new Result<List<SysMenuDTO>>().ok(list);
	}
}