package server.impl;

import java.util.List;

import javax.annotation.Resource;

import dao.LoginDAO;
import model.Function;
import model.Role;
import model.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import server.LoginManager;
import org.springframework.stereotype.Component;  

import common.Page;
@Component("loginManager")  
@SuppressWarnings("unchecked")
public class LoginManagerImpl implements LoginManager {
	
	private LoginDAO dao;
	
	@Resource(name="loginDAO")  
	public void setLoginDAO(LoginDAO dao) {  
		this.dao = dao;  
	} 

	public User findUserbyname(String username) throws Exception{
		return dao.findUserbyname(username);
	}

	public List findAllFunction() throws Exception {
		return dao.findAllFunction();
	}
	
	public String findRoleFunction(String roleid,String username) throws Exception{
		List functionList = dao.findAllFunction();
		String controller = dao.getRoleController(roleid);
		String ordinary = dao.getRoleOrdinary(roleid);
//		String dl = dao.getRoleDl(username);
		String treeString = "";
		String href = "";
		for (int i = 0; i < functionList.size(); i++) {
			Function function = (Function) functionList.get(i);
			if((controller!=null&&controller.contains("\""+function.getStr("id")+"\""))||(ordinary!=null&& ordinary.contains("\""+function.getStr("id")+"\""))){
				if (treeString.length() > 0) {
					treeString += ",";
				}
				treeString += "{id:\"" + function.getStr("id")
						+ "\", pId:\"" + function.getStr("pid")
						+ "\", icons:\""+function.getStr("icon")+"\", name:\"" + function.getStr("icon")+ "\" " ;
				href = function.getStr("href")==null?"":function.getStr("href");
				if(controller.contains("\""+function.getStr("id")+"\"")){
					if(href.contains("?")){
						treeString += ",href:\"" + function.getStr("href") + "&qx=1";
					}else{
						treeString += ",href:\"" + function.getStr("href") + "?qx=1 ";
					}
					
					if(treeString.contains("?")){
						treeString += "&";
					}else{
						treeString += "?";
					}
					treeString +="pid="+function.getStr("id")+"\"";
				}else if(ordinary!=null && ordinary.contains("\""+function.getStr("id")+"\"")){
					if(href.contains("?")){
						treeString += ",href:\"" + function.getStr("href") + "&qx=2 ";
					}else{
						treeString += ",href:\"" + function.getStr("href") + "?qx=2 ";
					}
					if(treeString.contains("?")){
						treeString += "&";
					}else{
						treeString += "?";
					}
					treeString +="pid="+function.getStr("id")+"\"";
				}
				treeString += "}";
			}
		}
		return treeString;
	}

	public List findFuctioncontroller(String controller) throws Exception {
		return dao.findFuctioncontroller(controller);
	}

	public List findFuctionordinary(String controller, String ordinary)
			throws Exception {
		return dao.findFuctionordinary(controller,ordinary);
	}

	public String findSystime() throws Exception {
		return dao.findSystime();
	}

	public String findTimestamp() throws Exception {
		return dao.findTimestamp();
	}
	
	public List getUser(User user) throws Exception{
		return dao.getUser(user);
	}
	public String getLastVersion() throws Exception{
		return dao.getLastVersion();
	}
	public Page getVersionList(Page page) throws Exception{
		return dao.getVersionList(page);
	}
	
}
