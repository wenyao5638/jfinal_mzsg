package com.demo.interceptor;

import model.User;

import com.demo.controller.BaseController;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.Controller;

public class SecurityInteceptor extends BaseController implements Interceptor {

	@Override
	public void intercept(com.jfinal.core.ActionInvocation ai) {
		
		Controller login_con = ai.getController();
		
		User loginUser = login_con.getSessionAttr("user");
//		User loginUser = this.getUser();
		
		if (loginUser == null)
			login_con.redirect("/login.jsp");
		else
			ai.invoke();
		    	
	}
}
