package com.homedelivery.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.homedelivery.dao.IStaffDao;
import com.homedelivery.domain.Staff;
import com.homedelivery.service.IStaffService;
import com.homedelivery.utils.PageBean;


@Service
@Transactional
public class StaffServiceImpl implements IStaffService{
	@Autowired
	private IStaffDao staffDao;

	public void save(Staff model) {
		staffDao.save(model);
	}
	public void pageQuery(PageBean pageBean) {
		staffDao.pageQuery(pageBean);
	}
	
	/**
	 * batch delete
	 */
	public void deleteBatch(String ids) {
		String[] staffIds = ids.split(",");
		for (String id : staffIds) {
			staffDao.executeUpdate("staff.delete", id);
		}
	}
	
	public Staff findById(String id) {
		return staffDao.findById(id);
	}
	
	public void update(Staff staff) {
		staffDao.update(staff);
	}
	
	/**
	 * query couriers which is not deleted, deltag is "0"
	 */
	public List<Staff> findListNotDelete() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Staff.class);
		detachedCriteria.add(Restrictions.ne("deltag", "1")); // "ne" means  "not equals"
		return staffDao.findByCriteria(detachedCriteria);
	}
	
}
