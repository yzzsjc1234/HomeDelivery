package com.homedelivery.service;

import com.homedelivery.domain.User;

public interface IUserService {

	public User login(User model);
	public void editPassword(String password, String id);
}
