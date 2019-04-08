package com.hmp.userInforMation.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmp.userInforMation.entity.UserInforMation;
import com.hmp.userInforMation.service.inter.UserService;

@Controller
@RequestMapping("user/")
public class UserController {
	@Resource
	private UserService userService;

	@RequestMapping("/initUser")
	public String initUser() {
		return "user/index";
	}

	@RequestMapping("/addUser")
	public String addUser(@RequestParam Long id, String userName, String passworld) {
		UserInforMation user = new UserInforMation();
		user.setId(id);
		user.setUserName(userName);
		user.setPassworld(passworld);
		userService.addUser(user);
		return "userView";
	}
	
	@RequestMapping("/register")
	public String initUi() {
		return "user/register";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
}
