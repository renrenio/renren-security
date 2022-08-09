/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.DefaultGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 用户管理
 *
 * @author Mark sunlightcs@gmail.com
 * @since 1.0.0
 */
@Data
@ApiModel(value = "用户管理")
public class SysUserDTO implements Serializable {
    private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "id")
	@Null(message="{id.null}", groups = AddGroup.class)
	@NotNull(message="{id.require}", groups = UpdateGroup.class)
	private Long id;

	@ApiModelProperty(value = "用户名", required = true)
	@NotBlank(message="{sysuser.username.require}", groups = DefaultGroup.class)
	private String username;

	@ApiModelProperty(value = "密码")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@NotBlank(message="{sysuser.password.require}", groups = AddGroup.class)
	private String password;

	@ApiModelProperty(value = "姓名", required = true)
	@NotBlank(message="{sysuser.realname.require}", groups = DefaultGroup.class)
	private String realName;

	@ApiModelProperty(value = "头像")
	private String headUrl;

	@ApiModelProperty(value = "性别   0：男   1：女    2：保密", required = true)
	@Range(min=0, max=2, message = "{sysuser.gender.range}", groups = DefaultGroup.class)
	private Integer gender;

	@ApiModelProperty(value = "邮箱")
	@Email(message="{sysuser.email.error}", groups = DefaultGroup.class)
	private String email;

	@ApiModelProperty(value = "手机号")
	private String mobile;

	@ApiModelProperty(value = "部门ID", required = true)
	@NotNull(message="{sysuser.deptId.require}", groups = DefaultGroup.class)
	private Long deptId;

	@ApiModelProperty(value = "状态  0：停用    1：正常", required = true)
	@Range(min=0, max=1, message = "{sysuser.status.range}", groups = DefaultGroup.class)
	private Integer status;

	@ApiModelProperty(value = "创建时间")
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	private Date createDate;

	@ApiModelProperty(value = "超级管理员   0：否   1：是")
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	private Integer superAdmin;

	@ApiModelProperty(value = "角色ID列表")
	private List<Long> roleIdList;

	@ApiModelProperty(value = "部门名称")
	private String deptName;

}