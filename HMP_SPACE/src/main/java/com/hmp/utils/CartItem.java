package com.hmp.utils;
/**
 * 购物项实体类
 * @author NingCG
 *
 */

import com.hmp.bookManagement.entity.BookInforMation;

public class CartItem {
	private BookInforMation book;// 图书商品
	private Integer count;// 购买某种商品的数量
	private Float subTotal;// 购买某种商品小计

	public BookInforMation getBook() {
		return book;
	}

	public void setBook(BookInforMation book) {
		this.book = book;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	// 小计自动计算
	public Float getSubTotal() {
		return count * book.getBook_price();
	}

}
