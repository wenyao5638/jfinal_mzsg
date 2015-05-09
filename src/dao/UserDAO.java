package dao;

import model.User;

import common.Page;

public interface UserDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.impl.UserDAO#findByPageWithBean(common.Page, model.Area)
	 */
	public abstract Page findByPageWithBean(Page page, User search);

	public abstract void reUser(User u);
//	public abstract void delete(String ids);
//	public abstract void delete(User c);

//	public abstract void saveOrUpdate(User c);

//	public abstract void merge(User c);

//	public abstract User findUser(User c);
	public abstract boolean checkUser(String username);
	public abstract void updateLastLoginTime(String username,String nows);
	public void updateXgmm(String password,String username);
	public abstract Page findByPageWithBean_dx(Page page, User search, String jsdx);

}