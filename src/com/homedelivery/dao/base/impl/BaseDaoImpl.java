package com.homedelivery.dao.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.homedelivery.dao.base.IBaseDao;
import com.homedelivery.utils.PageBean;

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
	
	/**
	 * commonly update method
	 */
	public void executeUpdate(String queryName, Object... objects) {
		Session session = this.getSession();// get session from the local thread 
		// get hql by name from User.hbm.xml
		Query query = session.getNamedQuery(queryName);
		// assign "?" in hql 
		int i = 0;
		for (Object arg : objects) {
			query.setParameter(i++, arg);
		}
		query.executeUpdate();// execute update
	}
	
	/**
	 * commonly query by pages method
	 */
	public void pageQuery(PageBean pageBean) {
		int currentPage = pageBean.getCurrentPage();
		int pageSize = pageBean.getPageSize();
		DetachedCriteria detachedCriteria = pageBean.getDetachedCriteria();
		//Total data rows----select count(*) from bc_staff
		//To change Hibernate framework's sql format
		detachedCriteria.setProjection(Projections.rowCount());//select count(*) from bc_staff
		List<Long> list = this.getHibernateTemplate().findByCriteria(detachedCriteria);
		Long total = list.get(0);
		pageBean.setTotal(total.intValue());//set total value
		detachedCriteria.setProjection(null);//edit sql format to default like : select * from ....
		//To reset the reflect relation between table and class
		detachedCriteria.setResultTransformer(DetachedCriteria.ROOT_ENTITY);
		//List for raws data which need to display in current page
		int firstResult = (currentPage - 1) * pageSize;
		int maxResults = pageSize;
		List rows = this.getHibernateTemplate().findByCriteria(detachedCriteria, firstResult, maxResults);
		pageBean.setRows(rows);
	}

}
