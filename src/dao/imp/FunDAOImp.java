package dao.imp;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.jfinal.plugin.activerecord.Db;

import common.Page;
import dao.FunDAO;
import model.Function;

@Component("funDAO")
public class FunDAOImp extends BaseDAOImp<Function> implements FunDAO
	{

	/* (non-Javadoc)
	 * @see dao.impl.FunDAO#findByPageWithBean(common.Page, model.Function)
	 */
	public Page findByPageWithBean(Page page, Function search) {
		String hql = "select * from xtsz_function as a where 1=1";
		List list = new ArrayList();
		if (search != null) {
			if (search.getStr("pid") != null
					&& search.getStr("pid").trim().length() > 0) {
				hql += " and pid = ?";
				list.add(search.getStr("pid"));
			}
			if(search.getStr("id")!=null && search.getStr("id").trim().length()>0){
				hql += " and id = ?";
				list.add(search.getStr("id"));
			}
			if(search.getStr("cnname")!=null && search.getStr("cnname").trim().length()>0){
				hql += " and id = ?";
				list.add(search.getStr("id"));
			}
					
			
		}
		Object[] obj = list.toArray();
		//System.out.println("数据:" + hql);
		page.setTotalElement(this.findTotalCount("select count(id) " + hql,
				obj));
		return this.findByPage(page, hql + " order by id asc", obj);

	}

	
	/* (non-Javadoc)
	 * @see dao.impl.FunDAO#delete(java.lang.String)
	 */
	public void delete(String ids) {
		String hql = "delete xtsz_function where 1=1 and (";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			if (i == 0) {
				hql += " id='" + id[i] + "'";
			} else {
				hql += " or id='" + id[i] + "'";
			}
		}
		if (id.length == 0) {
			hql += " 1<>1";
		}
		hql += " )";
		Db.update(hql);
	}

	public Function findFun(Function c){
		return Function.dao.findById( c.getStr("id"));
	}
	public boolean findFun(String id){
		String hql="select id from xtsz_function where id=?";
		List list=new ArrayList();
		list.add(id);
		List l=Function.dao.find(hql, list.toArray());
		boolean flag=false;
		if(l.size()>0){
			flag=true;
		}
		return flag;
	}


	@Override
	public void saveOrUpdate(Function c) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void merge(Function c) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void delete(Function c) {
		// TODO Auto-generated method stub
		
	}
		

}
