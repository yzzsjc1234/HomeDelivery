package com.homedelivery.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.homedelivery.dao.ISubareaDao;
import com.homedelivery.domain.Subarea;
import com.homedelivery.service.ISubareaService;
import com.homedelivery.utils.PageBean;


@Service
@Transactional
public class SubareaServiceImpl implements ISubareaService{
	@Resource
	private ISubareaDao subareaDao;

	public void save(Subarea model) {
		subareaDao.save(model);
	}
	
	public void pageQuery(PageBean pageBean) {
		subareaDao.pageQuery(pageBean);
	}
	
	public  List<Subarea> findAll(){
		return subareaDao.findAll();
	}
	/**
	 * query subarea which doesn't associates with decidedzone
	 */
	public List<Subarea> findListNotAssociation() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Subarea.class);
		detachedCriteria.add(Restrictions.isNull("decidedzone"));
		return subareaDao.findByCriteria(detachedCriteria );
	}
}
