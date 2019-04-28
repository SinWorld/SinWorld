package com.hmp.userInforMation.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.hmp.userInforMation.entity.City;
import com.hmp.userInforMation.entity.Province;
import com.hmp.userInforMation.entity.UserInforMation;
import com.hmp.userInforMation.service.inter.UserService;
import com.hmp.utils.EmailUtil;

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
	public String userInforShow(@RequestParam String rowId, Model model) {
		Integer userId = Integer.parseInt(rowId);
		UserInforMation user = userService.queryUserById(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 年-月-日 星期几 上、下午 时：分：秒 时区
		String userBrithday = sdf.format(user.getUser_brithday());
		Province province = userService.queryProvince(user.getUser_province());
		City city = userService.queryCity(user.getUser_city());
		model.addAttribute("user", user);
		model.addAttribute("brithday", userBrithday);
		model.addAttribute("province", province);
		model.addAttribute("city", city);
		return "user/editUser";
	}

	// 用户注册
	@SuppressWarnings("deprecation")
	@RequestMapping("/addUser")
	public ModelAndView addUser(UserInforMation user, ModelAndView mv) {
		user.setUser_status(1);
		// 去空格
		user.setUser_name(user.getUser_name().trim());
		user.setUser_detail_address(user.getUser_detail_address().trim());
		// 计算用户年龄
		Date nowTime = new Date();
		user.setUser_age(nowTime.getYear() - user.getUser_brithday().getYear());
		userService.addUser(user);

		mv.setViewName("redirect:login");
		return mv;
	}

	// 用户名验证
	@RequestMapping(value = "/checkUserName", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkUserName(@RequestParam String userName) {
		List<Integer> list = new ArrayList<Integer>();
		JSONArray jsonArray = new JSONArray();
		// 根据用户名查询是否存在该用户
		if (userName.length() > 0) {
			UserInforMation user = userService.queryUserByName(userName.trim());
			// 如果对象为空则说明不存在该用户名可用
			if (user == null) {
				list.add(0);
				jsonArray.add(list);
				return jsonArray.toString();
			} else {
				// 存在该用户名，无法注册
				list.add(1);
				jsonArray.add(list);
				return jsonArray.toString();
			}
		} else {

		}
		return jsonArray.toString();
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
		Integer user_id = Integer.parseInt(userId);
		JSONArray jsonArray = userService.userShow(user_id);
		return jsonArray.toString();
	}

	// 编辑用户信息
	@RequestMapping(value = "/editUser")
	public String editUser(UserInforMation user, Model model) {
		userService.editUser(user);
		boolean flag = true;
		model.addAttribute("flag", flag);
		return "user/editUser";
	}

	// 跳转至安全中心
	@RequestMapping(value = "/securitySet")
	public String securitySetting() {
		return "user/securitySetting";
	}

	// 安全中心
	@RequestMapping(value = "/securitySetting", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String securitySetting(@RequestParam String userId) {
		Integer user_id = Integer.parseInt(userId);
		JSONArray jsonArray = userService.userShow(user_id);
		return jsonArray.toString();
	}

	// 原密码验证
	@RequestMapping(value = "/checkOldPassword", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String securitySetting(@RequestParam String oldPassword, String userId) {
		Integer id = Integer.parseInt(userId);
		UserInforMation user = userService.queryUserById(id);
		JSONArray jsonArray = new JSONArray();
		List<Integer> list = new ArrayList<Integer>();
		if (user != null && oldPassword != null) {
			if (oldPassword.equals(user.getUser_password())) {
				list.add(0);
				jsonArray.add(list);
			} else {
				list.add(1);
				jsonArray.add(list);
			}
		}
		return jsonArray.toString();
	}

	// 密码修改
	@RequestMapping(value = "/updatePassword")
	public String updateSecurity(@RequestParam String newPassword, UserInforMation user, Model model) {
		user.setUser_password(newPassword);
		userService.updatePassword(user);
		boolean flag = true;
		model.addAttribute("flag", flag);
		return "user/securitySetting";
	}

	// 退出系统
	@RequestMapping(value = "/exit")
	public ModelAndView exit(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		// 清除session
		session.invalidate();
		mv.setViewName("redirect:login");
		return mv;
	}

	// 跳转至转回密码
	@RequestMapping(value = "/forgotPassword")
	public String forgotPassword() {
		return "user/forgotPassword";
	}

	// 找回密码发送邮件通知
	@RequestMapping(value = "/queryUserCode", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sendMessage(@RequestParam String user_email, String userName) {
		List<Integer> list = new ArrayList<Integer>();
		JSONArray jsonArray = new JSONArray();
		String str = "abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789";
		Random r = new Random();
		String arr[] = new String[4];
		String b = "";
		for (int i = 0; i < 4; i++) {
			int n = r.nextInt(62);
			arr[i] = str.substring(n, n + 1);
			b += arr[i];
		}
		String resertPassword = "重置密码";
		String text = "<h4>尊敬的用户" + userName + ":<h4>" + "<p>您好！</p>"
				+ "<p>您当前找回的密码验证码为:<span style='color:red;' font-size:20px;>" + b + "</span></p>"
				+ "<p>您可输入以上验证码完成找回密码。</p>" + "<p></p>"
				+ "<hr style=\" height:2px;border:none;border-top:2px;width:250px;text-align:left;margin-left:0\" />"
				+ "<p></p>" + "<p>12121</p>" + "<p>网址：12121</p>" + "<p>电话：12331231</p>";
		try {
			EmailUtil.sendMessage(user_email, resertPassword, text);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		// 根据用户名找到对应的对象
		UserInforMation user = userService.queryUserByName(userName.trim());
		if (user != null) {
			user.setUser_code(b);
			userService.editUserCode(user);
			list.add(0);
			jsonArray.add(list);
			return jsonArray.toString();
		} else {
			list.add(1);
			jsonArray.add(list);
			return jsonArray.toString();
		}

	}

	// ajax异步提交页面返回相应提示信息
	@RequestMapping(value = "/resetPassword", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resetPassword(@RequestParam String user_code, String userName) {
		Map<String, String> map = new HashMap<String, String>();
		JSONArray jsonArray = new JSONArray();
		// 根据用户名查询对象
		UserInforMation user = userService.queryUserByName(userName.trim());
		// 比较用户对象中的验证码与输入的验证码是否一致
		if (user != null) {
			if (user_code.equals(user.getUser_code())) {
				// 输入的验证码与邮箱中的验证码一致，跳转至重置密码页面进行密码重置,用户id放入json中
				String userId = String.valueOf(user.getUser_id());
				map.put("userId", userId);
				jsonArray.add(map);
				return jsonArray.toString();
			} else {
				// 输入的验证码与邮箱中的验证码不一致，返回相关提示信息
				String infor = "您当前输入的验证码与QQ邮箱中的验证码不一致，请重新输入 ，谢谢！！！";
				map.put("infor", infor);
				jsonArray.add(map);
				return jsonArray.toString();
			}
		} else {
			return null;
		}
	}

	// 跳转至重置密码页面
	@RequestMapping(value = "/initResetUserPassword")
	public String initResetUserPassword() {
		return "user/resetPassword";
	}

	// 重置密码
	@RequestMapping(value = "/resetUserPassword")
	public ModelAndView resetUserPassword(@RequestParam Integer userId, String newPassword, ModelAndView mv) {
		// 根据主键去查询所属用户
		UserInforMation user = userService.queryUserById(userId);
		// 重置密码
		user.setUser_password(newPassword);
		// 执行修改操作
		userService.updatePassword(user);
		mv.setViewName("redirect:login");
		return mv;
	}

	// 找回密码输入用户名自动带入邮箱
	@RequestMapping(value = "/queryUserEmail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String queryUserEmail(@RequestParam String userName) {
		Map<String, String> map = new HashMap<String, String>();
		JSONArray jsonArray = new JSONArray();
		// 根据用户名查询对象
		if (userName.length() > 0) {
			UserInforMation user = userService.queryUserByName(userName.trim());
			if (user != null) {
				// 得到邮箱
				map.put("email", user.getUser_email());
				jsonArray.add(map);
				return jsonArray.toString();
			}
		}
		return jsonArray.toString();
	}

	// 跳转至上传头像页面
	@RequestMapping(value = "/uploadPhoto")
	public String uploadPhoto() {
		return "user/uploadPhoto";
	}

	// 上传头像
	@RequestMapping(value = "/updatePersonalById")
	public @ResponseBody String updatePersonal(@RequestParam("file") MultipartFile file, HttpServletRequest request)
			throws IllegalStateException, IOException {
		String oldName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("/upload/");
		String fileName = changeName(oldName);
		String rappendix = "upload/" + fileName;
		fileName = path + "/" + fileName;
		File file1 = new File(fileName);
		file.transferTo(file1);
		String str = "{\"code\": 0,\"msg\": \"\",\"data\": {\"src\":\"" + rappendix + "\"}}";
		return str;
	}

	public static String changeName(String oldName) {
		Random r = new Random();
		Date d = new Date();
		String newName = oldName.substring(oldName.indexOf('.'));
		newName = r.nextInt(99999999) + d.getTime() + newName;
		return newName;
	}
	
}
