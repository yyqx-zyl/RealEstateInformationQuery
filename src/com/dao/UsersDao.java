package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Users;

public interface UsersDao {
	//登录
	Users login(Users users);

	int save(Users user);
	
}
