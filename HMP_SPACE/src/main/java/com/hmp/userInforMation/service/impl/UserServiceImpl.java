package com.hmp.userInforMation.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hmp.userInforMation.dao.UserDao;
import com.hmp.userInforMation.entity.UserInforMation;
import com.hmp.userInforMation.service.inter.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	public void addUser(UserInforMation user) {
		userDao.addUser(user);
	}

}
