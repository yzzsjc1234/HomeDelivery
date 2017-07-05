package com.homedelivery.service;

import com.homedelivery.domain.Staff;
import com.homedelivery.utils.PageBean;

public interface IStaffService {

	public void save(Staff model);

	public void pageQuery(PageBean pageBean);

	public void deleteBatch(String ids);
}
