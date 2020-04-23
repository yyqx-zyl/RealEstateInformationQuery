package com.service;

import java.util.List;

import com.pojo.Users;

public interface UsersService {
	Users login(Users users);

	boolean save(Users user);
}
