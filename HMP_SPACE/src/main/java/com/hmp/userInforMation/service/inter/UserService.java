package com.hmp.userInforMation.service.inter;

import org.apache.ibatis.annotations.Param;

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
	
	//安全中心用户修改密码
	public void updatePassword(UserInforMation user);
	
	//找回密码根据用户名返回对象
	public UserInforMation queryUserByName(@Param("userName")String  userName);
	
	//修改该对象的验证码值
	public void editUserCode(UserInforMation user);
}
