package com.homedelivery.web.action;

import java.io.IOException;

import javax.annotation.Resource;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.homedelivery.domain.User;
import com.homedelivery.service.IUserService;
import com.homedelivery.utils.MD5Utils;
import com.homedelivery.web.action.base.BaseAction;

@Controller//("abc") annotion in web layer by name 
@Scope("prototype")
public class UserAction extends BaseAction<User>{
	
	
	//
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String login(){
		//get the Capcha from "key" in validatecode.jsp
		String key = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
		
		//Checkcode is right？
		if(StringUtils.isNotBlank(checkcode) && checkcode.equals(key)){
			//right
			User user = userService.login(model);
			if(user != null){
				//set user to session and redirect
				ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
				return "home";
			}else{
				// set actionerror for user null
				this.addActionError(this.getText("loginError"));
				return "login";
			}
		}else{
			//check code is wrong
			this.addActionError(this.getText("validateCodeError"));
			return "login";
		}
	}
	/**
	 * user log out
	 */
	public String logout(){
		//invalidate session
		ServletActionContext.getRequest().getSession().invalidate();
		return "login";
	}
	/**
	 * modify password
	 * @throws IOException 
	 */
	public String editPassword() throws IOException{
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		String password = model.getPassword();//new password
		password = MD5Utils.md5(password);
		String flag = "1";
		try{
			userService.editPassword(password,user.getId());
		}catch (Exception e) {
			//failed
			flag = "0";
		}
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(flag);
		return NONE;
	}
}