package dao;

import java.util.List;

import model.Area;

import common.Page;

public interface AreaDAO {

	public abstract Page findByPageWithBean(Page page, Area search,String area);

	public abstract List findAreaBySup(String code);

	public abstract void delete(String ids);

	public abstract void saveOrUpdate(Area c);

	public abstract void merge(Area c);

	public abstract void delete(Area c);

	public abstract Area findArea(Area c);

	public abstract List findFarther(String code);

	public abstract boolean checkArea(String code);
	public List findLevel();
	
	public abstract List getAreaString(String areacode);
	
	public abstract List getJdList();
	public abstract List getQuList();
	public abstract Area findArea(String code);
	public List findLevel(String superior,int level);
	public List getAreaString(String areacode,int level ,String scbz);
	public abstract List getAreaList(String dataArea);
}