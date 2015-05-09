package server;


import java.util.List;

import model.Role;
@SuppressWarnings("unchecked")
public interface RoleManager {
	public Role findRole(String roleid) throws Exception;
	public List findRoles(String area);
	
	public String getAllRoleList() throws Exception;
	public String getMenuString(String areacode) throws Exception;
	public void saveRole(Role role) throws Exception;
	public String getAdTreeString() throws Exception;	
	public String getNorTreeString() throws Exception;	
	public String getroleTreeString(String roleid) throws Exception;	
	public String getAdTreeStringbyRole(String roleid) throws Exception;	
	public List getRole(String roleid)throws Exception;
	public String getNorTreeStringbyRole(String roleid) throws Exception;
	public void updateRoleList(Role role) throws Exception;
	public void deleteRole(String roleid) throws Exception;
	public String findJlxx() throws Exception;
	
}
