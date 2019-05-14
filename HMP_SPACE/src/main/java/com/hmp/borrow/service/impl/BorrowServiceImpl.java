package com.hmp.borrow.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.hmp.borrow.dao.BorrowDao;
import com.hmp.borrow.entity.HMP_Borrow_Detail;
import com.hmp.borrow.service.inter.BorrowService;
@Service
public class BorrowServiceImpl implements BorrowService{
	@Resource
	private BorrowDao borrowDao;
	//向租借明细中新增数据
	public void addBorrowDetail(HMP_Borrow_Detail borrowDetail) {
		borrowDao.addBorrowDetail(borrowDetail);
	}
	
	//从数据库中检索不同的租借时间
	public List<String> queryBorrowTime(Integer userId) {
		return borrowDao.queryBorrowTime(userId);
	}

	//检索不同租借时间的数量
	public Integer queryBorrowCount(Integer userId, String borrowTime) {
		return borrowDao.queryBorrowCount(userId, borrowTime);
	}

	//检索不同租借时间租借记录
	public List<HMP_Borrow_Detail> queryBorrowDetailByBorrowTime(Integer userId, String borrowTime) {
		return borrowDao.queryBorrowDetailByBorrowTime(userId, borrowTime);
	}
	//归还书籍
	public void editBorrow(@Param("fborrow_detail_id")Integer fborrow_detail_id,@Param("returnTime")String returnTime) {
		borrowDao.editBorrow(fborrow_detail_id,returnTime);
	}
	//通过id查询租借对象
	public HMP_Borrow_Detail queryDetailById(Integer fborrow_detail_id) {
		return borrowDao.queryDetailById(fborrow_detail_id);
	}
}
