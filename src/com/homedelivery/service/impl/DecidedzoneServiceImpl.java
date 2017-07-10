package com.homedelivery.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.homedelivery.dao.IDecidedzoneDao;
import com.homedelivery.dao.ISubareaDao;
import com.homedelivery.domain.Decidedzone;
import com.homedelivery.domain.Subarea;
import com.homedelivery.service.IDecidedzoneService;
import com.homedelivery.utils.PageBean;


@Service
@Transactional
public class DecidedzoneServiceImpl implements IDecidedzoneService{
	@Autowired
	private IDecidedzoneDao decidedzoneDao;
	@Autowired
	private ISubareaDao subareaDao;
	
	/**
	 * Add decidedzone
	 */
	public void save(Decidedzone model, String[] subareaid) {
		decidedzoneDao.save(model);
		for (String sid : subareaid) {
			Subarea subarea = subareaDao.findById(sid);// persistent object
			//Because one to many's decidedzone foreigner key setting is "inverse true", so need to update from "many" side
			//UPDATE Subarea SET decidedzone = ? WHERE id = ?
			subarea.setDecidedzone(model);
		}
	}
	
	public void pageQuery(PageBean pageBean) {
		decidedzoneDao.pageQuery(pageBean);
	}

}
