package dao.imp;

import java.util.List;

import org.springframework.stereotype.Component;

import com.jfinal.plugin.activerecord.Db;

import common.Page;
import dao.LoginDAO;
import model.Function;
import model.Role;
import model.User;

@Component("loginDAO")
@SuppressWarnings("unchecked")
public class LoginDAOImpl extends BaseDAOImp<User> implements LoginDAO {

	public User findUserbyname(String username) {

		User user = User.dao.findById(username);
		return user;
		// String hql = "from User u where u.username = ?";
		// User user = (User)session.createQuery(hql);
		// 存过调用方法
		// SQLQuery query = session.createSQLQuery("{Call proc(?)}");
		// query.setString(1, username);
		// query.executeUpdate();
		// TODO Auto-generated method stub
		
	}

	public List findAllFunction() throws Exception {

		// String hql =
		// "select Function.id,Function.cnname,Function.href,Function.pid from Function order by Function.xh,Function.id ";
		String hql = "select * from xtsz_function order by id,xh ";

		return Function.dao.find(hql);
	}
	
	public List findRoleFunction(String roleid) throws Exception{
		String sql = "";
		return Role.dao.find(sql);
	}
	
	public String getRoleController(String roleid) throws Exception{
		String sql = "SELECT CONTROLLER FROM XTSZ_ROLE where ROLEID='"+roleid+"'";
		List list = Role.dao.find(sql);
		String controller = "";
		/*if (list.size() > 0) {
			Clob clob = (Clob) list.get(0);
			Reader is = clob.getCharacterStream();// 得到�?
			BufferedReader br = new BufferedReader(is); 
			String s = br.readLine(); 
			StringBuffer sb = new StringBuffer(); 
			while (s != null) {// 执行循环将字符串全部取出付�?�?StringBuffer由StringBuffer转成STRING 
				sb.append(s); 
				s = br.readLine(); 
			} 
			controller = sb.toString(); 
		}*/
		if(list.size()>0){
			controller=(String)list.get(0);
		}
		return controller;
	}
	
	public String getRoleOrdinary(String roleid) throws Exception{
		String sql = "SELECT ORDINARY FROM XTSZ_ROLE where ROLEID='"+roleid+"'";
		List list = Role.dao.find(sql);
		String ordinary = "";
		/*if (list.size() > 0) {
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
		}*/
		if(list.size()>0){
			ordinary=(String)list.get(0);
		}
		return ordinary;
	}
	
	public List findFuctioncontroller(String controller) throws Exception {
		String hql = "select * from xtsz_function where id in (" + controller
				+ ") order by xh,id ";
		hql=hql.replaceAll("\"", "'");
		return Function.dao.find(hql);
	}


	public List findFuctionordinary(String controller, String ordinary)
			throws Exception {
		String hql = "select * from xtsz_function where id in (" + ordinary
				+ ") and id not in (" + controller + ") order by xh,id ";
		hql=hql.replaceAll("\"", "'");
		return Function.dao.find(hql);
	}

	public String findSystime() throws Exception {

		String sql = "select convert(varchar(10),getdate(),120) as nowdate ";

		return Db.queryStr(sql);
	}

	public String findTimestamp() throws Exception {

		String sql = "select convert(varchar(19),getdate(),120) as nowdate ";

		return Db.queryStr(sql);
	}

	public List getUser(User user) throws Exception {
		String hql = "select * from xtsz_usertable order by role,username";
		return User.dao.find(hql);
	}

	public Role findRole(String roleid) throws Exception {
		return null;
	}

	@Override
	public String getLastVersion() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page getVersionList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	/*public String getLastVersion() throws Exception{
		String sql = "select substr(max(VER),1,10) from XTSZ_VERSION ";
		List list = this.findWithSQL(sql);
		String str = "";
		if(list.size()>0){
			if (list.get(0) != null) {
				str = list.get(0).toString();
			}
		}
		return str;
	}
	
	public Page getVersionList(Page page) throws Exception{
		String sql = "  FROM XTSZ_VERSION";
		page.setTotalElement(this.findSQlTotalCount("select count(1) " + sql));
		sql = "SELECT ID,substr(VER,1,10),XGNR,BZ "+sql;
		return this.findByPageWithSQL(page, sql + " ORDER BY VER DESC ");
	}*/
	
}
