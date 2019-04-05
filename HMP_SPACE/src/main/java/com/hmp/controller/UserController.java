package com.hmp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmp.entity.User;
import com.hmp.service.inter.UserService;

@Controller
@RequestMapping("user/")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/initUser")
	public String initUser() {
		return "userView";
	}

	@RequestMapping("/addUser")
	public String addUser(@RequestParam Long id, String userName, String passworld) {
		User user = new User();
		user.setId(id);
		user.setUserName(userName);
		user.setPassworld(passworld);
		userService.addUser(user);
		return "userView";
	}
}
