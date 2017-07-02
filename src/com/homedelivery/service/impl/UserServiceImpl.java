package com.homedelivery.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.homedelivery.dao.IUserDao;
import com.homedelivery.domain.User;
import com.homedelivery.service.IUserService;
import com.homedelivery.utils.MD5Utils;

@Service
@Transactional
public class UserServiceImpl implements IUserService{
	//inject dao
	@Autowired
	private IUserDao userDao;

	public User login(User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		password = MD5Utils.md5(password);//md5 encode
		return userDao.findByUsernameAndPassword(username,password);
	}
	
	public void editPassword(String password, String id) {
		userDao.executeUpdate("editPassword", password,id);
	}

}
