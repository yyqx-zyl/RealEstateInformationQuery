package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Estate;

public interface EstateDao {
	//获得数据                              查询的类型   
	List<Estate> getEstateList(@Param("type") String type,@Param("text") String text,
			@Param("start") int start, @Param("pageSize")int pageSize);
	//数据总条数
	int getCount();
	
	
}
