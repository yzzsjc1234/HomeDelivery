package com.homedelivery.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.homedelivery.dao.IRegionDao;
import com.homedelivery.domain.Region;
import com.homedelivery.service.IRegionService;
import com.homedelivery.utils.PageBean;



@Service
@Transactional
public class RegionServiceImpl implements IRegionService{
	@Resource
	private IRegionDao regionDao;

	public void saveBatch(List<Region> list) {
		for (Region region : list) {
			regionDao.saveOrUpdate(region);
		}
	}

	public void pageQuery(PageBean pageBean) {
		regionDao.pageQuery(pageBean);
	}
	
	public List<Region> findAll() {
		return regionDao.findAll();
	}

	public List<Region> findByQ(String q) {
		return regionDao.findByQ(q);
	}

}
