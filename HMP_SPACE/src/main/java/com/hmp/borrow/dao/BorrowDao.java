package com.hmp.borrow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmp.borrow.entity.HMP_Borrow_Detail;

public interface BorrowDao {
	
	//向租借明細中新增记录.
	public void addBorrowDetail(HMP_Borrow_Detail borrowDetail);
	
	//从数据库中检索不同的租借时间
	public List<String> queryBorrowTime(@Param("userId") Integer userId);
	
	//检索不同租借时间的数量
	public Integer queryBorrowCount(@Param("userId") Integer userId,@Param("borrowTime") String borrowTime);
	
	//检索不同租借时间租借记录
	public List<HMP_Borrow_Detail> queryBorrowDetailByBorrowTime(@Param("userId") Integer userId,@Param("borrowTime") String borrowTime);
	
	//归还书籍
	public void editBorrow(@Param("fborrow_detail_id")Integer fborrow_detail_id,@Param("returnTime")String returnTime);
	
	//通过id查询租借对象
	public  HMP_Borrow_Detail queryDetailById(@Param("fborrow_detail_id")Integer fborrow_detail_id);	
	
}
