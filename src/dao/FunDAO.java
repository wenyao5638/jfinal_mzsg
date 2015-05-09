package dao;
import java.util.List;

import model.Function;
import common.Page;
public interface FunDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.impl.FunDAO#findByPageWithBean(common.Page, model.Area)
	 */
	public abstract Page findByPageWithBean(Page page, Function search);

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.impl.FunDAO#delete(java.lang.String)
	 */
	public abstract void delete(String ids);

	public abstract void saveOrUpdate(Function c);

	public abstract void merge(Function c);

	public abstract void delete(Function c);
	public abstract Function findFun(Function c);
	public abstract boolean findFun(String id);
}