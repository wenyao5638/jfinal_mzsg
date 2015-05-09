package server;

import java.util.List;

import common.Page;
/**
 * 
 * @author wangliang
 *
 */
public interface BaseManager{
	/**
	 * 分页查询
	 * @param hql
	 * @param page
	 * @param values
	 * @return
	 */
	public Page findByPage(String hql,Page page,Object[] values) ;
	
	/**
	 * 分页查询
	 * @param hql
	 * @param page
	 * @param values
	 * @return
	 */
	public Page findByPage(String hql,String select, Page page, Object[] values) ;
	/**
	 * sql分页查询
	 * @param sql
	 * @param page
	 * @param values
	 * @return
	 */
	public Page findByPageWithSql(String sql,Page page,Object[] values);
	/**
	 * 根据主键查找对象
	 * @param id
	 * @return
	 */
	public Object findObject(String id);
	
	/**
	 * 新增
	 * @param obj
	 */
	public void saveObject(Object obj);
	/**
	 * 根据主键查找对象
	 * @param id
	 * @return
	 */
	public Object findObject(Integer id);
	/**
	 * 新增修改
	 * @param obj
	 */
	public void saveOrUpdateObject(Object obj) ;
	/**
	 * 修改
	 * @param c
	 */
	public void mergeObject(Object obj) ;
	/**
	 * 根据主键删除
	 * @param c
	 */
	public void delObject(String id) ;
	/**
	 * 根据主键删除
	 * @param c
	 */
	public void delObject(Integer id) ;
	/**
	 * 根据CLASS，ID查找对象
	 * @param clazz
	 * @param id
	 * @return
	 */
	public Object findObjectByClass(Class clazz,String id);
	/**
	 * 根据条件查询
	 * @param hql
	 * @return
	 */
	public List<Object> findList(String hql);
	/**
	 * 根据条件查询
	 * @param hql
	 * @param values
	 * @return
	 */
	public List<Object> findByPage(String hql,Object[] values) ;
}
