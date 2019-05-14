package com.hmp.utils;
/**
 * 我的租借 工具实体类
 * @author NingCG
 *
 */

import java.util.ArrayList;
import java.util.List;

import com.hmp.bookManagement.entity.BookInforMation;

public class MyBorrow {
	private Integer FBORROW_DETAIL_ID;//主键
	private Integer book_id;//书籍主键
	private Integer count;//借阅数量
	private String borrowDate;//借阅日期
	private String appoint_return_time;//约定归还日期
	private String reality_return_time;//实际归还日期
	private Boolean is_return;//是否归还
	private Integer user_id;//用户主键
	private BookInforMation book;//书籍对象
	private List<Integer> ids=new ArrayList<Integer>();//用于存储主键值
	
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(Integer ids) {
		this.ids.add(ids);
	}
	public BookInforMation getBook() {
		return book;
	}
	public void setBook(BookInforMation book) {
		this.book = book;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getFBORROW_DETAIL_ID() {
		return FBORROW_DETAIL_ID;
	}
	public void setFBORROW_DETAIL_ID(Integer fBORROW_DETAIL_ID) {
		FBORROW_DETAIL_ID = fBORROW_DETAIL_ID;
	}
	public Integer getBook_id() {
		return book_id;
	}
	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getBorrowDate() {
		return borrowDate;
	}
	public void setBorrowDate(String borrowDate) {
		this.borrowDate = borrowDate;
	}
	public String getAppoint_return_time() {
		return appoint_return_time;
	}
	public void setAppoint_return_time(String appoint_return_time) {
		this.appoint_return_time = appoint_return_time;
	}
	public String getReality_return_time() {
		return reality_return_time;
	}
	public void setReality_return_time(String reality_return_time) {
		this.reality_return_time = reality_return_time;
	}
	public Boolean getIs_return() {
		return is_return;
	}
	public void setIs_return(Boolean is_return) {
		this.is_return = is_return;
	}
	@Override
	public String toString() {
		return "MyBorrow [FBORROW_DETAIL_ID=" + FBORROW_DETAIL_ID + ", book_id=" + book_id + ", count=" + count
				+ ", borrowDate=" + borrowDate + ", appoint_return_time=" + appoint_return_time
				+ ", reality_return_time=" + reality_return_time + ", is_return=" + is_return + ", user_id=" + user_id
				+ ", book=" + book + ", ids=" + ids + "]";
	}
}
