package com.homedelivery.dao.base;

import java.io.Serializable;
import java.util.List;

import com.homedelivery.utils.PageBean;

/**
 * commonly function
 */
public interface IBaseDao<T> {
	public void save(T entity);
	public void delete(T entity);
	public void update(T entity);
	public void saveOrUpdate(T entity);
	public T findById(Serializable id);
	public List<T> findAll();
	//for commonly used modify method
	public void executeUpdate(String queryName,Object ...objects);
	public void pageQuery(PageBean pageBean);
}
