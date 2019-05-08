package com.hmp.bookManagement.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 图书购物车表
 * 
 * @author NingCG
 *
 */
public class HMP_Book_Cart {
	private Integer book_shopping_id;// 主键
	private Integer user_id;// 用户主键
	private Integer book_id;// 书籍主键
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date shopping_time;// 购买时间
	private Boolean flag;// 是否删除
	private Boolean iszf;// 是否支付

	public Boolean getIszf() {
		return iszf;
	}

	public void setIszf(Boolean iszf) {
		this.iszf = iszf;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	public Integer getBook_shopping_id() {
		return book_shopping_id;
	}

	public void setBook_shopping_id(Integer book_shopping_id) {
		this.book_shopping_id = book_shopping_id;
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

	public Date getShopping_time() {
		return shopping_time;
	}

	public void setShopping_time(Date shopping_time) {
		this.shopping_time = shopping_time;
	}

	@Override
	public String toString() {
		return "HMP_Book_Cart [book_shopping_id=" + book_shopping_id + ", user_id=" + user_id + ", book_id=" + book_id
				+ ", shopping_time=" + shopping_time + ", flag=" + flag + ", iszf=" + iszf + "]";
	}

}
