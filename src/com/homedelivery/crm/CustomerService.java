package com.homedelivery.crm;

import java.util.List;

import cn.homedelivery.crm.domain.Customer;

// Customer service interface
public interface CustomerService {
	// Customers without association
	public List<Customer> findnoassociationCustomers();

	// Customers with association via decidedzone id
	public List<Customer> findhasassociationCustomers(String decidedZoneId);

	// Assign customers to decidedzone 
	public void assignCustomersToDecidedZone(Integer[] customerIds, String decidedZoneId);
}
