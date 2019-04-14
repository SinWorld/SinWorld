package com.hmp.userInforMation.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.hmp.userInforMation.dao.UserDao;
import com.hmp.userInforMation.entity.City;
import com.hmp.userInforMation.entity.Province;
import com.hmp.userInforMation.entity.UserInforMation;
import com.hmp.userInforMation.service.inter.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	//新增用户
	public void addUser(UserInforMation user) {
		userDao.addUser(user);
	}
	
	//用户登陆
	public UserInforMation login(String userName, String password) {
		return userDao.login(userName, password);
	}
	//用户信息展现
	public JSONArray userShow(Integer user_id) {
		return userDao.userShow(user_id);
	}
	//通过主键查询用户
	public UserInforMation queryUserById(Integer user_id) {
		return userDao.queryUserById(user_id);
	}
	//通过主键查询用户所在省
	public Province queryProvince(Integer provinceDm) {
		return userDao.queryProvince(provinceDm);
	}
	//通过主键查询用户所在市
	public City queryCity(Integer cityDm) {
		return userDao.queryCity(cityDm);
	}
	//修改用户信息
	public void editUser(UserInforMation user) {
		userDao.editUser(user);
	}

	public void updatePassword(UserInforMation user) {
		userDao.updatePassword(user);
	}
	//找回密码根据用户名找到对应的对象
	public UserInforMation queryUserByName(String userName) {
		return userDao.queryUserByName(userName);
	}
	//修改该对象的验证码值
	public void editUserCode(UserInforMation user) {
		userDao.editUserCode(user);
	}
	

}
