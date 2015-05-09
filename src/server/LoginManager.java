package server;


import java.util.List;

import common.Page;

import model.User;
@SuppressWarnings("unchecked")
public interface LoginManager {
	public User findUserbyname(String username) throws Exception;
	
	public List findAllFunction() throws Exception;
	
	public String findRoleFunction(String roleid,String username) throws Exception;
	
	public List findFuctioncontroller(String controller) throws Exception;
	
	public List findFuctionordinary(String controller,String ordinary) throws Exception;
	
	public String findSystime() throws Exception;
	
	public String findTimestamp() throws Exception;
	
	public List getUser(User user) throws Exception;
	
	//获取最后一条版本日期
	public String getLastVersion() throws Exception;
	//获取版本历史记录
	public Page getVersionList(Page page) throws Exception;
	
	
}
