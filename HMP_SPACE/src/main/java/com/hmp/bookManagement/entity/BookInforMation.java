package com.hmp.bookManagement.entity;

/**
 * 书籍实体类
 * 
 * @author NingCG
 *
 */
public class BookInforMation {
	private Integer book_id;// 主键
	private String book_name;// 书籍名称
	private String book_author;// 作者
	private String book_press;// 出版社
	private String book_version;// 版本
	private Float book_price;// 价格
	private String book_image;// 图书照片
	private Integer book_type;// 种类
	private String book_synopsis;// 书籍简介
	private Boolean is_collection;// 是否收藏
	private Integer user_id;// 用户主键 用于是谁收藏

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Boolean getIs_collection() {
		return is_collection;
	}

	public void setIs_collection(Boolean is_collection) {
		this.is_collection = is_collection;
	}

	public Integer getBook_id() {
		return book_id;
	}

	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_press() {
		return book_press;
	}

	public void setBook_press(String book_press) {
		this.book_press = book_press;
	}

	public String getBook_version() {
		return book_version;
	}

	public void setBook_version(String book_version) {
		this.book_version = book_version;
	}

	public Float getBook_price() {
		return book_price;
	}

	public void setBook_price(Float book_price) {
		this.book_price = book_price;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public Integer getBook_type() {
		return book_type;
	}

	public void setBook_type(Integer book_type) {
		this.book_type = book_type;
	}

	public String getBook_synopsis() {
		return book_synopsis;
	}

	public void setBook_synopsis(String book_synopsis) {
		this.book_synopsis = book_synopsis;
	}

	@Override
	public String toString() {
		return "BookInforMation [book_id=" + book_id + ", book_name=" + book_name + ", book_author=" + book_author
				+ ", book_press=" + book_press + ", book_version=" + book_version + ", book_price=" + book_price
				+ ", book_image=" + book_image + ", book_type=" + book_type + ", book_synopsis=" + book_synopsis
				+ ", is_collection=" + is_collection + ", user_id=" + user_id + "]";
	}

}
