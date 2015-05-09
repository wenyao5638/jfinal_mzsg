package dao.imp;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import dao.BaseDAO;
/**
 * 
 * @author wangliang
 *
 * @param <T>
 */
public class BaseDAOImp<T extends Model<T>> implements BaseDAO<T> {
	
	
	/* private Class<T> type;
	 public BaseDAOImp() {
	        Type t = getClass().getGenericSuperclass();
	        ParameterizedType pt = (ParameterizedType) t;
	        type = (Class) pt.getActualTypeArguments()[0];
	    }*/
	 
	 public Class<T> getClazz() {
			Class<T> entityClass = (Class<T>) ((ParameterizedType) getClass()
					.getGenericSuperclass()).getActualTypeArguments()[0];
	        return entityClass;
		}

	@Override
	public common.Page findByPage(String selectedColumn,String sql, common.Page page, Object[] values) {
		try {
//			System.out.println("selectedColumn: "+selectedColumn);
//			System.out.println("sql: "+sql);
//			System.out.println("page: "+page.getCurrentPage()+","+page.getPageSize());
//			System.out.println("values: "+Arrays.toString(values));
			Page<T> pageGeneric = ((Model<T>) getClazz().newInstance()).
					 paginate(page.getCurrentPage(), page.getPageSize(), selectedColumn, sql,values);
			page.setCurrentPage(pageGeneric.getPageNumber());
			page.setPageSize(pageGeneric.getPageSize());
			page.setTotalElement(pageGeneric.getTotalRow());
			page.setResult(pageGeneric.getList());
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return page;
	}
	
	
	public int findTotalCount(String sql ,Object... paras){
		return Db.queryInt(sql, paras);
	}
	
	public T findById(Object id) {
		T model = null;
		try {
			model = (T)getClazz().newInstance().findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	public void delete(T model) {
		try {
			getClazz().newInstance().delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void saveOrUpdate() {
		try {
			getClazz().newInstance().save();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
