package model;

import java.io.BufferedReader;
import java.io.Reader;
import java.io.Serializable;
import java.sql.Clob;
import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

import dao.RoleDAO;
public class Role extends Model<Role> implements RoleDAO{
	
	/*private static final long serialVersionUID = 1L;
	private String roleid;
	private String controller;//绠＄悊鍛樻潈闄�
	private String ordinary;//鏅�鐢ㄦ埛鏉冮檺
	private String rolename;//瑙掕壊鍚嶇О
	
	private String level;//瑙掕壊绾у埆
	private String area;
	private String createuser;*/
	public static final Role dao = new Role();
	
	@Override
	public Role findRole(String roleid) throws Exception {
		return Role.dao.findById(roleid);
	}

	@Override
	public List findRoles(String area) {
		return Role.dao.find("select roleid,rolename from Role where area=? order by roleid", area);
	}

	@Override
	public List getAllRoleList() throws Exception {
		String sql = "select * from role where 1=1 ";
		return Role.dao.find(sql);
	}

	@Override
	public List getMenuString(String areacode) throws Exception {
		
		String sql = " with t_area(CODE, NAME, SUPERIOR, LEVEL) as(" +
				" select CODE, NAME, SUPERIOR, LEVEL from area where code = '"+areacode+"'" +
				" union all select area.CODE, area.NAME, area.SUPERIOR, area.LEVEL from t_area, area" +
				" where area.SUPERIOR = t_area.code)" +
				" select roleid,rolename,'a'+area from t_area,XTSZ_ROLE where code = area" +
				" union select 'a'+code,name,'a'+SUPERIOR from t_area where exists (select area from XTSZ_ROLE where code = area )";
		return Db.find(sql);
	}

	@Override
	public void saveRole(Role role) throws Exception {
		String sql = "insert into xtsz_role(roleid,controller,rolename,area,level) values " +
				"(cast((select isnull(MAX(cast(roleid as int))+1,1) from xtsz_role) as varchar(10)),'','"+role.getStr("rolename")+"'," +
				"'"+role.getStr("area")+"','"+role.getStr("level")+"')";
//			Role.dao.update()(sql);
//			Db.save("role", "roleid", role);
		Db.update(sql);
	}

	@Override
	public List getAdTreeString() throws Exception {
		String sql = "SELECT pid, id, cnname" +
				" FROM XTSZ_FUNCTION ORDER BY pid,id";
				return Role.dao.find(sql);
	}

	@Override
	public List getNorTreeString() throws Exception {
		String sql = "SELECT pid, id, cnname" +
				" FROM XTSZ_FUNCTION  ORDER BY pid,id";
				return Role.dao.find(sql);
	}

	@Override
	public List getroleTreeString(String roleid) throws Exception {
		String sql = "SELECT a.pid, a.id, a.cnname FROM XTSZ_FUNCTION a" +
				" left join XTSZ_RMATCHF b on b.roleid=? and a.id = b.id" +
				" ORDER BY pid,a.id";
				List list = new ArrayList();
				list.add(roleid);
				return Function.dao.find(sql);
	}

	@Override
	public String getRoleController(String roleid) throws Exception {
		
		String sql = "SELECT CONTROLLER FROM XTSZ_ROLE where ROLEID="+roleid+"";
		List list = dao.find(sql);
		String controller = "";
		if (list.size() > 0) {
			/*Clob clob = (Clob) list.get(0);
			Reader is = clob.getCharacterStream();// 得到流 
			BufferedReader br = new BufferedReader(is); 
			String s = br.readLine(); 
			StringBuffer sb = new StringBuffer(); 
			while (s != null) {// 执行循环将字符串全部取出付值给 StringBuffer由StringBuffer转成STRING 
				sb.append(s); 
				s = br.readLine(); 
			} 
			controller = sb.toString(); */
			controller=list.get(0).toString();
		}
		return controller;
	}

	@Override
	public String getRoleOrdinary(String roleid) throws Exception {
		
		String sql = "SELECT ORDINARY FROM XTSZ_ROLE where ROLEID="+roleid+"";
		List list = this.dao.find(sql);
		String ordinary = "";
		if (list.size() > 0) {
			Clob clob = (Clob) list.get(0);
			Reader is = clob.getCharacterStream();// 得到流 
			BufferedReader br = new BufferedReader(is); 
			String s = br.readLine(); 
			StringBuffer sb = new StringBuffer(); 
			while (s != null) {// 执行循环将字符串全部取出付值给 StringBuffer由StringBuffer转成STRING 
				sb.append(s); 
				s = br.readLine(); 
			} 
			ordinary = sb.toString(); 
		}
		return ordinary;
	}

	@Override
	public void updateRoleList(Role role) throws Exception {
		
		String sql = "update xtsz_role set controller='"+role.getStr("controller")+"'  where roleid="+role.getStr("roleid")+" ";
		Db.update(sql);
		
	}

	@Override
	public List findController(String roleid) {
		String sql="select controller,roleid from xtsz_Role where roleid='"+roleid+"'";
		String roleids="";
		return this.dao.find(sql);
	}

	@Override
	public void deleteRole(String roleid) throws Exception {
		String sql = "delete from xtsz_role where roleid='"+roleid+"' ";
		Db.update(sql);
	}

	@Override
	public String findJlxx() {
		String sql="select jlxx from IMS_SGRYLYXX where id='330227196904056686'";
		List list=this.dao.find(sql);
		String jlxx="";
		if(list.size()>0){
			jlxx=list.get(0).toString();
		}
		return jlxx;
	}
	

}
