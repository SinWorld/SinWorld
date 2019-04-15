package com.hmp.userInforMation.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 用户实体类
 * 
 * @author NingCG
 *
 */
public class UserInforMation {
	private Integer user_id;// 主键
	private String user_name;// 用户名
	private String user_password;// 密码
	private Integer user_status;// 状态 ，关联外键
	private Integer user_sex;// 性别 ，关联外键
	private Integer user_age;// 年龄
	private String user_phone;// 联系方式
	private String user_email;// 电子邮箱
	private Integer user_province;// 省 关联外键
	private Integer user_city;// 市 关联外键
	private String user_detail_address;// 详细地址
	private String user_idCard;// 身份证号
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_brithday;// 出生年月
	private String user_code;// 验证码
	private String user_uImage;// 头像

	public String getUser_uImage() {
		return user_uImage;
	}

	public void setUser_uImage(String user_uImage) {
		this.user_uImage = user_uImage;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public Date getUser_brithday() {
		return user_brithday;
	}

	public void setUser_brithday(Date user_brithday) {
		this.user_brithday = user_brithday;
	}

	public String getUser_detail_address() {
		return user_detail_address;
	}

	public void setUser_detail_address(String user_detail_address) {
		this.user_detail_address = user_detail_address;
	}

	public String getUser_idCard() {
		return user_idCard;
	}

	public void setUser_idCard(String user_idCard) {
		this.user_idCard = user_idCard;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public Integer getUser_status() {
		return user_status;
	}

	public void setUser_status(Integer user_status) {
		this.user_status = user_status;
	}

	public Integer getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(Integer user_sex) {
		this.user_sex = user_sex;
	}

	public Integer getUser_age() {
		return user_age;
	}

	public void setUser_age(Integer user_age) {
		this.user_age = user_age;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Integer getUser_province() {
		return user_province;
	}

	public void setUser_province(Integer user_province) {
		this.user_province = user_province;
	}

	public Integer getUser_city() {
		return user_city;
	}

	public void setUser_city(Integer user_city) {
		this.user_city = user_city;
	}

	@Override
	public String toString() {
		return "UserInforMation [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_status=" + user_status + ", user_sex=" + user_sex + ", user_age=" + user_age + ", user_phone="
				+ user_phone + ", user_email=" + user_email + ", user_province=" + user_province + ", user_city="
				+ user_city + ", user_detail_address=" + user_detail_address + ", user_idCard=" + user_idCard
				+ ", user_brithday=" + user_brithday + ", user_code=" + user_code + ", user_uImage=" + user_uImage
				+ "]";
	}

}
