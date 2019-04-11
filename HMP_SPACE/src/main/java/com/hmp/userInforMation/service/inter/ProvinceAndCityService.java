package com.hmp.userInforMation.service.inter;

import com.alibaba.fastjson.JSONArray;

//省市联动Service
public interface ProvinceAndCityService {
	//查询出所有的省
	public JSONArray queryProvince();

	// 省市进行二级联动
	public JSONArray shengShiLD(Integer ShengDM);
}
