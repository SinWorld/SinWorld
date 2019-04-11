package com.hmp.userInforMation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.hmp.userInforMation.dao.ProvinceAndCityDao;
import com.hmp.userInforMation.service.inter.ProvinceAndCityService;

@Service
public class ProvinceAndCityServiceImpl implements ProvinceAndCityService {
	@Autowired
	private ProvinceAndCityDao provinceAndCityDao;

	// 查询出所有的省
	public JSONArray queryProvince() {
		return provinceAndCityDao.queryProvince();
	}

	// 省市联动
	public JSONArray shengShiLD(Integer ShengDM) {
		return provinceAndCityDao.shengShiLD(ShengDM);
	}

}
