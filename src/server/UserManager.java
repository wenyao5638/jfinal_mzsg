package server;

import javax.annotation.Resource;

import model.User;

import common.Page;

import dao.UserDAO;

public interface UserManager {

	/* (non-Javadoc)
	 * @see server.impl.UserManager#setLoginDAO(dao.AreaDao)
	 */
	@Resource(name = "userDAO")
	public abstract void setLoginDAO(UserDAO dao);

	/* (non-Javadoc)
	 * @see server.impl.UserManager#findByPageWithBean(common.Page, model.Area)
	 */
	public abstract Page findByPageWithBean(Page page, User search);

	/* (non-Javadoc)
	 * @see server.impl.UserManager#findCourse(model.Area)
	 */
	public abstract User findUser(User c);

	/* (non-Javadoc)
	 * @see server.impl.UserManager#saveOrUpdate(model.User)
	 */
	public abstract void saveOrUpdate(User c);

	/* (non-Javadoc)
	 * @see server.impl.UserManager#update(model.User)
	 */
	public abstract void update(User c);

	public abstract void delete(User c);
	
	//初始化用户
	public abstract void reUser(User u);
	public abstract void delete(String ids);
	
	public abstract boolean checkUser(String username);
	public abstract void updateLastLoginTime(String username,String nows);
	public abstract void updateXgmm(String password,String username);
	//查询短信发送对象用户(排除已存在于短信发送对象表中的用户)
	public abstract Page findByPageWithBean_dx(Page page, User search, String jsdx);

}