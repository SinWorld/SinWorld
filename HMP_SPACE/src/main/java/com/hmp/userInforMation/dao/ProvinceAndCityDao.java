package com.hmp.userInforMation.dao;

import com.alibaba.fastjson.JSONArray;

//省市联动DAO
public interface ProvinceAndCityDao {
	//查询所有的省
	public JSONArray queryProvince();
	//省市进行二级联动
	public JSONArray shengShiLD(Integer shengDM);
}
