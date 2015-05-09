package dao.imp;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.jfinal.plugin.activerecord.Db;

import model.User;
import common.Page;
import dao.UserDAO;

@Component("userDAO")
public class UserDAOImp extends BaseDAOImp<User> implements UserDAO {

	public Page findByPageWithBean(Page page, User search) {
		String sql = "from XTSZ_USERTABLE t where 1=1 and t.role <> '-1'";
		List list = new ArrayList();
		if (search != null) {
			if (search.getStr("syzt") != null && search.getStr("syzt").trim().length() > 0) {
				sql += " and syzt = ? ";
				list.add(search.getStr("syzt"));
			}
			if (search.getStr("username") != null && search.getStr("username").trim().length() > 0) {
				sql += " and username like ? ";
				list.add("%" + search.getStr("username")+ "%");
			}
			if (search.getStr("usercnname") != null && search.getStr("usercnname").trim().length() > 0) {
				sql += " and usercnname like ? ";
				list.add("%" + search.getStr("usercnname") + "%");
			}
			if (search.getStr("area") != null && !search.getStr("area").trim().equals("-1") && search.getStr("area").trim().length() > 0) {
				sql += " and area like ? ";
				list.add(search.getStr("area") + "%");
			}
			if (search.getStr("role") != null && search.getStr("role").trim().length() > 0) {
				sql += " and role= ? ";
				list.add(search.getStr("role"));
			}

		}
		 System.out.println("数据:" + sql);
		page.setTotalElement(this.findTotalCount("select count(1) "+sql,list.toArray()));
		String selectSql = "select t.username,t.usercnname,t.area,(select a.name from area a where a.code=t.area) as name, "
				+ "(select rolename from xtsz_role r where r.roleid=t.role) as rolename, "
				+ "t.role,t.createuser,t.createtime , "
				+ "t.lastlogintime, t.bmmc,t.syzt,t.phone ";
//		List<Object> pageList = Db.query(sql+ " order by t.area asc", list.toArray());
		return this.findByPage(selectSql,sql, page, list.toArray());

	}

	public void reUser(User u){
		String sql = "update xtsz_usertable set userpassword='"+u.getStr("password")+"'" +
			" where username='"+u.getStr("username")+"' ";
		Db.update(sql);
	}
	
	public void delete(String ids) {
		String hql = "update xtsz_usertable set syzt='0' where 1=1 and (";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			if (i == 0) {
				hql += " username='" + id[i] + "'";
			} else {
				hql += " or username='" + id[i] + "'";
			}
		}
		if (id.length == 0) {
			hql += " 1<>1";
		}
		hql += " )";
		Db.update(hql);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.impl.UserDAO#findUser(model.User)
	 */
	public User findUser(User c) {

		return User.dao.findById(c.getStr("username"));
	}

	public boolean checkUser(String username) {
		String hql = "select username from xtsz_usertable where username=?";
		boolean flag = false;
		List list = new ArrayList();
		list.add(username);
		List l = User.dao.find(hql,list.toArray());
		if (l.size() > 0) {
			flag = true;
		}
		return flag;
	}
	public void updateLastLoginTime(String username,String nows){
		String sql="update xtsz_usertable set lastlogintime='"+nows+"' where username=?";
		List list=new ArrayList();
		list.add(username);
//		this.updateSql(sql, list.toArray());
		Db.update(sql, list.toArray());
		
	}
	public void updateXgmm(String password,String username){
		String sql="update xtsz_usertable set userpassword=? where username=?";
		List list=new ArrayList();
		list.add(password);
		list.add(username);
		Db.update(sql, list.toArray());
		
	}

	@Override
	public Page findByPageWithBean_dx(Page page, User search, String jsdx) {
		// TODO Auto-generated method stub
		return null;
	}


}
