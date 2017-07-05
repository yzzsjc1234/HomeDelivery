package com.homedelivery.web.action;

import java.io.IOException;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.homedelivery.domain.Staff;
import com.homedelivery.service.IStaffService;
import com.homedelivery.utils.PageBean;
import com.homedelivery.web.action.base.BaseAction;

/**
 * Courier management
 */
@Controller
@Scope("prototype")
public class StaffAction extends BaseAction<Staff>{
	@Autowired
	private IStaffService staffService;
	
	private int page;
	private int rows;//row count need to display
	public void setRows(int rows) {
		this.rows = rows;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	/**
	 * Add courier
	 */
	public String add(){
		staffService.save(model);
		return "list";
	}
	
	/**
	 * Query by pages
	 * @throws IOException 
	 */
	public String pageQuery() throws IOException{
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(page);
		pageBean.setPageSize(rows);
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Staff.class);
		pageBean.setDetachedCriteria(detachedCriteria);
		staffService.pageQuery(pageBean);
		//PageBean object tranfers to json to get raws data
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[]{"currentPage","detachedCriteria","pageSize"});
		JSONObject jsonObject = JSONObject.fromObject(pageBean, jsonConfig);
		String json = jsonObject.toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	
	//receive ids parameter 
	private String ids;
	public void setIds(String ids) {
		this.ids = ids;
	}
		
	/**
		* batch delete function (logical delete)
	*/
	public String delete(){
		staffService.deleteBatch(ids);
		return "list";
	}
}