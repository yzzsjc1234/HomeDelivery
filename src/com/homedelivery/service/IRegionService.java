package com.homedelivery.service;

import java.util.List;

import com.homedelivery.domain.Region;
import com.homedelivery.utils.PageBean;

public interface IRegionService {

	public void saveBatch(List<Region> list);

	public void pageQuery(PageBean pageBean);

}
