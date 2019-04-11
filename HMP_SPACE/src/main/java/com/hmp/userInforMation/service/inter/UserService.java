package com.hmp.userInforMation.service.inter;

import com.alibaba.fastjson.JSONArray;
import com.hmp.userInforMation.entity.City;
import com.hmp.userInforMation.entity.Province;
import com.hmp.userInforMation.entity.UserInforMation;

public interface UserService {
	// 新增用户
	public void addUser(UserInforMation user);

	// 用户登录模块
	public UserInforMation login(String userName, String password);

	// 用户信息展现
	public JSONArray userShow(Integer user_id);

	// 用户基本资料查询
	public UserInforMation queryUserById(Integer user_id);

	// 字典表查询用户省市
	public Province queryProvince(Integer provinceDm);

	// 字典表查询用户市
	public City queryCity(Integer cityDm);

	// 修改用户信息
	public void editUser(UserInforMation user);
}
