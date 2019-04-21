package com.hmp.utils;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 购物车实体类
 * 
 * @author NingCG
 *
 */
public class Cart implements Serializable{
	// 购物车属性
	// 购物项的集合，map的key就是图书商品的主键book_id,value就是购物项 linkedHashMap是有序的
	private Map<Integer, CartItem> map = new LinkedHashMap<Integer, CartItem>();
	// 购物总计
	private float total;

	public float getTotal() {
		return total;
	}

	// Cart对象中有一个叫cartItems属性.
	public Collection<CartItem> getCartItems() {
		return map.values();
	}

	// 购物车的功能:
	// 1.将购物项添加到购物车：
	/**
	 * *如果存在： *数量增加 *总计=总计+购物项小计 *如果不存在： *向map中添加购物项 *总计=总计+购物项小计
	 */
	public void addCart(CartItem cartItem) {
		// 获得图书id
		Integer book_id = cartItem.getBook().getBook_id();
		// 判断购物车中是否存在该购物项
		if (map.containsKey(book_id)) {
			// 存在
			CartItem oldCartItem = map.get(book_id);// 获得购物车中原来的购物项
			oldCartItem.setCount(oldCartItem.getCount() + cartItem.getCount());// 设置小计
			// 设置总计的值
			total +=cartItem.getSubTotal();
		} else {
			// 不存在
			map.put(book_id, cartItem);
			// 初始化设置总计的值
			total=0.0f;
			total +=cartItem.getSubTotal();
		}
		
		
		
	}

	// 2.从购物车中移除购物项:
	public void removeCart(Integer bookId) {
		// 将购物项移除购物车:
		CartItem cartItem = map.remove(bookId);
		// 总计=总计-移除的购物项小计:
		total -= cartItem.getSubTotal();
	}

	// 3.清空购物车
	public void clearCart() {
		// 将所有的购物项清空
		map.clear();
		// 将总计设置为0
		total = 0f;
	}
}
