package dao;

import java.util.List;

import common.Page;

import model.Role;
import model.User;
@SuppressWarnings("unchecked")
public interface LoginDAO {
	public User findUserbyname(String username);

	public List findAllFunction() throws Exception;
	
	public List findRoleFunction(String roleid) throws Exception;
	public String getRoleController(String roleid) throws Exception;
	public String getRoleOrdinary(String roleid) throws Exception;
	
	public List findFuctioncontroller(String controller) throws Exception;
	
	public List findFuctionordinary(String controller,String ordinary) throws Exception;

	public String findSystime() throws Exception;
	
	public String findTimestamp() throws Exception;
	
	public List getUser(User user) throws Exception;
	
	public String getLastVersion() throws Exception;
	public Page getVersionList(Page page) throws Exception;
	
}
