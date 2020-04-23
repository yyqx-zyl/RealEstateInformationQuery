package com.service;

import java.util.List;

import com.pojo.Estate;

public interface EstateService {
	//获得数据                              查询的类型   
		List<Estate> getEstateList(String type,String text, int start, int PageSize);
		//总数据条数
		int getCount();
}
