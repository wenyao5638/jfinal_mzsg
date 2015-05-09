package com.demo.controller;

import java.util.List;

import model.Function;
import model.Role;
import model.User;
import server.LoginManager;
import server.RoleManager;
import server.UserManager;

import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.ActionKey;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;
@Before(IocInterceptor.class)
@ClearInterceptor(ClearLayer.ALL)
public class LoginController extends BaseController{
	
	@Inject.BY_NAME
	private LoginManager loginManager;
	@Inject.BY_NAME
	private UserManager userManager;
	@Inject.BY_NAME
	private RoleManager roleManager;


	private User user = new User();

	private Role role = new Role();


	public void index(){
		render("/login.jsp");
	}
	
	
	public void loginCheck() {
		try {
			String result = "";
			
			String username = getPara("username");
			String password = getPara("password");
			password = md5Digest(password);
			User userin = loginManager.findUserbyname(username);
			if (userin != null) {
				if (userin.getStr("syzt").equals("1")) {
					if (userin.getStr("password").equals(password)) {
						getSession().setAttribute("user", userin);
						System.out
								.println("User>>>>>>>"
										+ userin.getStr("usercnname")
										+ "  Area>>>>>>>"
										+ userin.get("area")
										+ "  LoginTime>>>>>"
										+ loginManager.findTimestamp()
												.substring(0, 19));
						result = "true";
					} else {
						result = "密码输入错误!";
					}
				} else if (userin.getStr("syzt").equals("2")) {
					result = "用户已被注销,请联系管理人员！";
				} else if (userin.getStr("syzt").equals("0")) {
					result = "用户已被删除,请联系管理人员！";
				}
			} else {
				result = "查无此用户,请检查用户名是否输入正确!";
			}
			System.out.println("session User :"+getSessionAttr("user"));
			renderJson(result);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public void loginforward() {
		try {
			user = (User) this.getSession().getAttribute("user");
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime_1 = new java.util.Date();
	String nows = (String) formatter.format(currentTime_1);
			userManager.updateLastLoginTime(this.getUser().getStr("username()"),nows);
		
			String treeString = "";
			String href = "";
			if (user.getStr("role").equals("-1")&&user.getStr("syzt").equals("1")) {
				List functionList = loginManager.findAllFunction();
				for (int i = 0; i < functionList.size(); i++) {
					Function function = (Function) functionList.get(i);
					if (i > 0) {
						treeString += ",";
					}
					treeString += "{id:\"" + function.getStr("id")
					+ "\", pId:\"" + function.getStr("pid")
					+ "\", name:\"" + function.getStr("cnname")
					+ "\", icons:\""+function.getStr("icon")+"\",href:\"" + function.getStr("href");
					href = function.getStr("href")==null?"":function.getStr("href");
					/*if(href.contains("?")){
						treeString += "-";
					}else{
						treeString += "?";
					}*/
					treeString += "/";
					treeString +=""+function.getStr("id");
					if(treeString.contains("?")){
						treeString += "-";
					}else{
						treeString += "?";
					}
					treeString += "1\"}";

				}
			} else {
				treeString = loginManager.findRoleFunction(this.getUser()
						.getStr("role"), this.getUser().getStr("username"));
			}
			this.getRequest().setAttribute("treeString", treeString);
			if (this.getUser().getStr("password").equals(md5Digest("123456"))) {
				this.getRequest().setAttribute("info", "您的密码过于简单,请修改密码!");
			}
			String systime = loginManager.findSystime();
			String timestamp = loginManager.findTimestamp();
			render("/interface/main.jsp");;
		} catch (Exception e) {
			 e.printStackTrace();
			 render("/login3302.jsp");
		}
	}

	public void loginout() {
		try {
			this.getSession().removeAttribute("user");
		} catch (Exception e) {
		}
	}

	public String worklist() {
		try {

			this.getRequest().setAttribute("dbstr", "bbbbbbbbbbbbbbbbbb");
			this.getRequest().setAttribute("tjstr", "aaaaaaaaaaaaa");

			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
