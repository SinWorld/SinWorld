package com.hmp.utils;
/**
 * 购物车工具类
 * @author NingCG
 *
 */

import com.hmp.bookManagement.entity.BookInforMation;

public class ShopCart {
	private BookInforMation bookInforMation;// 商品
	private Integer count;// 购买该商品的数量
	private float totalPrice;// 购买该数量的商品小计
	private float subTotalPrice;// 购买所有商品的总计

	public BookInforMation getBookInforMation() {
		return bookInforMation;
	}

	public void setBookInforMation(BookInforMation bookInforMation) {
		this.bookInforMation = bookInforMation;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public float getSubTotalPrice() {
		return subTotalPrice;
	}

	public void setSubTotalPrice(float subTotalPrice) {
		this.subTotalPrice = subTotalPrice;
	}

	@Override
	public String toString() {
		return "ShopCart [bookInforMation=" + bookInforMation + ", count=" + count + ", totalPrice=" + totalPrice
				+ ", subTotalPrice=" + subTotalPrice + "]";
	}

}
