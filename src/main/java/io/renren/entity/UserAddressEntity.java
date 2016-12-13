package io.renren.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 收货地址信息表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016-12-22 15:42:53
 */
public class UserAddressEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//
	private Long userId;
	//省份，比如湖南
	private String province;
	//城市，比如长沙
	private String city;
	//区域，比如岳麓区
	private String area;
	//
	private String address;
	//
	private String name;
	//
	private String tel;
	//
	private String zip;
	//
	private Date createTime;

	/**
	 * 设置：
	 * @param id 
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
	 * 设置：
	 * @param userId 
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：省份，比如湖南
	 * @param province 省份，比如湖南
	 */
	public void setProvince(String province) {
		this.province = province;
	}
	/**
	 * 获取：省份，比如湖南
	 */
	public String getProvince() {
		return province;
	}
	/**
	 * 设置：城市，比如长沙
	 * @param city 城市，比如长沙
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * 获取：城市，比如长沙
	 */
	public String getCity() {
		return city;
	}
	/**
	 * 设置：区域，比如岳麓区
	 * @param area 区域，比如岳麓区
	 */
	public void setArea(String area) {
		this.area = area;
	}
	/**
	 * 获取：区域，比如岳麓区
	 */
	public String getArea() {
		return area;
	}
	/**
	 * 设置：
	 * @param address 
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：
	 * @param name 
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：
	 * @param tel 
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
	/**
	 * 获取：
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * 设置：
	 * @param zip 
	 */
	public void setZip(String zip) {
		this.zip = zip;
	}
	/**
	 * 获取：
	 */
	public String getZip() {
		return zip;
	}
	/**
	 * 设置：
	 * @param createTime 
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：
	 */
	public Date getCreateTime() {
		return createTime;
	}
}
