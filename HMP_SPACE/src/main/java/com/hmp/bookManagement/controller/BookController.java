package com.hmp.bookManagement.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
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
import com.hmp.bookManagement.entity.BookInforMation;
import com.hmp.bookManagement.service.inter.BookService;
import com.hmp.utils.Cart;
import com.hmp.utils.CartItem;
import com.hmp.utils.Page;
import com.hmp.utils.QueryVo;

/**
 * 书籍控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("book/")
public class BookController {
	@Resource
	private BookService bookService;

	// 跳转至书层首页
	@RequestMapping(value = "/initIndex")
	public String initBookIndex(Model model) {
		Integer totalPage = bookService.totalPage();
		model.addAttribute("totalPage", totalPage);
		return "book/index";
	}

	// 跳转至新增图书页
	@RequestMapping(value = "/initAddBook")
	public String initAddBook(Model model) {
		return "book/addBook";
	}

	// 新增图书
	@RequestMapping(value = "/addBook")
	public ModelAndView addBook(BookInforMation book, ModelAndView mv) {
		if (book != null) {
			bookService.addBook(book);
		}
		mv.setViewName("redirect:initIndex");
		return mv;
	}

	// 初始化图书种类
	@RequestMapping(value = "/bookType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONArray initBookType() {
		JSONArray jsonArray = bookService.bookType();
		return jsonArray;
	}
	
	// 上传书籍封面
	@RequestMapping(value = "/bookUpload")
	public @ResponseBody String updatePersonal(@RequestParam("file") MultipartFile file, HttpServletRequest request)
			throws IllegalStateException, IOException {
		String oldName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("/bookUpload/");
		String fileName = changeName(oldName);
		String rappendix = "bookUpload/" + fileName;
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
	
	
	//跳转至书籍详情页面
	@RequestMapping(value="/initBookDetails")
	public String initBookDetails() {
		return "book/details";
	}
	
	//书籍信息展现
	@RequestMapping(value = "/queryBookById")
	public  String queryBookById(@RequestParam ("bookId") Integer bookId,Model model) {
		BookInforMation book = bookService.queryBookById(bookId);
		model.addAttribute("book", book);
		return "book/details";
	}
	
	//初始化图书
	@RequestMapping(value = "/pageBook", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bookList(@RequestParam Integer nowPage,QueryVo vo) {
		Map<String,Page> map=new HashMap<String, Page>();
		JSONArray  jsonArray=new JSONArray();
		//获得Page对象
		Page <BookInforMation> page=new Page<BookInforMation>();
		//每页数
		if(vo!=null) {
			page.setPage((nowPage-1)*vo.getSize()+1);
			vo.setPage((nowPage-1)*vo.getSize()+1);
			vo.setStartRow((page.getPage()));
			vo.setSize(nowPage*10);
		}
		//总页数
		page.setTotal(bookService.totalPage());
		page.setRows(bookService.pageList(vo));
		map.put("page", page);
		jsonArray.add(map);
		return jsonArray.toString();
	}
		//跳转至购物车页面
		@RequestMapping(value="/initShopCart")
		public String initShopCart() {
			return "book/shopCart";
		}
		//将商品添加至购物车中
		@RequestMapping(value="/addCart")
		public ModelAndView addCart(@RequestParam Integer count,Integer bid,HttpServletRequest request,ModelAndView mv) {
			//封装cartItem对象
			CartItem cartItem=new CartItem();
			//设置数量
			cartItem.setCount(count);
			//根据bid查询书籍
			BookInforMation book = bookService.queryBookById(bid);
			//设置商品:
			cartItem.setBook(book);
			//将购物项添加到购物项中:
			//购物车应存在session中
			Cart cart = this.getCart(request);
			cart.addCart(cartItem);
			mv.setViewName("redirect:initShopCart");
			return mv;
		}
		
		//清空购物车
		@RequestMapping(value="/clearCart")
		public ModelAndView clearCart(HttpServletRequest request,ModelAndView mv) {
			//获得购物车对象
			Cart cart = this.getCart(request);
			//调用购物车中的清空方法
			cart.clearCart();
			mv.setViewName("redirect:initShopCart");
			return mv;
			
		}
		
		//移除购物项
		@RequestMapping(value="/deleteCart")
		public ModelAndView removeCartItem(@RequestParam Integer bookId,HttpServletRequest request,ModelAndView mv) {
			//获得购物车对象
			Cart cart = this.getCart(request);
			cart.removeCart(bookId);
			mv.setViewName("redirect:initShopCart");
			return mv;
		}
		/**
		 * 获得购物车的方法，从session中获得
		 * @param request
		 * @return
		 */
		private Cart getCart(HttpServletRequest request) {
			HttpSession session = request.getSession();
			Cart cart = (Cart)session.getAttribute("cart");
			if(cart==null) {
				cart=new Cart();
				session.setAttribute("cart", cart);
			}
			return cart;
		}
		
		
}
