package com.demo.route;

import com.demo.controller.AdminController;
import com.jfinal.config.Routes;

public class FrontRout extends Routes{

	@Override
	public void config() {
		// TODO Auto-generated method stub
		//admin route
		add("/admin/", AdminController.class);
		//.....
	}
	
}
