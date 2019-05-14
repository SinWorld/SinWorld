package com.hmp.borrow.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 租借明細实体类
 * @author NingCG
 *
 */
public class HMP_Borrow_Detail {
	private Integer fborrow_detail_id;//主键
	private Integer book_id;//书籍主键
	private Boolean is_return;//是否已归还
	private Integer user_id;//用户主键
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date borrow_time;//借阅时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date appoint_return_time;//约定还书时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reality_return_time;//实际还书时间 
	public Integer getFborrow_detail_id() {
		return fborrow_detail_id;
	}
	public void setFborrow_detail_id(Integer fborrow_detail_id) {
		this.fborrow_detail_id = fborrow_detail_id;
	}
	public Integer getBook_id() {
		return book_id;
	}
	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}
	public Boolean getIs_return() {
		return is_return;
	}
	public void setIs_return(Boolean is_return) {
		this.is_return = is_return;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Date getBorrow_time() {
		return borrow_time;
	}
	public void setBorrow_time(Date borrow_time) {
		this.borrow_time = borrow_time;
	}
	public Date getAppoint_return_time() {
		return appoint_return_time;
	}
	public void setAppoint_return_time(Date appoint_return_time) {
		this.appoint_return_time = appoint_return_time;
	}
	public Date getReality_return_time() {
		return reality_return_time;
	}
	public void setReality_return_time(Date reality_return_time) {
		this.reality_return_time = reality_return_time;
	}
	@Override
	public String toString() {
		return "HMP_Borrow_Detail [fborrow_detail_id=" + fborrow_detail_id + ", book_id=" + book_id + ", is_return="
				+ is_return + ", user_id=" + user_id + ", borrow_time=" + borrow_time + ", appoint_return_time="
				+ appoint_return_time + ", reality_return_time=" + reality_return_time + "]";
	}
}
