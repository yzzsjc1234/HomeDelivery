package com.homedelivery.web.action;

import java.io.IOException;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.homedelivery.crm.domain.Customer;

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
	/**
	 * get customers without association decidedzone
	 * @return
	 * @throws IOException
	 */
	public String findnoassociationCustomers() throws IOException{
		List<Customer> list = customerService.findnoassociationCustomers();
		String[] excludes = new String[]{"station","address"};
		this.writeList2Json(list, excludes);
		return NONE;
	}
	
	/**
	 * get customers with this association decidedzone
	 * @return
	 * @throws IOException
	 */
	public String findhasassociationCustomers() throws IOException{
		List<Customer> list = customerService.findhasassociationCustomers(model.getId());
		String[] excludes = new String[]{"station","address"};
		this.writeList2Json(list, excludes);
		return NONE;
	}
	
	private Integer[] customerIds;
	
	/**
	 * Assign customers to the decidedzone
	 * @return
	 */
	public String assigncustomerstodecidedzone(){
		customerService.assignCustomersToDecidedZone(customerIds, model.getId());
		return "list";
	}

	public Integer[] getCustomerIds() {
		return customerIds;
	}

	public void setCustomerIds(Integer[] customerIds) {
		this.customerIds = customerIds;
	}

}
