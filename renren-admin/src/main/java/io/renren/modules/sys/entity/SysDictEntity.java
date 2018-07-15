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

package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 数据字典
 *
 * @author Mark sunlightcs@gmail.com
 * @since 3.1.0 2018-01-27
 */
@TableName("sys_dict")
public class SysDictEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@TableId
	private Long id;
	/**
	 * 字典名称
	 */
	@NotBlank(message="字典名称不能为空")
	private String name;
	/**
	 * 字典类型
	 */
	@NotBlank(message="字典类型不能为空")
	private String type;
	/**
	 * 字典码
	 */
	@NotBlank(message="字典码不能为空")
	private String code;
	/**
	 * 字典值
	 */
	@NotBlank(message="字典值不能为空")
	private String value;
	/**
	 * 排序
	 */
	private Integer orderNum;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 删除标记  -1：已删除  0：正常
	 */
	@TableLogic
	private Integer delFlag;

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：字典名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：字典名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：字典类型
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 获取：字典类型
	 */
	public String getType() {
		return type;
	}
	/**
	 * 设置：字典码
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * 获取：字典码
	 */
	public String getCode() {
		return code;
	}
	/**
	 * 设置：字典值
	 */
	public void setValue(String value) {
		this.value = value;
	}
	/**
	 * 获取：字典值
	 */
	public String getValue() {
		return value;
	}
	/**
	 * 设置：排序
	 */
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	/**
	 * 获取：排序
	 */
	public Integer getOrderNum() {
		return orderNum;
	}
	/**
	 * 设置：备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：备注
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * 设置：删除标记  -1：已删除  0：正常
	 */
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}
	/**
	 * 获取：删除标记  -1：已删除  0：正常
	 */
	public Integer getDelFlag() {
		return delFlag;
	}
}
