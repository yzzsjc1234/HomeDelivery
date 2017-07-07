package com.homedelivery.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.homedelivery.dao.ISubareaDao;
import com.homedelivery.domain.Subarea;
import com.homedelivery.service.ISubareaService;


@Service
@Transactional
public class SubareaServiceImpl implements ISubareaService{
	@Resource
	private ISubareaDao subareaDao;

	public void save(Subarea model) {
		subareaDao.save(model);
	}
}
