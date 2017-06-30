package com.homedelivery.dao.impl;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import com.homedelivery.dao.IUserDao;
import com.homedelivery.dao.base.impl.BaseDaoImpl;
import com.homedelivery.domain.User;

@Repository
//@Scope("prototype") --> for mult object
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao{
	public User findByUsernameAndPassword(String username, String password) {
	 return null;
	}	

}
