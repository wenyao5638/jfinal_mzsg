package dao.imp;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.jfinal.plugin.activerecord.Db;

import common.Page;
import dao.AreaDAO;
import model.Area;

@Component("areaDAO")
public class AreaDAOImp extends BaseDAOImp<Area>
		implements AreaDAO {
	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.impl.AreaDao#findByPageWithBean(common.Page, model.Area)
	 */
	public Page findByPageWithBean(Page page, Area search,String area) {
		String hql = "from Area as a where superior like '"+area+"%'";
		List list = new ArrayList();
		if (search != null) {
			if (search.getStr("code") != null
					&& search.getStr("code").trim().length() > 0) {
				hql += " and code like ?";
				list.add(search.getStr("code")+"%");
			}
			if (search.getStr("name") != null
					&& search.getStr("name").trim().length() > 0) {
				hql += " and name like ?";
				list.add("%" + search.getStr("name") + "%");
			}
			if (search.getStr("level") != null
					&& search.getStr("level").trim().length() > 0) {
				hql += " and level =?";
				list.add(search.getStr("level"));
			}
			if(search.getStr("superior")!=null && search.getStr("superior").length()>0){
				hql += " and superior like ?";
				list.add(search.getStr("superior")+"%");
			}
		}
		Object[] obj = list.toArray();
		//System.out.println("数据:" + hql);
		page.setTotalElement(this.findTotalCount("select count(code) " + hql,
				obj));
		return this.findByPage(hql + " order by code asc",page,obj);//��ѯ��ҳ

	}

	
	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.impl.AreaDao#delete(java.lang.String)
	 */
	public void delete(String ids) {
		String sql = "delete area where 1=1 and (";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			if (i == 0) {
				sql += " code='" + id[i] + "'";
			} else {
				sql += " or code='" + id[i] + "'";
			}
		}
		if (id.length == 0) {
			sql += " 1<>1";
		}
		sql += " )";
		Db.update(sql);
	}

	public Area findArea(Area c) {
		return Area.dao.findById(c.getStr("code"));
	}
	public boolean checkArea(String code){
		boolean flag=false;
		String hql="select code from Area where code=?";
		List list=new ArrayList();
		list.add(code);
		List l=Area.dao.find(hql, list.toArray());
		if(l.size()>0){
			flag=true;
		}
		return flag;
	}
	public List findLevel(){
		String sql="select id,name from xtsz_level order by id ";
		return Area.dao.find(sql);
	}
	
	public List getAreaString(String areacode){
		//级联数据查询速度比较慢暂时修改（20141114吴鹏鹰）
		//添加SUPERIOR索引
		String sql = "with t_area(CODE, NAME, SUPERIOR, LEVEL) as(" +
				" select CODE, NAME, SUPERIOR, LEVEL from area where code = '"+areacode+"' " +
				" union all select area.CODE, area.NAME, area.SUPERIOR, area.LEVEL from t_area, area" +
				" where area.SUPERIOR = t_area.code )" +
				" select * from t_area order by code";
		return Db.find(sql);
	}
	public List getAreaString(String areacode,int level ,String scbz){
		//级联数据查询速度比较慢暂时修改（20141114吴鹏鹰）
		//添加SUPERIOR索引
		String sql = "with t_area(CODE, NAME, SUPERIOR, LEVEL,scbz) as(" +
				" select CODE, NAME, SUPERIOR, LEVEL,scbz from area where code = '"+areacode+"' " +
				" union all select area.CODE, area.NAME, area.SUPERIOR, area.LEVEL,area.scbz from t_area, area" +
				" where area.SUPERIOR = t_area.code)" +
				" select * from t_area ";
		sql+="  where convert(int,level)<="+level+"  and scbz='"+scbz+"' order by code";
	//	String sql = "select CODE, NAME, SUPERIOR, LEVEL from area where code like '"+areacode+"%' and Integer(level)<="+level+" order by code";
		return Area.dao.find(sql);
	}
	public List findLevel(String superior,int level){
		String hql="select * from Area where superior=? and level=?";
		List list=new ArrayList();
		list.add(superior);
		list.add(level);
		return Area.dao.find(hql, list.toArray());
		
	}
	
	public List getJdList(){
		String hql="select * from area where length(code)=9 order by code";
		return Area.dao.find(hql);
	}
	public List getQuList(){
		String hql="select * from area where length(code)=6 order by code";
		return Area.dao.find(hql);
	}
	public Area findArea(String code){
		//System.out.println("哈哈:"+code);
		/*   String hql="select * from area where code='"+code+"'";
		   List<Area> list=Area.dao.find(hql);
		   Area a=new Area();
		  if(list.size()>0){
			  a=(Area)list.get(0);
		  }else{
			  a=null;
		  }
		   return a;*/
		return Area.dao.findById(code);
	   }


	@Override
	public List getAreaList(String dataArea) {
		String hql="select * from area a where superior  like '"+dataArea+"%' and scbz='1' "; 
		return Area.dao.find(hql);
	}


	@Override
	public List findAreaBySup(String code) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void saveOrUpdate(Area c) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void merge(Area c) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void delete(Area c) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List findFarther(String code) {
		// TODO Auto-generated method stub
		return null;
	}

}
