package com.homedelivery.web.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.homedelivery.domain.Subarea;
import com.homedelivery.web.action.base.BaseAction;


/**
 * Subarea management
 */

@Controller
@Scope("prototype")
public class SubareaAction extends BaseAction<Subarea> {
	public String add() {
		subareaService.save(model);
		return "list";
	}
}
