package com.hmp.bookManagement.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.hmp.bookManagement.dao.BookDao;
import com.hmp.bookManagement.entity.BookInforMation;
import com.hmp.bookManagement.entity.HMP_Address;
import com.hmp.bookManagement.entity.HMP_Book_Cart;
import com.hmp.bookManagement.entity.HMP_Book_buy;
import com.hmp.bookManagement.entity.HMP_Form_Message;
import com.hmp.bookManagement.service.inter.BookService;
import com.hmp.utils.QueryVo;

@Service
public class BookServiceImpl implements BookService {
	@Resource
	private BookDao bookDao;

	// 新增图书
	public void addBook(BookInforMation book) {
		bookDao.addBook(book);
	}

	// 初始化图书种类
	public JSONArray bookType() {
		return bookDao.bookType();
	}

	// 书籍信息展现
	public BookInforMation queryBookById(Integer bookId) {
		return bookDao.queryBookById(bookId);
	}

	// 总条数
	public Integer totalPage() {
		return bookDao.totalPage();
	}

	// 分页检索
	public List<BookInforMation> pageList(QueryVo vo) {
		return bookDao.pageList(vo);
	}

	// 根据书籍种类检索书籍
	public List<BookInforMation> queryBookByType(QueryVo vo) {
		return bookDao.queryBookByType(vo);
	}

	// 根据书籍种类检索总条数
	public Integer totalPageBybookType(Integer typeId) {
		return bookDao.totalPageBybookType(typeId);
	}

	// 根据书籍名称检索总条数
	public Integer totalPageBybookName(String bookName) {
		return bookDao.totalPageBybookName(bookName);
	}

	// 添加图书至购物车
	public void addCart(HMP_Book_Cart cart) {
		bookDao.addCart(cart);

	}

	// 根据用户主键去查询当前用户所属购物车中的商品
	public List<HMP_Book_Cart> queryCarts(Integer userId) {
		return bookDao.queryCarts(userId);
	}

	// 根据书籍、用户主键查询购物车中该类书籍的总数量
	public Integer totalCartByBookId(Integer bookId, Integer userId) {
		return bookDao.totalCartByBookId(bookId, userId);
	}

	// 删除购物项逻辑删除
	public void deleteCartByBookId(Integer bookId, boolean flag) {
		bookDao.deleteCartByBookId(bookId, flag);

	}

	// 批量删除购物项 逻辑删除
	public void batchDeleteCart(Integer userId, Integer bookId, boolean flag) {
		bookDao.batchDeleteCart(userId, bookId, flag);
	}

	// 支付时新增地址
	public void addHMP_ADDRESS(HMP_Address hmp_address) {
		bookDao.addHMP_ADDRESS(hmp_address);
	}

	// 支付时新增购物订单
	public void addHMP_Form_Message(HMP_Form_Message hmp_form_message) {
		bookDao.addHMP_Form_Message(hmp_form_message);
	}

	// 支付时生成购物项信息
	public void addHMP_Book_Buy(HMP_Book_buy buy) {
		bookDao.addHMP_Book_Buy(buy);
	}

	// 查询刚新增收货地址的序列值
	public Integer queryAddressId() {
		return bookDao.queryAddressId();
	}

	// 查询刚新增购物订单的序列值
	public Integer queryShopMessageId() {
		return bookDao.queryShopMessageId();
	}

	// 支付后将购物车中已支付的商品修改为已支付
	public void editShopCart(Integer userId, Integer bookId, boolean flag) {
		bookDao.editShopCart(userId, bookId, flag);
	}

	// 加载当前用户所购买的订单数量
	public Integer ShopCartCount(Integer userId) {
		return bookDao.ShopCartCount(userId);
	}

	// 点击订单详情展现购物项信息
	public List<HMP_Book_buy> queryBuyByMessageId(Integer messageId) {
		return bookDao.queryBuyByMessageId(messageId);
	}

	public HMP_Address queryAddressById(Integer addressId) {
		return bookDao.queryAddressById(addressId);
	}

	// 收藏图书
	public void isCollection(BookInforMation book) {
		bookDao.isCollection(book);
	}

	// 我的收藏
	public List<BookInforMation> myCollection(Integer userId, boolean flag) {
		return bookDao.myCollection(userId, flag);
	}

	// 查询当前用户添加至购物车中商品的数量
	public Integer CartCount(Integer userId) {
		return bookDao.CartCount(userId);
	}

	//分页查询当前用户所填写的收货地址
	public List<HMP_Address> queryHmpAddress(QueryVo vo) {
		return bookDao.queryHmpAddress(vo);
	}

	// 查询当前用户所填写的收货地址数量
	public Integer queryHmpAddressCount(Integer userId) {
		return bookDao.queryHmpAddressCount(userId);
	}

	// 购物车页面中当用户点击减少按钮时修改对应购物项数目
	public Integer queryToUserCart(Integer userId, Integer bookId) {
		return bookDao.queryToUserCart(userId, bookId);
	}

	// 对购物车进行逻辑删除
	public void deleteCartById(Integer cartId, boolean flag) {
		bookDao.deleteCartById(cartId, flag);
	}
	//对订单进行分页查询
	public List<HMP_Form_Message> orderCartem(QueryVo vo) {
		return bookDao.orderCartem(vo);
	}
	//初始化用户的默认地址
	public void defaultAddress(Integer userId) {
		bookDao.defaultAddress(userId);
	}
	//修改用户地址
	public void editAddress(HMP_Address address) {
		bookDao.editAddress(address);
	}
	//设置用户的默认地址
	public void editDefaultAddress(Integer address_id, boolean flag) {
		bookDao.editDefaultAddress(address_id, flag);
	}
	//刪除用戶地址(逻辑删除)
	public void deleteAddressById(Integer address_id, boolean flag) {
		bookDao.deleteAddressById(address_id, flag);
	}

}
