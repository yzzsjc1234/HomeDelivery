package com.homedelivery.dao.impl;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import com.homedelivery.dao.IUserDao;
import com.homedelivery.dao.base.impl.BaseDaoImpl;
import com.homedelivery.domain.User;

@Repository
//@Scope("prototype") --> for multi object
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao{
	/**
	 * find user by username & password
	 */
	public User findByUsernameAndPassword(String username, String password) {
		String hql = "FROM User u WHERE u.username = ? AND u.password = ?";
		List<User> list = this.getHibernateTemplate().find(hql, username,password);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}	
}
