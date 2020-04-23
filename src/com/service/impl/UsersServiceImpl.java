package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dao.UsersDao;
import com.pojo.Users;
import com.service.UsersService;

@Service("UsersService")
public class UsersServiceImpl implements UsersService {
	@Autowired
	@Qualifier("usersDao")
	private UsersDao usersDao;
	
	
	@Override
	public Users login(Users users) {
		Users list=usersDao.login(users);
		if (list!=null) {
			return list;
		}else {
			return null;
		}
	}


	@Override
	public boolean save(Users user) {
		int num=usersDao.save(user);
		if (num>0) {
			return true;
		}else {
			return false;
		}
		
	}

}
