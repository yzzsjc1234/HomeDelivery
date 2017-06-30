package com.homedelivery.dao;

import com.homedelivery.dao.base.IBaseDao;
import com.homedelivery.domain.User;

public interface IUserDao extends IBaseDao<User>{
	public User findByUsernameAndPassword(String username, String password);
}
