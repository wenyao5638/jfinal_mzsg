package server.impl;
import javax.annotation.Resource;

import model.User;

import org.springframework.stereotype.Component;

import server.UserManager;
import common.Page;
import dao.UserDAO;
@Component("userManager")
public class UserManagerImp implements UserManager  {
	private UserDAO dao;

	/* (non-Javadoc)
	 * @see server.impl.AreaManager#setLoginDAO(dao.AreaDao)
	 */
	/* (non-Javadoc)
	 * @see server.impl.UserManager#setLoginDAO(dao.UserDAO)
	 */
	@Resource(name = "userDAO")
	public void setLoginDAO(UserDAO dao) {
		this.dao = dao;
	}

	/* (non-Javadoc)
	 * @see server.impl.AreaManager#findByPageWithBean(common.Page, model.Area)
	 */
	/* (non-Javadoc)
	 * @see server.impl.UserManager#findByPageWithBean(common.Page, model.User)
	 */
	public Page findByPageWithBean(Page page, User search) {

		return dao.findByPageWithBean(page, search);

	}

	/* (non-Javadoc)
	 * @see server.impl.AreaManager#findCourse(model.Area)
	 */
	/* (non-Javadoc)
	 * @see server.impl.UserManager#findArea(model.User)
	 */
	public User findUser(User c) {
		return User.dao.findUser(c);
	}

	/* (non-Javadoc)
	 * @see server.impl.UserManager#saveOrUpdate(model.User)
	 */
	/* (non-Javadoc)
	 * @see server.impl.UserManager#saveOrUpdate(model.User)
	 */
	public void saveOrUpdate(User c) {
		User.dao.saveOrUpdate(c);
	}

	/* (non-Javadoc)
	 * @see server.impl.UserManager#update(model.User)
	 */
	/* (non-Javadoc)
	 * @see server.impl.UserManager#update(model.User)
	 */
	public void update(User c) {
		User.dao.merge(c);
	}

	public void reUser(User u){
		User.dao.reUser(u);
	}
	
	public void delete(User c) {
		User.dao.delete(c);
	}

	public void delete(String ids) {
		User.dao.delete(ids);
	}

	@Override
	public boolean checkUser(String username) {
		return User.dao.checkUser(username);
	}

	@Override
	public void updateLastLoginTime(String username, String nows) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateXgmm(String password, String username) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Page findByPageWithBean_dx(Page page, User search, String jsdx) {
		// TODO Auto-generated method stub
		return null;
	}



}
