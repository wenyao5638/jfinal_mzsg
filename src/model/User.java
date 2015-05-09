package model;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import common.Page;
import dao.UserDAO;

public class User extends Model<User>{
	
	public static final User dao = new User();
	 
	public User getUser(String username) {
		return User.dao.findById(username);
	}


	public void reUser(User u) {
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

	public void delete(User c) {
	}

	public void saveOrUpdate(User c) {
		User user = this.findUser(c);
		if(user != null){
			user.update();
		}else
			c.save();
			
	}

	public void merge(User c) {
		c.update();
	}

	public User findUser(User c) {
		return User.dao.findById(c.getStr("username"));
	}

	public boolean checkUser(String username) {
		String hql = "select username from xtsz_usertable where username=?";
		boolean flag = false;
		List list = new ArrayList();
		list.add(username);
		List l = User.dao.find(hql, list.toArray());
		if (l.size() > 0) {
			flag = true;
		}
		return flag;
	}

	public void updateLastLoginTime(String username, String nows) {
		String sql="update xtsz_usertable set lastlogintime='"+nows+"' where username=?";
		List list=new ArrayList();
		list.add(username);
		Db.update(sql, list.toArray());
	}

	public void updateXgmm(String password, String username) {
		String sql="update xtsz_usertable set userpassword=? where username=?";
		List list=new ArrayList();
		list.add(password);
		list.add(username);
		Db.update(sql, list.toArray());
	}

	public Page findByPageWithBean_dx(Page page, User search, String jsdx) {
		// TODO Auto-generated method stub
		return null;
	}
}
