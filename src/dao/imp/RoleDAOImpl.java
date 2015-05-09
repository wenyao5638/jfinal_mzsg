package dao.imp;

import java.io.BufferedReader;
import java.io.Reader;
import java.io.Serializable;
import java.sql.Clob;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.jfinal.plugin.activerecord.Db;

import dao.RoleDAO;
import model.Function;
import model.Role;
import model.Sgry;
import model.User;

@Component("roleDAO")
@SuppressWarnings("unchecked")
public class RoleDAOImpl extends BaseDAOImp<Role> implements RoleDAO {

	
	public Role findRole(String roleid) throws Exception {
		Role role = Role.dao.findById(roleid); 
		return role;
	
	}
	public List findRoles(String area){
		String hql="select roleid,rolename from xtsz_role where area='"+area+"' order by roleid";
		return Role.dao.find(hql);
	}
	
	
	public List getAllRoleList() throws Exception{
		String hql = "select * from xtsz_role where 1=1 ";
		return Role.dao.find(hql);
	}
	public List getMenuString(String areacode) throws Exception{
		String sql = "";
//		if(roleid.equals("-1")){
//			sql = " select roleid,rolename,superior,level from xtsz_role  order by level ";
//		}else{
//			sql = " select roleid,rolename,superior,level from xtsz_role where level>=(select level from xtsz_role where roleid='"+roleid+"') order by level";
//		}
		sql = " with t_area(CODE, NAME, SUPERIOR, LEVEL) as(" +
		" select CODE, NAME, SUPERIOR, LEVEL from area where code = '"+areacode+"'" +
		" union all select area.CODE, area.NAME, area.SUPERIOR, area.LEVEL from t_area, area" +
		" where area.SUPERIOR = t_area.code)" +
		" select roleid,rolename,'a'+area from t_area,XTSZ_ROLE where code = area" +
		" union select 'a'+code,name,'a'+SUPERIOR from t_area where exists (select area from XTSZ_ROLE where code = area )";
//		sql = "select roleid,rolename,'a'+area from xtsz_role where area like '"+areacode+"%' "
//				+ " union all select 'a'+code,name,'a'+SUPERIOR from area where exists "
//				+ "(select area from XTSZ_ROLE where code = area and area like '"+areacode+"%' ) ";
		return User.dao.find(sql);
	}
	public void saveRole(Role role) throws Exception{
		String sql = "insert into xtsz_role(roleid,controller,rolename,area,level) values " +
			"(cast((select isnull(MAX(cast(roleid as int))+1,1) from xtsz_role) as varchar(10)),'','"+role.getStr("rolename")+"'," +
			"'"+role.getStr("area")+"','"+role.getStr("level")+"')";
		Db.update(sql);
	}
	public List getTreeString() throws Exception{
		String sql = "SELECT pid, id, cnname" +
				" FROM XTSZ_FUNCTION ORDER BY pid,id";
		return Function.dao.find(sql);
	}
	public List getAdTreeString() throws Exception{
		//id�?997的是权限设置，这个只能被roleid�?1的用户查看，不能被分�?
		String sql = "SELECT pid, id, cnname" +
		" FROM XTSZ_FUNCTION ORDER BY pid,id";
		return Function.dao.find(sql);
	}
	public List getNorTreeString() throws Exception{
		//id�?997的是权限设置，这个只能被roleid�?1的用户查看，不能被分�?
		String sql = "SELECT pid, id, cnname" +
		" FROM XTSZ_FUNCTION  ORDER BY pid,id";
		return Function.dao.find(sql);
	}
	public List getroleTreeString(String roleid) throws Exception{
		String sql = "SELECT a.pid, a.id, a.cnname FROM XTSZ_FUNCTION a" +
		" left join XTSZ_RMATCHF b on b.roleid=? and a.id = b.id" +
		" ORDER BY pid,a.id";
		List list = new ArrayList();
		list.add(roleid);
		return Function.dao.find(sql, list.toArray());
	}
	public String getRoleController(String roleid) throws Exception{
		String sql = "SELECT CONTROLLER FROM XTSZ_ROLE where ROLEID="+roleid+"";
		List list = Role.dao.find(sql);
		String controller = "";
		if (list.size() > 0) {
			/*Clob clob = (Clob) list.get(0);
			Reader is = clob.getCharacterStream();// 得到�?
			BufferedReader br = new BufferedReader(is); 
			String s = br.readLine(); 
			StringBuffer sb = new StringBuffer(); 
			while (s != null) {// 执行循环将字符串全部取出付�?�?StringBuffer由StringBuffer转成STRING 
				sb.append(s); 
				s = br.readLine(); 
			} 
			controller = sb.toString(); */
			controller=list.get(0).toString();
		}
		return controller;
	}
	
	public String getRoleOrdinary(String roleid) throws Exception{
		String sql = "SELECT ORDINARY FROM XTSZ_ROLE where ROLEID="+roleid+"";
		List list = Role.dao.find(sql);
		String ordinary = "";
		if (list.size() > 0) {
			Clob clob = (Clob) list.get(0);
			Reader is = clob.getCharacterStream();// 得到�?
			BufferedReader br = new BufferedReader(is); 
			String s = br.readLine(); 
			StringBuffer sb = new StringBuffer(); 
			while (s != null) {// 执行循环将字符串全部取出付�?�?StringBuffer由StringBuffer转成STRING 
				sb.append(s); 
				s = br.readLine(); 
			} 
			ordinary = sb.toString(); 
		}
		return ordinary;
	}
	public void updateRoleList(Role role) throws Exception{
		String sql = "update xtsz_role set controller='"+role.get("controller")+"'  where roleid="+role.getStr("roleid")+" ";
		Db.update(sql);
	}
	public List findController(String roleid){
		String sql="select controller,roleid from xtsz_Role where roleid='"+roleid+"'";
		String roleids="";
		List l=Role.dao.find(sql);
	  
	    return l;
	}
	public void deleteRole(String roleid) throws Exception{
		String sql = "delete from xtsz_role where roleid='"+roleid+"' ";
		Db.update(sql);
	}
	public String findJlxx(){
		String sql="select jlxx from IMS_SGRYLYXX where id='330227196904056686'";
		List list=Sgry.dao.find(sql);
		String jlxx="";
		if(list.size()>0){
			jlxx=list.get(0).toString();
		}
		return jlxx;
		
	}

}
