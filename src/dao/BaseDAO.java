package dao;

import common.Page;
/**
 * 
 * @author wangliang
 *
 */
public interface BaseDAO <T> {
	/**
	 * 分页查询
	 * @param hql
	 * @param page
	 * @param values
	 * @return
	 */
	public Page findByPage(String selectSql,String fromSql,Page page,Object[] values) ;
	
	/**
	 * sql分页查询
	 * @param hql
	 * @param page
	 * @param values
	 * @return
	 */
//	public Page findByPageWithSql(String sql,Page page,Object[] values) ;
	/**
	 * 根据主键查找对象
	 * @param id
	 * @return
	 */
	/*public T findObject(String id);
	*//**

	 * 根据主键查找对象
	 * @param id
	 * @return
	 *//*
	public T findObject(Integer id);
	*//**

	 * 新增
	 * @param obj
	 *//*
	public void saveObject(T obj);
	*//**

	 * 新增修改
	 * @param obj
	 *//*
	public void saveOrUpdateObject(T obj) ;
	*//**
	 * 修改
	 * @param c
	 *//*
	public void mergeObject(T obj) ;
	*//**
	 * 根据主键删除
	 * @param c
	 *//*
	public void delObject(String id) ;
	*//**
	 * 根据主键删除
	 * @param c
	 *//*
	public void delObject(Integer id) ;
	*//**
	 * 根据CLASS，ID查找对象
	 * @param clazz
	 * @param id
	 * @return
	 *//*
	public T findObjectByClass(Class clazz,String id);
	*//**
	 * 根据条件查询
	 * @param hql
	 * @return
	 *//*
	public List<T> findList(String hql);
	*//**
	 * 根据条件查询
	 * @param hql
	 * @param values
	 * @return
	 *//*
	public List<T> findByPage(String hql,Object[] values) ;*/
}
