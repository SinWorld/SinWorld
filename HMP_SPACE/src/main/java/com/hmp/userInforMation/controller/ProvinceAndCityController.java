package com.hmp.userInforMation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.hmp.userInforMation.service.inter.ProvinceAndCityService;

/**
 * 省市联动controller
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("user/")
public class ProvinceAndCityController {
	// 注入service
	@Autowired
	private ProvinceAndCityService provinceAndCityService;

	// 查询所有的省
	@RequestMapping(value = "/province", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String queryProvince() {
		JSONArray provinces = provinceAndCityService.queryProvince();
		return provinces.toJSONString();
	}

	// 查询所有的省
	@RequestMapping(value = "/shengShiLD", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String shengShiLD(@RequestParam Integer shengDM) {
		JSONArray jsonArray = provinceAndCityService.shengShiLD(shengDM);
		return jsonArray.toString();
	}
	
}
