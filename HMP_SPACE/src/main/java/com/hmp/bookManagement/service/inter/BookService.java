package com.hmp.bookManagement.service.inter;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.hmp.bookManagement.entity.BookInforMation;
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
	
	//根据查询信息检索总条数
	public Integer totalPageBybookName(String bookName);
	
}
