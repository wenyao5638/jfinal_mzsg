package com.demo.controller;

import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Area;
import model.Role;
import model.User;
import server.AreaManager;
import server.RoleManager;
import server.UserManager;

import com.google.gson.Gson;
import com.jfinal.plugin.spring.Inject;
import common.Page;
public class UserController extends BaseController {

	@Inject.BY_NAME
	private UserManager userManager;
	@Inject.BY_NAME
	private AreaManager areaManager;
	@Inject.BY_NAME
	private RoleManager roleManager;

	private User search;

	private User u;

	public void userList() {
		try {
			String rp = this.getRequest().getParameter("rows");
			String pageString = this.getRequest().getParameter("page");

			if (rp == null || rp.equals("") || rp.equals("10"))
				rp = "10";
			if (pageString == null || pageString.equals(""))
				pageString = "1";

			int rpint = Integer.parseInt(rp);
			int pageint = Integer.parseInt(pageString);
			Page page = new Page();

			page.setPageSize(rpint);
			page.setCurrentPage(pageint);
			String order = "";
			search = getModel(User.class)
					.set("username", getPara("search.username"))
					.set("usercnname", getPara("search.usercnname"))
					.set("area", getPara("search.area"))
					.set("role", getPara("search.role"));
			
			if (search.getStr("area") == null || search.getStr("area").equals("")) {
				search.set("area",this.getUser().getStr("area"));
				search.set("syzt","1");
			}
			System.out.println("search: "+search);
			page = userManager.findByPageWithBean(page, search);
			List<User> lists = page.getResult();
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("total", page.getTotalElement());

			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			List<vo.User> list = new ArrayList();
			for (User c : lists) {
				vo.User n = new vo.User();
				n.setUsername(c.getStr("username").toString());

				n.setUsercnname(c.getStr("usercnname") == null ? " " : c.getStr("usercnname"));
				n.setAreaname(c.getStr("name") == null ? " " : c.getStr("name"));
				n.setArea(c.getStr("area") == null ? " " : c.getStr("area"));
				n.setBmmc(c.getStr("bmmc") == null ? " " : c.getStr("bmmc"));
				n.setCreatetime(c.getTimestamp("createtime") == null ? " " : c.getTimestamp("createtime").toString().substring(
						0, 10));
				n.setCreateuser(c.getStr("createuser") == null ? " " : c.getStr("createuser"));
				n.setLastlogintime(c.getTimestamp("lastlogintime") == null ? " " : c.getTimestamp("lastlogintime").toString()
						.substring(0, 10));
				n.setRoleid(c.getStr("roleid") == null ? " " : c.getStr("roleid"));
				n.setRolename(c.getStr("rolename") == null ? " " : c.getStr("rolename"));

				n.setSyzt(c.getStr("syzt") == null ? " " : c.getStr("syzt"));
				n.setPhone(c.getStr("phone") == null ? " " : c.getStr("phone"));
				n.setOpt("<a href=\"javascript:edit('" + n.getUsername()
						+ "','0')\"><font color='#FF8400'>查看</font></a>"
						+ "&nbsp;&nbsp;" + "<a href=\"javascript:reUser('"
						+ n.getUsername()
						+ "')\"><font color='#FF8400'>初始化</font></a>"
						+ "&nbsp;&nbsp;" + "<a href=\"javascript:del('"
						+ n.getUsername()
						+ "')\"><font color='#FF8400'>删除</font></a>");

				list.add(n);
			}
			jsonMap.put("rows", list);
			setAttr("user", search);
			renderJson(jsonMap);
		} catch (Exception e) {
			e.printStackTrace();
			render("/Error.jsp");
		}
	}

	public void usersDialog() {
		try {
			String rp = this.getRequest().getParameter("rows");
			String pageString = this.getRequest().getParameter("page");

			if (rp == null || rp.equals("") || rp.equals("10"))
				rp = "10";
			if (pageString == null || pageString.equals(""))
				pageString = "1";

			int rpint = Integer.parseInt(rp);
			int pageint = Integer.parseInt(pageString);
			Page page = new Page();

			page.setPageSize(rpint);
			page.setCurrentPage(pageint);
			String order = "";

			if (search == null) {
				search = new User();
				search.set("area",this.getUser().get("area"));
			}

			if (search != null) {
				search.set("syzt","1");
				page = this.userManager.findByPageWithBean(page, search);
			}
			List<Object[]> lists = new ArrayList();
			if (page.getResult() != null) {
				lists = page.getResult();
			}
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("total", page.getTotalElement());
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			List<vo.User> list = new ArrayList();
			for (Object[] c : lists) {
				vo.User n = new vo.User();
				n.setUsername(c[0].toString());
				n.setUsercnname(c[1] == null ? " " : c[1].toString());
				n.setAreaname(c[3] == null ? " " : c[3].toString());
				n.setArea(c[2] == null ? " " : c[2].toString());
				n.setBmmc(c[9] == null ? " " : c[9].toString());
				n.setCreatetime(c[7] == null ? " " : c[7].toString());
				n.setCreateuser(c[6] == null ? " " : c[6].toString());
				n.setLastlogintime(c[8] == null ? " " : c[8].toString());
				n.setRoleid(c[5] == null ? " " : c[5].toString());
				n.setRolename(c[4] == null ? " " : c[4].toString());
				n.setSyzt(c[12] == null ? " " : c[12].toString());
				list.add(n);
			}
			jsonMap.put("rows", list);
//			result = JSONObject.fromObject(jsonMap);
//			this.setResult(result);
//			return SUCCESS;
			render("");
		} catch (Exception e) {
			renderError(500, "");
		}
	}

	public void findUser() {
		try {
			String result = "";
//			u = getModel(User.class).set("username", getPara("u.username"));
			u = this.userManager.findUser(
					getModel(User.class).set("username", getPara("u.username")));
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");

			vo.User user = new vo.User();
			user.setUsername(u.getStr("username"));
			user.setPhone(u.getStr("phone"));
			user.setUsercnname(u.getStr("usercnname"));
			user.setRoleid(u.getStr("role"));
			user.setArea(u.getStr("area"));
			user.setBmmc(u.getStr("bmmc"));
			user.setSyzt(u.getStr("syzt"));
			Role role = this.roleManager.findRole(u.getStr("role"));
			String rolename = (role == null ? "" : role.getStr("rolename"));
			Area area = this.areaManager.findArea(u.getStr("area"));
			String areaname = (area == null ? "" : area.getStr("name"));
			user.setRolename(rolename);
			user.setAreaname(areaname);
			String createtime = "";
			if (u.getTimestamp("createtime") != null) {
//				createtime = formatter.format(u.getStr("createtime").toString());
				user.setCreatetime(u.getTimestamp("createtime").toString());
			}
			String lastlogintime = "";
			if (u.getTimestamp("lastlogintime") != null) {
//				lastlogintime = formatter.format(u.getStr("lastlogintime").toString());
				user.setLastlogintime(u.getTimestamp("createtime").toString());
			}
			
			

			result = "success";
			renderJson(result);
			renderJson(user);
		} catch (Exception e) {
			e.printStackTrace();
			renderError(500);
		}
	}

	public void updateUser() {
		String result = "";
		u = getModel(User.class).set("username", getPara("u.username"))
				.set("usercnname", getPara("u.usercnname"))
				.set("role",getPara("u.role"))
				.set("phone", getPara("u.phone"))
				.set("area", getPara("u.area"))
				.set("syzt", getPara("u.syzt"));
//		System.out.println("updateUser user:"+u);
		try {
			if (u.getStr("createuser") == null || u.getStr("createuser").length() == 0) {
				u.set("createuser",this.getUser().getStr("usercnname"));

				u.set("createtime",new java.sql.Date(System.currentTimeMillis()));
			}
			if (u.getStr("password") == null || u.getStr("password").equals("")) {
				u.set("password",md5Digest("123456"));
			}

			this.userManager.saveOrUpdate(u);

			result = "success";
			renderJson(result);
		} catch (Exception e) {
			e.printStackTrace();
			renderJson(e);
		}
	}

	// 初始化
	public void reUser() {
		try {
			String username = getPara("username");
			u.set("username",username);
			u.set("password",md5Digest("123456"));
			this.userManager.reUser(u);
		} catch (Exception e) {
		}
	}

	public void deleteUser() {
		try {

			String ids = getPara("ids");

			this.userManager.delete(ids);
			renderJson("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void main() {

		try {
			setAttr("roleString", roleManager.getMenuString(this.getUser().getStr("area")));
			setAttr("areaString", areaManager.getAreaString(this.getUser().getStr("area")));
//			renderJson(roleManager.getMenuString(this.getUser().getStr("area")));
//			renderJson(areaManager.getAreaString(this.getUser().getStr("area")));
			setAttr("userarea", this.getUser().getStr("area"));
			render("/user/user.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			render("/Error.jsp");
		}

	}

	public void checkUser() {
		try {
			String username = getPara("username");

			boolean flag = this.userManager.checkUser(username);
			renderJson(flag);
		} catch (Exception e) {
			System.out.println(e.getMessage());

		}

	}

	public void logout() {
		this.getSession().setAttribute("user", null);
	}

	public void updateXgmm() {
		try {
			String oldPass = getPara("oldPass");
			String newPass = getPara("newPass");
			oldPass = md5Digest(oldPass);
			newPass = md5Digest(newPass);
			boolean b = false;
			if (oldPass.equals(this.getUser().getStr("password"))) {
				b = true;
			}
			if (b) {
				this.userManager.updateXgmm(newPass, this.getUser()
						.getStr("username"));
			}

			renderJson(b);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	// 定义数字签名方法, 可用：MD5, SHA-1
	public static String md5Digest(String src) throws Exception {
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] b = md.digest(src.getBytes("utf-8"));
		return byte2HexStr(b);
	}

	private static String byte2HexStr(byte[] b) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < b.length; i++) {
			String s = Integer.toHexString(b[i] & 0xFF);
			if (s.length() == 1) {
				sb.append("0");
			}
			sb.append(s.toUpperCase());
		}
		return sb.toString();
	}
}
