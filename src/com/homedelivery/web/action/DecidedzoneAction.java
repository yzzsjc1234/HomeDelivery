package com.homedelivery.web.action;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.homedelivery.domain.Decidedzone;
import com.homedelivery.web.action.base.BaseAction;



/**
 * Decidedzone management
 */

@Controller
@Scope("prototype")
public class DecidedzoneAction extends BaseAction<Decidedzone> {
	// receive subarea id
	private String[] subareaid;

	public void setSubareaid(String[] subareaid) {
		this.subareaid = subareaid;
	}

	/**
	 * Add decidedzone
	 */
	
	public String add() {
		decidedzoneService.save(model, subareaid);
		return "list";
	}
	
	/**
	 * Query by page
	 * @throws IOException
	 */
	public String pageQuery() throws IOException {
		decidedzoneService.pageQuery(pageBean);
		//PageBean transfers to json
		this.writePageBean2Json(pageBean, new String[] { "decidedzones",
				"subareas", "currentPage", "detachedCriteria", "pageSize" });
		return NONE;
	}

}
