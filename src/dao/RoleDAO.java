package dao;
import java.util.List;

import model.Role;
@SuppressWarnings("unchecked")
public interface RoleDAO {
	public Role findRole(String roleid) throws Exception;
	public List findRoles(String area);

	public List getAllRoleList() throws Exception;	
	public List getMenuString(String areacode) throws Exception;
	public void saveRole(Role role) throws Exception;
	public List getAdTreeString() throws Exception;
	public List getNorTreeString() throws Exception;
	public List getroleTreeString(String roleid) throws Exception;
	public String getRoleController(String roleid) throws Exception;
	public String getRoleOrdinary(String roleid) throws Exception;
	public void updateRoleList(Role role) throws Exception;

	public List findController(String roleid);

	public void deleteRole(String roleid) throws Exception;
	public String findJlxx();
}
