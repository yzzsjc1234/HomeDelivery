package com.homedelivery.dao.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.homedelivery.dao.base.IBaseDao;

/**
 * commonly function impl
 */
public class BaseDaoImpl<T> extends HibernateDaoSupport implements IBaseDao<T> {
	// entity type
	private Class<T> entityClass;

	// annotation for dependency injection
	@Resource //get bean by name for sessionFactory
	public void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	/**
	 * get entity class
	 */
	public BaseDaoImpl() {
		// get patent's（BaseDaoImpl<T>）type
		ParameterizedType genericSuperclass = (ParameterizedType) this
				.getClass().getGenericSuperclass();
		// get parent class's type array
		Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
		entityClass = (Class<T>) actualTypeArguments[0];
	}
	
	@Override
	public void save(T entity) {
		this.getHibernateTemplate().save(entity);
	}

	@Override
	public void delete(T entity) {
		this.getHibernateTemplate().delete(entity);
	}

	@Override
	public void update(T entity) {
		this.getHibernateTemplate().update(entity);
	}

	@Override
	public T findById(Serializable id) {
		return this.getHibernateTemplate().get(entityClass, id);
	}

	@Override
	public List<T> findAll() {
		String hql = "FROM  " + entityClass.getSimpleName();
		return this.getHibernateTemplate().find(hql);
	}

}
