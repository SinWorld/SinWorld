package com.hmp.utils;

import java.util.ArrayList;
import java.util.List;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

/**
 * 测试类
 * 
 * @author NingCG
 *
 */

public class Demo {

	public static void main(String[] args) {
		List<Integer> result = test();
		for (Integer r : result) {
			System.out.print(r + " ");
		}
	}

	public static List<Integer> test() {
		// 规定时间内随机生成随机数消耗完以2000为例
		int a = 2000;
		// 定义随机数生成2000以内的随机数
		int x;
		// 消耗次数
		int temp = 0;
		// 假设规定一分钟消耗完
		int time = 60;
		// 结果 初始化
		int result = 0;
		// 定义一集合去接收结果
		List<Integer> b = new ArrayList<Integer>();
		while (time >= 0) {
			// 第一次开始产生的随机数应小于等于2000
			if (temp == 0) {
				x = (int) (Math.random() * a + 1);
				// 剩余金额
				result = a - x;
				temp++;
				time--;
				if (time == 0) {
					result = x;
					result = result - x;
					b.add(x);
					return b;
				}
				b.add(x);
				if (result == 0) {
					return b;
				}
			} else {
				// 不是第一次
				// 随机数为0-结果集
				x = (int) (Math.random() * result + 1);
				result = result - x;
				temp++;
				time--;
				if (time == 0) {
					result = x;
					result = result - x;
					b.add(x);
					return b;
				}
				b.add(x);
				if (result == 0) {
					return b;
				}
			}
		}

		return null;
	}
}
