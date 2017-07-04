package com.homedelivery.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.homedelivery.domain.Staff;
import com.homedelivery.service.IStaffService;
import com.homedelivery.web.action.base.BaseAction;

/**
 * Courier management
 */
@Controller
@Scope("prototype")
public class StaffAction extends BaseAction<Staff>{
	@Autowired
	private IStaffService staffService;
	
	/**
	 * Add courier
	 */
	public String add(){
		staffService.save(model);
		return "list";
	}
}