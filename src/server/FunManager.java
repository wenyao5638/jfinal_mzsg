package server;

import java.util.List;

import javax.annotation.Resource;

import model.Function;

import common.Page;

import dao.FunDAO;

public interface FunManager {

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.FunManager#setLoginDAO(dao.AreaDao)
	 */
	@Resource(name = "funDAO")
	public abstract void setLoginDAO(FunDAO dao);

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.FunManager#findByPageWithBean(common.Page, model.Area)
	 */
	public abstract Page findByPageWithBean(Page page, Function search);

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.FunManager#findCourse(model.Function)
	 */
	public abstract Function findFun(Function c);

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.FunManager#saveOrUpdate(model.Function)
	 */
	public abstract void saveOrUpdate(Function c);

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.FunManager#update(model.Function)
	 */
	public abstract void update(Function c);

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.FunManager#delete(model.Function)
	 */
	public abstract void delete(Function c);

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.FunManager#delete(java.lang.String)
	 */
	public abstract void delete(String ids);
	public abstract boolean findFun(String id);

}