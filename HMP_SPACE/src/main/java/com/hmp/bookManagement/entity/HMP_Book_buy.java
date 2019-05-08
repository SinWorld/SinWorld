package com.hmp.bookManagement.entity;

import java.util.Date;

/**
 * 商品购买类
 * 
 * @author NingCG
 *
 */
public class HMP_Book_buy {
	private Integer book_buy_id;// 主键
	private Integer user_id;// 用户主键
	private Integer book_id;// 书籍主键
	private Date book_buy_time;// 购买时间
	private Integer book_buy_count;// 购买时间
	private Float buy_sum;// 商品小計
	private Integer message_id;// 关联购物订单表
	private Integer address_id;// 关联购物地址表

	public Integer getBook_buy_id() {
		return book_buy_id;
	}

	public void setBook_buy_id(Integer book_buy_id) {
		this.book_buy_id = book_buy_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getBook_id() {
		return book_id;
	}

	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}

	public Date getBook_buy_time() {
		return book_buy_time;
	}

	public void setBook_buy_time(Date book_buy_time) {
		this.book_buy_time = book_buy_time;
	}

	public Integer getBook_buy_count() {
		return book_buy_count;
	}

	public void setBook_buy_count(Integer book_buy_count) {
		this.book_buy_count = book_buy_count;
	}

	public Float getBuy_sum() {
		return buy_sum;
	}

	public void setBuy_sum(Float buy_sum) {
		this.buy_sum = buy_sum;
	}

	public Integer getMessage_id() {
		return message_id;
	}

	public void setMessage_id(Integer message_id) {
		this.message_id = message_id;
	}

	public Integer getAddress_id() {
		return address_id;
	}

	public void setAddress_id(Integer address_id) {
		this.address_id = address_id;
	}

	@Override
	public String toString() {
		return "HMP_Book_buy [book_buy_id=" + book_buy_id + ", user_id=" + user_id + ", book_id=" + book_id
				+ ", book_buy_time=" + book_buy_time + ", book_buy_count=" + book_buy_count + ", buy_sum=" + buy_sum
				+ ", message_id=" + message_id + ", address_id=" + address_id + "]";
	}

}
