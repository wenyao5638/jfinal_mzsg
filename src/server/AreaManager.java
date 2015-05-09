package server;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import model.Area;

import common.Page;

import dao.AreaDAO;

public interface AreaManager {

	@Resource(name = "areaDao")
	public abstract void setLoginDAO(AreaDAO dao);

	public abstract Page findByPageWithBean(Page page, Area search,String area);

	public abstract Area findArea(Area c);

	public abstract void saveOrUpdate(Area c);

	public abstract void update(Area c);

	public abstract void delete(Area c);

	public abstract void delete(String ids);
	

	public abstract List findAreaBySup(String code);
	public abstract Map findFarther(String code,String jb);
	public abstract boolean checkArea(String code);
	public List findLevel();
	
	public abstract String getAreaString(String areacode);
	
	//获取街道List
	public abstract List getJdList();
	//获取区List
	public abstract List getQuList();
	public abstract Area findArea(String code);
	public abstract List findLevel(String superior,int level);
	public String getAreaString(String areacode,int level ,String scbz);
	
	public abstract List getAreaList(String dataArea);

}