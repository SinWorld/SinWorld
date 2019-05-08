package com.hmp.bookManagement.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 购物订单表
 * 
 * @author NingCG
 *
 */
public class HMP_Form_Message {
	private Integer form_message_id;// 主键
	private Integer user_id;// 用户主键
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String create_time;// 创建时间
	private Float involve_money;// 订单总计金额
	private Boolean is_break;// 是否违约
	private String order_number;// 订单号

	public String getOrder_number() {
		return order_number;
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}

	public Integer getForm_message_id() {
		return form_message_id;
	}

	public void setForm_message_id(Integer form_message_id) {
		this.form_message_id = form_message_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public Float getInvolve_money() {
		return involve_money;
	}

	public void setInvolve_money(Float involve_money) {
		this.involve_money = involve_money;
	}

	public Boolean getIs_break() {
		return is_break;
	}

	public void setIs_break(Boolean is_break) {
		this.is_break = is_break;
	}

	@Override
	public String toString() {
		return "HMP_Form_Message [form_message_id=" + form_message_id + ", user_id=" + user_id + ", create_time="
				+ create_time + ", involve_money=" + involve_money + ", is_break=" + is_break + ", order_number="
				+ order_number + "]";
	}

}
