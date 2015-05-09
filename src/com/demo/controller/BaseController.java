package com.demo.controller;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import model.Area;
import model.User;
import server.AreaManager;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.spring.Inject;

import common.Aestest;

public class BaseController extends Controller{
	
	public static final String SUCCESS = "success";
	public static final String NONE = "none";
	public static final String ERROR = "error";
	public static final String INPUT = "input";
	public static final String LOGIN = "login";
	
	private Class<?> entity;
	@Inject.BY_NAME
	private AreaManager areaManager;
	User user;
	
	public Class<?> getEntity() {
		return entity;
	}

	public void setEntity(Class<?> entity) {
		this.entity = entity;
	}
	
	public void save() throws Exception{
		
		renderText(getModel( ((Model<?>) Class.forName(entity.getName()).newInstance())
	            .getClass()).save()+"");
	}
	
	public void getById(){
		renderJson(Db.find("select * from " + getEntity().getSimpleName()
		        + " where id = " + getParaToInt("id") + ";"));
	}
	

	public Area getArea(String area) {
		Area a=areaManager.findArea(area);
		if(a!=null && "04".compareTo(a.getStr("level"))<0){
			return getArea(a.getStr("superior"));
		}else if(a!=null && "04".compareTo(a.getStr("level"))==0){
			return a;
		}else {
			return a;
		}
		
	}

	/**
	 * 吴鹏鹰20130717
	 */
	public String pre() {
		return SUCCESS;
	}

	public HttpSession getSession() {
		return getSession(true);
	}

	User getUser() {
		String param = getPara("param");
		User user = new User();
//		user = (User) getSession().getAttribute("user");
//		if(user==null){
//			if(param!=null&&param.length()>20){
//				String url = Aestest.decrypt(param);
//				user = URLRequest(url);
//				getSession().setAttribute("user", user);
//			}
//		}
		if(param!=null&&param.length()>20){
			String url = Aestest.decrypt(param);
			user = URLRequest(url);
			getSession().setAttribute("user", user);
		}else{
			user = (User) getSessionAttr("user");
		}
		return user;
	}

	public void SystemLog(Exception e) {
		e.printStackTrace();
	}
	//execute()
	public void index(){
		
	}
	public List<Map> getAreas(String acode){
		Area area = new Area();

		area.set("code", acode);
		area = this.areaManager.findArea(area);
		List<Map> info = new ArrayList();
		int level = Integer.parseInt(area.getStr("level") == null ? "0" : area
				.getStr("level"));
		Map map = new HashMap<String, Object>();
		map.put("code", area.getStr("code"));
		map.put("name", area.getStr("name"));
		map.put("level", level);
		String farther=area.getStr("superior");
		info.add(map);
		if (level > 3) {
			for (int i = level - 1; i >=3; i--) {
				String t=String.valueOf(i);
				if(t.length()==1){
					t="0"+t;
				}
				Map jbmap = this.areaManager.findFarther(farther, t);
				if (jbmap != null) {
					info.add(jbmap);
					
				}
			}
		}
		return info;
	}
	
	public String qx;
	public String getQx() {
		return qx;
	}
	public void setQx(String qx) {
		this.qx = qx;
	}
	
	public static User URLRequest(String URL)
    {
		User user = new User();
		String[] arrSplit=null;
		String strUrlParam=URL;
		if(strUrlParam==null){
			return user;
		}
	    //每个键值为一组
	    arrSplit=strUrlParam.split("[&]");
	    for(String strSplit:arrSplit){
		    String[] arrSplitEqual=null;
		    arrSplitEqual= strSplit.split("[=]");
		    //解析出键值
		    if(arrSplitEqual.length>1){
		    	//正确解析
		    	if("username".equals(arrSplitEqual[0])){
		    		user.set("username",arrSplitEqual[1]);
		    	}else if("usercnname".equals(arrSplitEqual[0])){
		    		user.set("usercnname",arrSplitEqual[1]);
		    	}else if("area".equals(arrSplitEqual[0])){
		    		user.set("area",arrSplitEqual[1]);
		    	}else if("role".equals(arrSplitEqual[0])){
		    		user.set("role",arrSplitEqual[1]);
		    	}else if("syzt".equals(arrSplitEqual[0])){
		    		user.set("syzt",arrSplitEqual[1]);
		    	}else if("phone".equals(arrSplitEqual[0])){
		    		user.set("phone",arrSplitEqual[1]);
		    	}else if("lxdh".equals(arrSplitEqual[0])){
		    		user.set("lxdh",arrSplitEqual[1]);
		    	}
		    }
	    }
	    return user;
    }
	//定义数字签名方法, 可用：MD5, SHA-1
		public static String md5Digest(String src) throws Exception {
			 MessageDigest md = MessageDigest.getInstance("MD5");
			 byte[] b = md.digest(src.getBytes("utf-8"));
			 return byte2HexStr(b);
		}
		
		private static String byte2HexStr(byte[] b){
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

		public String pid;
		public String getPid() {
			return pid;
		}
		public void setPid(String pid) {
			this.pid = pid;
		}
	
}
