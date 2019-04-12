package com.hmp.userInforMation.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.hmp.userInforMation.entity.City;
import com.hmp.userInforMation.entity.Province;
import com.hmp.userInforMation.entity.UserInforMation;
import com.hmp.userInforMation.service.inter.UserService;

@Controller
@RequestMapping("user/")
public class UserController {
	@Resource
	private UserService userService;

	// 跳转至注册页
	@RequestMapping("/register")
	public String initUi() {
		return "user/register";
	}

	// 跳转登录页
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

	// 跳转首页
	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}

	// 跳转至banner
	@RequestMapping("/banner")
	public String banner() {
		return "user/banner";
	}
	
	// 跳转至用户编辑页
	@RequestMapping("/userInforShow")
	public String userInforShow(@RequestParam String rowId,Model model) {
		Integer userId = Integer.parseInt(rowId);
		UserInforMation user = userService.queryUserById(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 年-月-日 星期几 上、下午 时：分：秒 时区
		String userBrithday=sdf.format(user.getUser_brithday());
		Province province = userService.queryProvince(user.getUser_province());
		City city = userService.queryCity(user.getUser_city());
		model.addAttribute("user", user);
		model.addAttribute("brithday", userBrithday);
		model.addAttribute("province", province);
		model.addAttribute("city", city);
		return "user/editUser";
	}

	// 用户注册
	@RequestMapping("/addUser")
	public ModelAndView addUser(UserInforMation user, ModelAndView mv) {
		user.setUser_status(1);
		// 去空格
		user.setUser_name(user.getUser_name().trim());
		user.setUser_detail_address(user.getUser_detail_address().trim());
		userService.addUser(user);
		mv.setViewName("redirect:login");
		return mv;
	}

	// 用户登陆
	@RequestMapping(value = "/doLogin", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doLogin(@RequestParam String userName, String password, HttpServletRequest request) {
		List<Integer> list = new ArrayList<Integer>();
		JSONArray jsonArray = new JSONArray();
		if (userName != null && password != null) {
			UserInforMation user = userService.login(userName, password);
			// 查询到了该用户，用户名密码正确
			if (user != null) {
				// 跳转至index首页，并将用户名存入session
				list.add(1);
				jsonArray.add(list);
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				session.setAttribute("userId", user.getUser_id());
				return jsonArray.toString();
			} else {
				// 说明无该用户，用户名或密码错误回转至登录页，并给出提示
				list.add(0);
				jsonArray.add(list);
				return jsonArray.toString();
			}
		} else {
			list.add(0);
			jsonArray.add(list);
			return jsonArray.toString();
		}
	}

	// 用户信息展现
	@RequestMapping(value = "/userShow", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userShow(@RequestParam String userId) {
		Integer user_id=Integer.parseInt(userId);
		JSONArray jsonArray = userService.userShow(user_id);
		return jsonArray.toString();
	}
	//编辑用户信息
	@RequestMapping(value = "/editUser")
	public String editUser(UserInforMation user,Model model) {
		userService.editUser(user);
		boolean flag=true;
		model.addAttribute("flag", flag);
		return "user/editUser";
	}
	
	//跳转至安全中心
	@RequestMapping(value = "/securitySet")
	public String securitySetting() {
		return "user/securitySetting";
	}
	
	//安全中心
	@RequestMapping(value = "/securitySetting", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String securitySetting(@RequestParam String userId) {
		Integer user_id=Integer.parseInt(userId);
		JSONArray jsonArray = userService.userShow(user_id);
		return jsonArray.toString();
	}
	
	//原密码验证
	@RequestMapping(value = "/checkOldPassword", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String securitySetting(@RequestParam String oldPassword ,String userId) {
		Integer id = Integer.parseInt(userId);
		UserInforMation user = userService.queryUserById(id);
		JSONArray jsonArray=new JSONArray();
		List<Integer> list=new ArrayList<Integer>();
		if(user!=null&&oldPassword!=null) {
			if(oldPassword.equals(user.getUser_password())) {
				list.add(0);
				jsonArray.add(list);
			}else {
				list.add(1);
				jsonArray.add(list);
			}
		}
		return jsonArray.toString();
	}
	//密码修改
	@RequestMapping(value = "/updatePassword")
	public String updateSecurity(@RequestParam String newPassword,UserInforMation user,Model model) {
		user.setUser_password(newPassword);
		userService.updatePassword(user);
		boolean flag=true;
		model.addAttribute("flag", flag);
		return "user/securitySetting";
	}
	//退出系统
	@RequestMapping(value = "/exit")
	public ModelAndView exit(HttpServletRequest request,ModelAndView mv) {
		HttpSession session =request.getSession();
		//清除session
		session.invalidate();
		mv.setViewName("redirect:login");
		return mv;
	}
	
}
