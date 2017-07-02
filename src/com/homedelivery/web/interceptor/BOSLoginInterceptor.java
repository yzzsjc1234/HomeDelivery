package com.homedelivery.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.homedelivery.domain.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 *  Customize a struts2 interceptor to redirect to login page if user do not login
 * 
 */
public class BOSLoginInterceptor extends MethodFilterInterceptor {
	// intercept method
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("loginUser");
		if(user == null){
			//if user is null
			return "login";
		}
		return invocation.invoke(); //continue
	}
}
