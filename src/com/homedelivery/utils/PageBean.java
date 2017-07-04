package com.homedelivery.utils;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

/**
 * PageBean information
 */
public class PageBean {
	private int currentPage;
	private int pageSize;
	private DetachedCriteria detachedCriteria;//detached criteria query object
	private int total;
	private List rows;//Need to display in current page
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public DetachedCriteria getDetachedCriteria() {
		return detachedCriteria;
	}
	public void setDetachedCriteria(DetachedCriteria detachedCriteria) {
		this.detachedCriteria = detachedCriteria;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	
}
