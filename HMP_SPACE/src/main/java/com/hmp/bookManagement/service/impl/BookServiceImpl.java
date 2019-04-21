package com.hmp.bookManagement.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.hmp.bookManagement.dao.BookDao;
import com.hmp.bookManagement.entity.BookInforMation;
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

}
