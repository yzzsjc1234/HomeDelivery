package com.homedelivery.service;

import java.util.List;

import com.homedelivery.domain.Subarea;
import com.homedelivery.utils.PageBean;



public interface ISubareaService {

	public void save(Subarea model);
	
	public void pageQuery(PageBean pageBean);

	public List<Subarea> findAll();

	public List<Subarea> findListNotAssociation();
}
