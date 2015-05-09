package server.impl;

import java.util.List;

import javax.annotation.Resource;

import model.Function;
import model.Role;

import org.springframework.stereotype.Component;

import server.FunManager;
import common.Page;
import dao.FunDAO;
import dao.LoginDAO;
import dao.RoleDAO;

@Component("funManager")
public class FunManagerImp extends BaseManagerImp implements FunManager  {


	private FunDAO dao;
	@Resource
	private RoleDAO roleDAO;

	/* (non-Javadoc)
	 * @see server.impl.FunManager#setLoginDAO(dao.FunDAO)
	 */
	@Resource(name = "funDAO")
	public void setLoginDAO(FunDAO dao) {
		this.dao = dao;
	}
	
	public Page findByPageWithBean(Page page, Function search) {

		return dao.findByPageWithBean(page, search);

	}

	
	/* (non-Javadoc)
	 * @see server.impl.FunManager#findFun(model.Function)
	 */
	public Function findFun(Function c) {
		return dao.findFun(c);
	}

	
	/* (non-Javadoc)
	 * @see server.impl.FunManager#saveOrUpdate(model.Function)
	 */
	public void saveOrUpdate(Function c) {
		dao.saveOrUpdate(c);
	}


	/* (non-Javadoc)
	 * @see server.impl.FunManager#update(model.Function)
	 */
	public void update(Function c) {
		dao.merge(c);
	}

	/* (non-Javadoc)
	 * @see server.impl.FunManager#delete(model.Function)
	 */
	public void delete(Function c) {
		dao.delete(c);
	}

	/* (non-Javadoc)
	 * @see server.impl.FunManager#delete(java.lang.String)
	 */
	public void delete(String ids) {
		dao.delete(ids);
	}

	public boolean findFun(String id) {
		// TODO Auto-generated method stub
		return dao.findFun(id);
	}


}
