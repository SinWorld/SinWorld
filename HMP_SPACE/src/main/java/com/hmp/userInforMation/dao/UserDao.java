package com.hmp.userInforMation.dao;

import org.springframework.stereotype.Repository;

import com.hmp.userInforMation.entity.UserInforMation;

@Repository
public interface UserDao {
	public abstract void addUser(UserInforMation user);
}
