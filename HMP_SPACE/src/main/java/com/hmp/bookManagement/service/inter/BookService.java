package com.hmp.bookManagement.service.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.hmp.bookManagement.entity.BookInforMation;
import com.hmp.bookManagement.entity.HMP_Address;
import com.hmp.bookManagement.entity.HMP_Book_Cart;
import com.hmp.bookManagement.entity.HMP_Book_buy;
import com.hmp.bookManagement.entity.HMP_Form_Message;
import com.hmp.utils.QueryVo;

public interface BookService {
	// 新增图书
	public void addBook(BookInforMation book);

	// 初始化图书种类
	public JSONArray bookType();

	// 书籍详情信息展示
	public BookInforMation queryBookById(Integer bookId);

	// 书籍总条数
	public Integer totalPage();

	// 分页检索
	public List<BookInforMation> pageList(QueryVo vo);

	// 根据书籍种类检索书籍
	public List<BookInforMation> queryBookByType(QueryVo vo);

	// 根据书籍种类检索总条数
	public Integer totalPageBybookType(Integer typeId);

	// 根据查询信息检索总条数
	public Integer totalPageBybookName(String bookName);

	// 添加购物车
	public void addCart(HMP_Book_Cart cart);

	// 根据用户主键去查询用户所加入购物车中的商品
	public List<HMP_Book_Cart> queryCarts(Integer userId);

	// 根据书籍/用户主键查询购物车中该类书籍的总数量
	public Integer totalCartByBookId(Integer bookId, Integer userId);

	// 删除购物项(逻辑删除)
	public void deleteCartByBookId(Integer bookId, boolean flag);

	// 批量删除购物项(逻辑删除)
	public void batchDeleteCart(@Param("userId") Integer userId, @Param("bookId") Integer bookId,
			@Param("flag") boolean flag);

	// 购买商品后新增数据至收货地址表中
	public void addHMP_ADDRESS(HMP_Address hmp_address);

	// 购买商品后生成支付订单
	public void addHMP_Form_Message(HMP_Form_Message hmp_form_message);

	// 生成购物项信息
	public void addHMP_Book_Buy(HMP_Book_buy buy);

	// 查询刚新增收货地址的序列值
	public Integer queryAddressId();

	// 查询刚新增购物订单的序列值
	public Integer queryShopMessageId();

	// 支付后将购物车中已支付的商品修改为已支付
	public void editShopCart(@Param("user_id") Integer user_id, @Param("bookId") Integer bookId,
			@Param("flag") boolean flag);

	// 查询当前用户所购买的订单数量
	public Integer ShopCartCount(Integer userId);

	// 点击订单详情展现购物项信息
	public List<HMP_Book_buy> queryBuyByMessageId(Integer messageId);

	// 根据主键查询唯一的收货地址信息
	public HMP_Address queryAddressById(Integer addressId);

	// 根据书籍主键去收藏该书籍
	public void isCollection(BookInforMation book);

	// 我的收藏
	public List<BookInforMation> myCollection(Integer userId, boolean flag);

	// 查询当前用户添加至购物车中商品的数量
	public Integer CartCount(@Param("userId") Integer userId);

	// 分页查询当前用户所填写的收货地址
	public List<HMP_Address> queryHmpAddress(QueryVo vo);

	// 查询当前用户所填写的收货地址数量
	public Integer queryHmpAddressCount(@Param("userId") Integer userId);

	// 购物车页面中当用户点击减少按钮时修改对应购物项数目
	public Integer queryToUserCart(@Param("userId") Integer userId, @Param("bookId") Integer bookId);

	//对购物车进行逻辑删除
	public void deleteCartById(@Param("cartId")Integer cartId,@Param("flag") boolean flag);
	
	//对订单进行分页查询
	public List<HMP_Form_Message> orderCartem(QueryVo vo);
	
	//初始化用户的默认地址
	public void defaultAddress(@Param("userId")Integer userId);
	
	//设置用户的默认地址
	public void editDefaultAddress(@Param("addressId")Integer address_id,@Param("flag")boolean flag);
	
	//编辑用户的收货地址
	public void editAddress(HMP_Address address);
	
	//删除用户地址(逻辑删除)
	public void deleteAddressById(@Param("addressId")Integer address_id,@Param("flag")boolean flag);
}
