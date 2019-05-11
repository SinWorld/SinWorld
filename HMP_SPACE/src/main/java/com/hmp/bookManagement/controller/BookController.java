package com.hmp.bookManagement.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

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
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.hmp.bookManagement.entity.BookInforMation;
import com.hmp.bookManagement.entity.HMP_Address;
import com.hmp.bookManagement.entity.HMP_Book_Cart;
import com.hmp.bookManagement.entity.HMP_Book_buy;
import com.hmp.bookManagement.entity.HMP_Form_Message;
import com.hmp.bookManagement.service.inter.BookService;
import com.hmp.utils.Page;
import com.hmp.utils.QueryVo;
import com.hmp.utils.ShopCart;

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
	public String initBookIndex(Model model, HttpServletRequest request) {
		// 总页数
		Integer totalPage = bookService.totalPage();
		model.addAttribute("totalPage", totalPage);
		count(request, model);
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
			book.setIs_collection(false);
			book.setUser_id(0);
			bookService.addBook(book);
		}
		mv.setViewName("redirect:initIndex");
		return mv;
	}

	// 初始化图书种类
	@RequestMapping(value = "/bookTypes", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONArray initBookType(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		// 我的购物车数量
		Integer cartCount = bookService.CartCount(userId);
		// 我的订单数量
		Integer myOrderCount = bookService.ShopCartCount(userId);
		// 我的收藏数量
		Integer myCollectionCount = bookService.myCollection(userId, true).size();
		// new出map集合用于存放上述值
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cartCount", cartCount);
		map.put("myOrderCount", myOrderCount);
		map.put("myCollectionCount", myCollectionCount);
		JSONArray jsonArray = bookService.bookType();
		jsonArray.add(map);
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

	// 跳转至书籍详情页面
	@RequestMapping(value = "/initBookDetails")
	public String initBookDetails() {
		return "book/details";
	}

	// 书籍信息展现
	@RequestMapping(value = "/queryBookById")
	public String queryBookById(@RequestParam("bookId") Integer bookId, Model model, HttpServletRequest request) {
		BookInforMation book = bookService.queryBookById(bookId);
		model.addAttribute("book", book);
		count(request, model);
		return "book/details";
	}

	// 初始化图书
	@RequestMapping(value = "/pageBook", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bookList(@RequestParam Integer nowPage, String bookName, QueryVo vo) {
		Map<String, Page> map = new HashMap<String, Page>();
		JSONArray jsonArray = new JSONArray();
		// 获得Page对象
		Page<BookInforMation> page = new Page<BookInforMation>();
		// 每页数
		if (vo != null) {
			page.setPage((nowPage - 1) * vo.getSize() + 1);
			vo.setPage((nowPage - 1) * vo.getSize() + 1);
			vo.setStartRow((page.getPage()));
			vo.setSize(nowPage * 10);
			if (bookName != null) {
				vo.setBookName(bookName.trim());
			} else {
				vo.setBookName(bookName);
			}

		}
		// 总页数
		if (bookName != null) {
			page.setTotal(bookService.totalPageBybookName(bookName));
		} else {
			page.setTotal(bookService.totalPage());
		}
		page.setRows(bookService.pageList(vo));
		map.put("page", page);
		jsonArray.add(map);
		return jsonArray.toString();
	}

	// 跳转至购物车页面
	@RequestMapping(value = "/initShopCart")
	public String initShopCart(HttpServletRequest request, Model model) {
		// 用于判断set集合中遍历的该元素是不是最后一个
		int temp = 0;
		// 计算总金额
		float subTotalPrice = 0f;
		// 从session中获取当前用户的主键
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		List<HMP_Book_Cart> carts = bookService.queryCarts(userId);
		// new出set集合用于存放购物车中不重复的书籍主键
		Set<Integer> set = new HashSet<Integer>();
		// new出list集合用于存放购物车中的商品用于页面回显
		List<ShopCart> list = new ArrayList<ShopCart>();
		// 遍历该集合，将list中的数据添加到set中
		for (HMP_Book_Cart cart : carts) {
			set.add(cart.getBook_id());
		}
		// 遍历set集合得到不重复的书籍主键
		for (Integer bookId : set) {
			// 根据书籍主键获得该书籍
			BookInforMation book = bookService.queryBookById(bookId);
			// 根据该主键去查询购物车中该类书籍的总数量
			Integer count = bookService.totalCartByBookId(bookId, userId);
			// new出ShopCart 对象
			ShopCart shopCart = new ShopCart();
			// 为shopCart属性赋值
			shopCart.setBookInforMation(book);
			shopCart.setCount(count);
			shopCart.setTotalPrice(book.getBook_price() * shopCart.getCount());
			subTotalPrice += shopCart.getTotalPrice();
			// 判断当前集合是否为最后一次
			if (temp == set.size() - 1) {
				// 设置总金额
				shopCart.setSubTotalPrice(subTotalPrice);
			}
			temp++;
			// 将该购物项添加到 list集合中
			list.add(shopCart);
		}
		model.addAttribute("list", list);
		count(request, model);
		return "book/shopCart";
	}

	// 将商品添加至购物车中
	// @RequestMapping(value = "/addCart")
	// public ModelAndView addCart(@RequestParam Integer count, Integer bid,
	// HttpServletRequest request, ModelAndView mv) {
	// // 封装cartItem对象
	// CartItem cartItem = new CartItem();
	// // 设置数量
	// cartItem.setCount(count);
	// // 根据bid查询书籍
	// BookInforMation book = bookService.queryBookById(bid);
	// // 设置商品:
	// cartItem.setBook(book);
	// // 将购物项添加到购物车中:
	// // 购物车应存在session中
	// Cart cart = this.getCart(request);
	// cart.addCart(cartItem);
	// mv.setViewName("redirect:initShopCart");
	// return mv;
	// }
	//
	// // 清空购物车
	// @RequestMapping(value = "/clearCart")
	// public ModelAndView clearCart(HttpServletRequest request, ModelAndView mv) {
	// // 获得购物车对象
	// Cart cart = this.getCart(request);
	// // 调用购物车中的清空方法
	// cart.clearCart();
	// mv.setViewName("redirect:initShopCart");
	// return mv;
	//
	// }
	//
	// // 移除购物项
	// @RequestMapping(value = "/deleteCart")
	// public ModelAndView removeCartItem(@RequestParam Integer bookId,
	// HttpServletRequest request, ModelAndView mv) {
	// // 获得购物车对象
	// Cart cart = this.getCart(request);
	// cart.removeCart(bookId);
	// mv.setViewName("redirect:initShopCart");
	// return mv;
	// }

	/**
	 * 获得购物车的方法，从session中获得
	 * 
	 * @param request
	 * @return
	 */
	// private Cart getCart(HttpServletRequest request) {
	// HttpSession session = request.getSession();
	// Cart cart = (Cart) session.getAttribute("cart");
	// if (cart == null) {
	// cart = new Cart();
	// session.setAttribute("cart", cart);
	// }
	// return cart;
	// }

	// 根据书籍种类检索书籍
	@RequestMapping(value = "/queryBookByType")
	@ResponseBody
	public String queryBookByType(@RequestParam Integer typeId, Integer nowPage) {
		Map<String, Page> map = new HashMap<String, Page>();
		JSONArray jsonArray = new JSONArray();
		// 获得vo对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<BookInforMation> page = new Page<BookInforMation>();
		// 每页数
		if (vo != null) {
			page.setPage((nowPage - 1) * vo.getSize() + 1);
			vo.setPage((nowPage - 1) * vo.getSize() + 1);
			vo.setStartRow((page.getPage()));
			vo.setSize(nowPage * 10);
			vo.setBookType(typeId);
		}
		// 总页数
		page.setTotal(bookService.totalPage());
		page.setRows(bookService.queryBookByType(vo));
		map.put("page", page);
		jsonArray.add(map);
		return jsonArray.toString();
	}

	// 跳转至书籍类别展示页面
	@RequestMapping(value = "/bookType")
	public String bookType(@RequestParam Integer typeId, Model model) {
		Integer total = bookService.totalPageBybookType(typeId);
		model.addAttribute("totalPage", total);
		return "book/bookType";
	}

	// 添加图书至购物车
	@RequestMapping(value = "/addCart")
	public ModelAndView addCart(@RequestParam Integer bookId, HttpServletRequest request, ModelAndView mv,
			Integer count) {
		HttpSession session = request.getSession();
		// 从session中取得当前用户主键
		Integer userId = (Integer) session.getAttribute("userId");
		// 声明当前时间
		Date time = new Date();
		// 是否删除 为false
		boolean flag = false;
		// 是否支付 false
		boolean iszf = false;
		// 根据添加的数量来向购物车中循环添加商品
		for (int i = 1; i <= count; i++) {
			// new出购物车对象
			HMP_Book_Cart cart = new HMP_Book_Cart();
			cart.setUser_id(userId);
			cart.setBook_id(bookId);
			cart.setShopping_time(time);
			cart.setFlag(flag);
			cart.setIszf(iszf);
			bookService.addCart(cart);
		}
		mv.setViewName("redirect:initShopCart");
		return mv;
	}

	// 移除购物项(逻辑删除)
	@RequestMapping(value = "/deleteCart")
	public ModelAndView deleteCartByBookId(@RequestParam Integer bookId, ModelAndView mv) {
		boolean flag = true;
		bookService.deleteCartByBookId(bookId, flag);
		mv.setViewName("redirect:initShopCart");
		return mv;
	}

	// 批量删除购物项(逻辑删除)
	@RequestMapping(value = "/clearCart")
	public ModelAndView batchDeleteCart(HttpServletRequest request, ModelAndView mv) {
		// 从session中获取当前用户主键
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		// 获得书籍主键数组对象
		String str = request.getParameter("delBookIds");
		String[] bookIds = str.split(",");
		// 删除状态
		boolean flag = true;
		// 遍历该数组
		for (String s : bookIds) {
			int bookId = Integer.parseInt(s);
			bookService.batchDeleteCart(userId, bookId, flag);
		}
		mv.setViewName("redirect:initShopCart");
		return mv;
	}

	// 跳转至支付页面
	@RequestMapping(value = "/aliPay")
	public String aliPay() {
		return "book/aliPay";
	}

	// 添加购物地址数据
	private void addShopAddress(String address_name, String address_phone, String address_adr, Integer user_id) {
		// new 出购物地址对象
		HMP_Address hmp_address = new HMP_Address();
		hmp_address.setAddress_name(address_name);
		hmp_address.setAddress_phone(address_phone);
		hmp_address.setAddress_adr(address_adr);
		hmp_address.setUser_id(user_id);
		hmp_address.setDefaultAddress(false);
		hmp_address.setShiFouSC(false);
		// 添加
		bookService.addHMP_ADDRESS(hmp_address);
	}

	// 支付时生成订单
	private void addShopMessage(Integer user_id, Float sumTotalPrice) {
		// new出购物订单对象
		HMP_Form_Message message = new HMP_Form_Message();
		message.setUser_id(user_id);
		// 订单创建时间
		Date nowTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		message.setCreate_time(sdf.format(nowTime));
		// 设置订单总费用
		message.setInvolve_money(sumTotalPrice);
		// 是否违约
		message.setIs_break(false);
		// 订单号
		String order_number = UUID.randomUUID().toString();
		message.setOrder_number(order_number);
		bookService.addHMP_Form_Message(message);
	}

	// 点击支付后生成购物项信息
	@RequestMapping(value = "/payfor")
	public ModelAndView addShopCartitem(@RequestParam String address_name, String address_phone, String address_adr,
			Float sumTotalPrice, HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		// 获取当前登录系统的用户主键
		Integer user_id = (Integer) session.getAttribute("userId");
		// 支付时添加购物地址数据
		this.addShopAddress(address_name, address_phone, address_adr, user_id);
		// 返回新增购物地址数据的序列值
		Integer addressId = bookService.queryAddressId();
		// 支付时生成订单
		this.addShopMessage(user_id, sumTotalPrice);
		// 返回新增购物订单数据的序列值
		Integer messageId = bookService.queryShopMessageId();
		// 获得书籍主键数组对象
		String str = request.getParameter("delBookIds");
		String[] bookIds = str.split(",");
		// 支付
		boolean flag = true;
		// 购买时间
		Date nowTime = new Date();
		// 遍历该数组
		for (String bookId : bookIds) {
			// 根据书籍id 在购物车中检索出该类书籍的购买数量
			Integer count = bookService.totalCartByBookId(Integer.parseInt(bookId), user_id);
			// 计算该类书籍购买的小计
			float totalPrice = bookService.queryBookById(Integer.parseInt(bookId)).getBook_price() * count;
			// new 出商品购买类对象
			HMP_Book_buy buy = new HMP_Book_buy();
			// 为该对象属性赋值
			buy.setUser_id(user_id);
			buy.setBook_id(Integer.parseInt(bookId));
			buy.setBook_buy_time(nowTime);
			buy.setBook_buy_count(count);
			buy.setBuy_sum(totalPrice);
			buy.setMessage_id(messageId);
			buy.setAddress_id(addressId);
			bookService.editShopCart(user_id, Integer.parseInt(bookId), flag);
			bookService.addHMP_Book_Buy(buy);
		}
		session.setAttribute("sumTotalPrice", sumTotalPrice);
		mv.setViewName("redirect:aliPay");
		return mv;
	}

	// 跳转至我的订单页面
	@RequestMapping(value = "/orderCartem")
	public String myOrder() {
		return "book/orderCartem";
	}

	// 加载当前用户的购物订单信息
	@RequestMapping(value = "/ShopCartList")
	@ResponseBody
	public String ShopCartList(HttpServletRequest request,Integer page) {
		HttpSession session = request.getSession();
		// 获取当前登录系统的用户主键
		Integer userId = (Integer) session.getAttribute("userId");
		//new出QueryVo查询对象
		QueryVo vo=new QueryVo();
		// 获得Page对象
		Page<HMP_Form_Message> pages = new Page<HMP_Form_Message>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			vo.setUserId(userId);
		}
		// 总页数
		pages.setTotal(bookService.ShopCartCount(userId));
		pages.setRows(bookService.orderCartem(vo));
		Gson gson = new Gson();
		// 得到当前用户所购买的订单数量
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", bookService.ShopCartCount(userId));
		map.put("data",pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 点击订单详情展现购物项信息
	@RequestMapping(value = "orderCartemInfor")
	public String cartItems(@RequestParam Integer messageId, Model model,HttpServletRequest request) {
		// 根据订单id去检索购买表信息
		List<HMP_Book_buy> buys = bookService.queryBuyByMessageId(messageId);
		// new出存储该购物车集合
		List<ShopCart> carts = new ArrayList<ShopCart>();
		// new出set集合用于存放不重复的地址主键
		Set<Integer> sets = new HashSet<Integer>();
		// 遍历该集合
		for (HMP_Book_buy buy : buys) {
			// 得到书籍主键,根据该主键得到书籍对象
			BookInforMation book = bookService.queryBookById(buy.getBook_id());
			// new出购物车对象
			ShopCart cart = new ShopCart();
			// 为购物车属性赋值
			cart.setBookInforMation(book);
			cart.setCount(buy.getBook_buy_count());
			cart.setTotalPrice(buy.getBuy_sum());
			carts.add(cart);
			sets.add(buy.getAddress_id());
		}
		// 遍历set集合获取该购物项的所属地址
		for (Integer set : sets) {
			// 获取购物地址
			HMP_Address address = bookService.queryAddressById(set);
			model.addAttribute("address", address);
		}
		model.addAttribute("carts", carts);
		count(request,model);
		return "book/orderCartemInfor";
	}

	// 根收藏图书
	@RequestMapping(value = "/collection")
	@ResponseBody
	public String collection(@RequestParam Integer bookId, boolean flag, HttpServletRequest request) {
		// 得到JSONObject对象
		JSONObject jsonObject = new JSONObject();
		// 根据书籍主键去查询该书籍
		BookInforMation book = bookService.queryBookById(bookId);
		// 判断flag 为true 或为false true为收藏，false为取消收藏
		// 从session中得到用户主键
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		book.setUser_id(userId);
		if (flag) {
			book.setIs_collection(true);
			jsonObject.put("isCollection", true);
		} else {
			book.setIs_collection(false);
			jsonObject.put("isCollection", false);
		}
		bookService.isCollection(book);
		return jsonObject.toString();
	}

	// 我的收藏
	@RequestMapping(value = "/myCollection")
	public String myCollection(HttpServletRequest request, Model model) {
		// 从session中得到用户主键
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		List<BookInforMation> collections = bookService.myCollection(userId, true);
		model.addAttribute("collections", collections);
		count(request, model);
		return "book/myCollection";
	}

	// 取消收藏
	@RequestMapping(value = "/qxCollection")
	public ModelAndView qxCollection(@RequestParam Integer bookId, ModelAndView mv) {
		BookInforMation book = bookService.queryBookById(bookId);
		book.setIs_collection(false);
		bookService.isCollection(book);
		mv.setViewName("redirect:myCollection");
		return mv;
	}

	// 购物车、我的订单、我的收藏 数量
	public void count(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		// 我的购物车数量
		Integer cartCount = bookService.CartCount(userId);
		// 我的订单数量
		Integer myOrderCount = bookService.ShopCartCount(userId);
		// 我的收藏数量
		Integer myCollectionCount = bookService.myCollection(userId, true).size();
		model.addAttribute("cartCount", cartCount);
		model.addAttribute("myOrderCount", myOrderCount);
		model.addAttribute("myCollectionCount", myCollectionCount);
	}

	// 加载当前用户所填写的所有收货地址
	@RequestMapping(value = "/myShopAddress")
	@ResponseBody
	public String myShopAddress(HttpServletRequest request,Integer page) {
		HttpSession session = request.getSession();
		// 获取当前登录系统的用户主键
		Integer userId = (Integer) session.getAttribute("userId");
		//new出QueryVo查询对象
		QueryVo vo=new QueryVo();
		// 获得Page对象
		Page<HMP_Address> pages = new Page<HMP_Address>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			vo.setUserId(userId);
		}
		// 总页数
		pages.setTotal(bookService.queryHmpAddressCount(userId));
		pages.setRows(bookService.queryHmpAddress(vo));
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		Gson gson = new Gson();
		// 得到当前用户所购买的订单数量
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", bookService.queryHmpAddressCount(userId));
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();

	}

	// 跳转至所有商品
	@RequestMapping(value = "/allProduct")
	public String allProduct(Model model, HttpServletRequest request) {
		// 总页数
		Integer totalPage = bookService.totalPage();
		model.addAttribute("totalPage", totalPage);
		count(request, model);
		return "book/allProduct";
	}
	//今日团购
	@RequestMapping(value = "/buyTodady")
	public String buyTodady(Model model, HttpServletRequest request) {
		// 总页数
		Integer totalPage = bookService.totalPage();
		model.addAttribute("totalPage", totalPage);
		count(request, model);
		return "book/buyToday";
	}
	
	
		// 动态在购物车中添加购物项
		@RequestMapping(value = "/addShopCart")
		@ResponseBody
		public String addShopCart(@RequestParam Integer bookId,HttpServletRequest request) {
			JSONObject jsonObject=new JSONObject();
			HttpSession session = request.getSession();
			// 获取当前登录系统的用户主键
			Integer userId = (Integer) session.getAttribute("userId");
			//new出购物车对象
			HMP_Book_Cart cart=new HMP_Book_Cart();
			//为其属性赋值
			cart.setUser_id(userId);
			cart.setBook_id(bookId);
			Date nowTime=new Date();
			cart.setShopping_time(nowTime);
			cart.setFlag(false);
			cart.setIszf(false);
			//添加至购物车
			bookService.addCart(cart);
			jsonObject.put("flag", "success");
			return jsonObject.toJSONString();
		}
		
		// 动态在购物车中删除购物项
		@RequestMapping(value = "/lessShopCart")
		@ResponseBody
		public String lessShopCart(@RequestParam Integer bookId,HttpServletRequest request) {
			JSONObject jsonObject=new JSONObject();
			HttpSession session = request.getSession();
			// 获取当前登录系统的用户主键
			Integer userId = (Integer) session.getAttribute("userId");
			//查询出当前该类购物项最大主键值
			Integer cartId = bookService.queryToUserCart(userId, bookId);
			boolean flag=true;
			//对购物车进行修改
			bookService.deleteCartById(cartId,flag);
			jsonObject.put("flag", "success");
			return jsonObject.toJSONString();
		}
		
		//设为默认地址
		@RequestMapping(value = "/defaultAddress")
		@ResponseBody
		public String defaultAddress(@RequestParam Integer addressId,HttpServletRequest request) {
			JSONObject jsonObject=new JSONObject();
			HttpSession session = request.getSession();
			// 获取当前登录系统的用户主键
			Integer userId = (Integer) session.getAttribute("userId");
			//初始化用户的默认地址
			bookService.defaultAddress(userId);
			//设置该地址默认地址为true
			boolean flag=true;
			bookService.editDefaultAddress(addressId, flag);
			jsonObject.put("flag", "success");
			return jsonObject.toJSONString();
		}
		
		//跳转至修改收货地址页面
		@RequestMapping(value = "/initEditAddress")
		public String initEditAddress(@RequestParam Integer addressId,Model model) {
			//根据地址主键查询地址对象
			HMP_Address address = bookService.queryAddressById(addressId);
			model.addAttribute("address", address);
			return "book/editAddress";
		}
		
		//修改用户收货地址
		@RequestMapping(value = "/editAddress")
		public String editAddress(HMP_Address address,Model model,HttpServletRequest request) {
			HttpSession session = request.getSession();
			// 获取当前登录系统的用户主键
			Integer userId = (Integer) session.getAttribute("userId");
			//修改用户收货地址
			address.setDefaultAddress(false);
			address.setShiFouSC(false);
			address.setUser_id(userId);
			bookService.editAddress(address);
			boolean flag=true;
			model.addAttribute("flag", flag);
			return "book/editAddress";
		}
		
		//删除用户地址 逻辑删除
		@RequestMapping(value = "/deleteAddress")
		public ModelAndView deleteAddress(@RequestParam Integer addressId,ModelAndView mv) {
			boolean flag=true;
			bookService.deleteAddressById(addressId, flag);
			mv.setViewName("redirect:initShopCart");
			return mv;
		}
}
