package com.hmp.borrow.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.hmp.bookManagement.service.inter.BookService;
import com.hmp.borrow.entity.HMP_Borrow_Detail;
import com.hmp.borrow.service.inter.BorrowService;
import com.hmp.utils.MyBorrow;

/**
 * 借阅书籍控制层
 * @author NingCG
 *
 */
@Controller
@RequestMapping("borrow/")
public class BorrowController {
	@Resource
	private BorrowService borrowService;
	@Resource
	private BookService bookService;
	//跳转至借阅书籍页面
	@RequestMapping(value="/initBorrowBook")
	public String initBorrowBook() {
		return "borrow/borrowBook";
	}
	//跳转至我的借阅页面
	@RequestMapping(value="/initGiveBorrow")
	public String initMyBorrow(Model model,HttpServletRequest request) {
		 count(request, model);
		//从session中获取当前借阅集合
		HttpSession session = request.getSession();
		//从session中获取 即将到归还日期的书籍
		 @SuppressWarnings("unchecked")
		List<MyBorrow> myborrows =(List<MyBorrow>) session.getAttribute("myBorrows");
		 //用于计算数量
		 int count=0;
		 //遍历该集合
		 for (MyBorrow myBorrow : myborrows) {
			//得到即将归还书籍的主键数组
			 List<Integer> ids = myBorrow.getIds();
			 //遍历该集合
			 for (Integer id : ids) {
				//通过id查询该对象
				 HMP_Borrow_Detail detail = borrowService.queryDetailById(id);
				 //判断该对象 是否归还  及 实际归还时间是否为空
				 if(detail.getIs_return()==false&&detail.getReality_return_time()==null) {
					 count++;
				 }
			}
			 myBorrow.setCount(count);
			 if(myBorrow.getCount()==0) {
				 myborrows.remove(myBorrow);
			 }
			 count=0;
		}
		 return "borrow/giveBorrow";
	}
	@RequestMapping(value="addBorrowBook")
	public String addBorrowBook(@RequestParam Integer bookId,Integer count,String appoint_return_time,HttpServletRequest request,Model model) {
		//从session中获取当前登录用户
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 //将字符串  appoint_return_time转换为Date类型
		 Date returnTime = null;
		try {
			returnTime = formatter.parse(appoint_return_time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//借书时间
		Date nowTime=new Date();
		for(int i=0;i<count;i++) {
			//new出租借明细对象
			HMP_Borrow_Detail borrowDetail=new HMP_Borrow_Detail();
			 //为其属性赋值
			borrowDetail.setBook_id(bookId);
			borrowDetail.setIs_return(false);
			borrowDetail.setBorrow_time(nowTime);
			borrowDetail.setAppoint_return_time(returnTime);
			borrowDetail.setUser_id(userId);
			borrowService.addBorrowDetail(borrowDetail);
		}
		boolean flag=true;
		model.addAttribute("flag", flag);
		return "borrow/borrowBook";
	}
	
	//跳转至书籍借阅
	@RequestMapping(value="myBorrow")
	public String myBorrow(HttpServletRequest request,Model model) {
		//从session中获取当前登录用户
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		//从数据库中检索出不同日的借阅日期x
		//new出list集合用于存儲 MyBorrow對象
		List<MyBorrow>myBorrows=new ArrayList<MyBorrow>();
		List<String> borrowTimes = borrowService.queryBorrowTime(userId);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=null;
		//遍历该集合  得到不重复的借阅时间
		for (String borrowTime : borrowTimes) {
			//根据改时间检索 数量
			time=borrowTime.substring(0, 19);
			Integer count = borrowService.queryBorrowCount(userId, time);
			//new 出我的租借对象
			MyBorrow myBorrow=new MyBorrow();
			//用于 控制循环
			boolean kg=false;
			//根据不同的租借时间检索租借记录
			List<HMP_Borrow_Detail> queryBorrowDetailByBorrowTime = borrowService.queryBorrowDetailByBorrowTime(userId, time);
			//遍历该集合
			for (HMP_Borrow_Detail borrowDetail : queryBorrowDetailByBorrowTime) {
				//为 我的租借属性赋值
				if(kg) {
					myBorrow.setIds(borrowDetail.getFborrow_detail_id());
					continue;
				}
				myBorrow.setIds(borrowDetail.getFborrow_detail_id());
				myBorrow.setFBORROW_DETAIL_ID(borrowDetail.getFborrow_detail_id());
				myBorrow.setBook_id(borrowDetail.getBook_id());
				myBorrow.setCount(count);
				myBorrow.setAppoint_return_time(formatter.format(borrowDetail.getAppoint_return_time()).substring(0, 10));
				myBorrow.setBorrowDate(formatter.format(borrowDetail.getBorrow_time()));
				//myBorrow.setReality_return_time(formatter.format(borrowDetail.getReality_return_time()));
				myBorrow.setIs_return(borrowDetail.getIs_return());
				myBorrow.setUser_id(borrowDetail.getUser_id());
				kg=true;
			}
			myBorrows.add(myBorrow);
		}
		//遍历myBorrows集合 设置书籍对象
		for (MyBorrow myBorrow : myBorrows) {
			//根据书籍主键去获得该书籍对象
			myBorrow.setBook(bookService.queryBookById(myBorrow.getBook_id()));
		}
		model.addAttribute("myBorrows", myBorrows);
		count(request, model);
		return "borrow/myBorrow";
	}
	//归还书籍
	@RequestMapping(value="/giveBooks" ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String giveBooks(@RequestParam Integer count,String ids) {
		//根据归还的数量来遍历数组进行归还
		//设置归还时间
		Date nowTime=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 //将字符串  appoint_return_time转换为Date类型
		String time=formatter.format(nowTime);
		String id[]=ids.split(",");
		Integer fborrow_detail_id=null;
		for(int i=0;i<count;i++) {
			//跟新时间
			fborrow_detail_id=Integer.parseInt(id[i].trim());
			borrowService.editBorrow(fborrow_detail_id,time);
		}
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("flag", "success");
		return jsonObject.toString();
		
	}
	
	//批量归还书籍
	@RequestMapping(value="/batchReturn" ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String batchReturn(@RequestParam String delBorrow, Integer count) {
		//设置归还时间
		Date nowTime=new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 //将字符串  appoint_return_time转换为Date类型
		String time=formatter.format(nowTime);
		String id[]=delBorrow.split(",");
		Integer fborrow_detail_id=null;
		for(int i=0;i<count;i++) {
			//跟新时间
			fborrow_detail_id=Integer.parseInt(id[i].trim());
			borrowService.editBorrow(fborrow_detail_id,time);
		}
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("flag", "success");
		return jsonObject.toString();
		
	}
	
	// 购物车、我的订单、我的收藏、我的租借 数量
		public void count(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			Integer userId = (Integer) session.getAttribute("userId");
			// 我的购物车数量
			Integer cartCount = bookService.CartCount(userId);
			// 我的订单数量
			Integer myOrderCount = bookService.ShopCartCount(userId);
			// 我的收藏数量
			Integer myCollectionCount = bookService.myCollection(userId, true).size();
			//我的收藏数量
			Integer borrowCount = bookService.queryMyBorrowCount(userId);
			model.addAttribute("cartCount", cartCount);
			model.addAttribute("myOrderCount", myOrderCount);
			model.addAttribute("myCollectionCount", myCollectionCount);
			model.addAttribute("borrowCount", borrowCount);
		}
		
		//系统检测到归还时间前一天给出提示  提示用户归还
		@RequestMapping(value="pointOut",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String myBorrows(HttpServletRequest request) {
			//从session中获取当前登录用户
			HttpSession session = request.getSession();
			Integer userId = (Integer)session.getAttribute("userId");
			//从数据库中检索出不同日的借阅日期x
			//new出list集合用于存儲 MyBorrow對象
			List<MyBorrow>myBorrows=new ArrayList<MyBorrow>();
			List<String> borrowTimes = borrowService.queryBorrowTime(userId);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM-dd");
			String time=null;
			//获得当前系统时间
			Date nowTime=new Date();
			//格式化当前日期
			String Time = matter.format(nowTime);
			//遍历该集合  得到不重复的借阅时间
			for (String borrowTime : borrowTimes) {
				//用于 控制循环
				boolean kg=false;
				//根据改时间检索 数量
				time=borrowTime.substring(0, 19);
				Integer count = borrowService.queryBorrowCount(userId, time);
				//new 出我的租借对象
				MyBorrow myBorrow=new MyBorrow();
				//根据不同的租借时间检索租借记录
				List<HMP_Borrow_Detail> queryBorrowDetailByBorrowTime = borrowService.queryBorrowDetailByBorrowTime(userId, time);
				//遍历该集合
				for (HMP_Borrow_Detail borrowDetail : queryBorrowDetailByBorrowTime) {
					if(kg) {
						myBorrow.setIds(borrowDetail.getFborrow_detail_id());
						continue;
					}
					myBorrow.setIds(borrowDetail.getFborrow_detail_id());
					//为 我的租借属性赋值
					myBorrow.setFBORROW_DETAIL_ID(borrowDetail.getFborrow_detail_id());
					myBorrow.setBook_id(borrowDetail.getBook_id());
					myBorrow.setCount(count);
					myBorrow.setAppoint_return_time(formatter.format(borrowDetail.getAppoint_return_time()).substring(0, 10));
					myBorrow.setBorrowDate(formatter.format(borrowDetail.getBorrow_time()));
					//myBorrow.setReality_return_time(formatter.format(borrowDetail.getReality_return_time()));
					myBorrow.setIs_return(borrowDetail.getIs_return());
					myBorrow.setUser_id(borrowDetail.getUser_id());
					kg=true;
				}
				myBorrows.add(myBorrow);
			}
			//new 出集合用于存储快到时间的借阅数据
			List<MyBorrow>myBorrowItems=new ArrayList<MyBorrow>();
			//当前日期
			 Date nowTimes = null;
			try {
				nowTimes = matter.parse(Time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			//遍历myBorrows集合 设置书籍对象
			for (MyBorrow myBorrow : myBorrows) {
				//根据书籍主键去获得该书籍对象
				myBorrow.setBook(bookService.queryBookById(myBorrow.getBook_id()));
				//约定还书日期
				String appoint_return_time = myBorrow.getAppoint_return_time();
				//约定还书日期
				 Date ydTime = null;
				try {
					ydTime = matter.parse(appoint_return_time);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				//使用当前日期毫秒数减去约定还书日期毫秒数 得到 毫秒差
				long nowTimesMinusYdTime  =ydTime.getTime()-nowTimes.getTime();
				//毫秒差转为秒
				int milli=(int)(nowTimesMinusYdTime / 1000);
				//得到总天数
				int days = milli / (3600*24);
				//如果天数在3天之内则给出提示
				if(days<=3) {
					myBorrowItems.add(myBorrow);
				}
			}
			//new出jsonObject对象
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("myBorrowItems", myBorrowItems);
			return jsonObject.toString();
		}	
		
		//点击弹窗后页面展现
		@RequestMapping(value="/borrowShow")
		public ModelAndView borrowShow(@RequestParam String borrowIds,HttpServletRequest request,ModelAndView mv) {
			//从session中获取当前登录用户
			HttpSession session = request.getSession();
			Integer userId = (Integer)session.getAttribute("userId");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//将参数转换为数组
			String borrowId[]=borrowIds.split(",");
			//new 出集合 用于存储detail对象
			List<HMP_Borrow_Detail> details=new ArrayList<HMP_Borrow_Detail>();
			//new出set集合用于存储不同的借阅日期
			Set<Date> set=new HashSet<Date>();
			//new出list集合用于存儲 MyBorrow對象
			List<MyBorrow>myBorrows=new ArrayList<MyBorrow>();
			//遍历该数组，通过Id查询出借阅对象
			for (String id : borrowId) {
				HMP_Borrow_Detail detail = borrowService.queryDetailById(Integer.parseInt(id.trim()));
				details.add(detail);
			}
			//遍历该集合  转换对象结构
			for (HMP_Borrow_Detail detail : details) {
				set.add(detail.getBorrow_time());
			}
			//遍历set集合
			for (Date s : set) {
				//获取不同时间段的数量
				Integer count = borrowService.queryBorrowCount(userId, 	formatter.format(s));
				//new 出我的租借对象
				MyBorrow myBorrow=new MyBorrow();
				//根据不同的租借时间检索租借记录
				List<HMP_Borrow_Detail> queryBorrowDetailByBorrowTime = borrowService.queryBorrowDetailByBorrowTime(userId,formatter.format(s));
				//遍历该集合
				//用于 控制循环
				boolean kg=false;
				for (HMP_Borrow_Detail borrowDetail : queryBorrowDetailByBorrowTime) {
					if(kg) {
						myBorrow.setIds(borrowDetail.getFborrow_detail_id());
						continue;
					}
					//为 我的租借属性赋值
					myBorrow.setFBORROW_DETAIL_ID(borrowDetail.getFborrow_detail_id());
					myBorrow.setBook_id(borrowDetail.getBook_id());
					myBorrow.setCount(count);
					myBorrow.setAppoint_return_time(formatter.format(borrowDetail.getAppoint_return_time()).substring(0, 10));
					myBorrow.setBorrowDate(formatter.format(borrowDetail.getBorrow_time()));
					//myBorrow.setReality_return_time(formatter.format(borrowDetail.getReality_return_time()));
					myBorrow.setIs_return(borrowDetail.getIs_return());
					myBorrow.setUser_id(borrowDetail.getUser_id());
					myBorrow.setIds(borrowDetail.getFborrow_detail_id());
					kg=true;
				}
				myBorrows.add(myBorrow);
			}
			//遍历myBorrows集合 设置书籍对象
			for (MyBorrow myBorrow : myBorrows) {
				//根据书籍主键去获得该书籍对象
				myBorrow.setBook(bookService.queryBookById(myBorrow.getBook_id()));
			}
			session.setAttribute("myBorrows", myBorrows);
			mv.setViewName("redirect:initGiveBorrow");
			return mv;
		}
}
