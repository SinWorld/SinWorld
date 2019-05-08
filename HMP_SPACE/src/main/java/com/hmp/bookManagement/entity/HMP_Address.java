package com.hmp.bookManagement.entity;

/**
 * 收货地址实体类
 * 
 * @author NingCG
 *
 */
public class HMP_Address {
	private Integer address_id;// 主键
	private String address_name;// 收件人姓名
	private String address_phone;// 联系方式
	private String address_adr;// 收货地址
	private Integer user_id;// 用户主键

	public String getAddress_phone() {
		return address_phone;
	}

	public void setAddress_phone(String address_phone) {
		this.address_phone = address_phone;
	}

	public Integer getAddress_id() {
		return address_id;
	}

	public void setAddress_id(Integer address_id) {
		this.address_id = address_id;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

	public String getAddress_adr() {
		return address_adr;
	}

	public void setAddress_adr(String address_adr) {
		this.address_adr = address_adr;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "HMP_Address [address_id=" + address_id + ", address_name=" + address_name + ", address_adr="
				+ address_adr + ", address_phone=" + address_phone + ", user_id=" + user_id + "]";
	}

}
