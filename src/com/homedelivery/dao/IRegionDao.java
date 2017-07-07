package com.homedelivery.dao;


import java.util.List;

import com.homedelivery.dao.base.IBaseDao;
import com.homedelivery.domain.Region;



public interface IRegionDao extends IBaseDao<Region> {

	List<Region> findByQ(String q);

}
