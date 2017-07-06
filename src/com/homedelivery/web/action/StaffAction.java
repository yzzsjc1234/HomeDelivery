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
		
		
		staffService.pageQuery(pageBean);
		//PageBean object tranfers to json to get raws data
		this.writePageBean2Json(pageBean, new String[]{"currentPage","detachedCriteria","pageSize"});
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
	
	/**
	 * edit courier
	 */
	public String edit(){
		//get staff object from database firstly
		//if we use update directly will override other parameter to null like decidezone
		Staff staff = staffService.findById(model.getId());
		
		//override
		staff.setName(model.getName());
		staff.setTelephone(model.getTelephone());
		staff.setStation(model.getStation());
		staff.setHaspda(model.getHaspda());
		staff.setStandard(model.getStandard());
		
		staffService.update(staff);
		return "list";
	}
}