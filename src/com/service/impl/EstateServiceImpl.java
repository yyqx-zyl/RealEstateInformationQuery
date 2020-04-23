package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dao.EstateDao;
import com.pojo.Estate;
import com.service.EstateService;

@Service("EstateService")
public class EstateServiceImpl implements EstateService {
	@Autowired
	@Qualifier("estateDao")
	private EstateDao estateDao;
	
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return estateDao.getCount();
	}

	@Override
	public List<Estate> getEstateList(String type, String text, int start, int PageSize) {
		List<Estate> list=estateDao.getEstateList(type, text,start,PageSize);
		if (list!=null) {
			return list;
		}else {
			return null;
		}
	}

}
