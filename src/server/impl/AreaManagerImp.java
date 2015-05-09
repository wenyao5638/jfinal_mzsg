package server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import model.Area;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Component;

import com.jfinal.plugin.activerecord.Record;

import server.AreaManager;
import common.Page;
import dao.AreaDAO;

@Component("areaManager")
public class AreaManagerImp implements AreaManager {
	
	@Resource(name = "areaDAO")
	private AreaDAO dao;

	
	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.AreaManager#findByPageWithBean(common.Page, model.Area)
	 */
	public Page findByPageWithBean(Page page, Area search,String area) {

		return dao.findByPageWithBean(page, search,area);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.AreaManager#findCourse(model.Area)
	 */
	public Area findArea(Area c) {
		return dao.findArea(c);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.AreaManager#saveOrUpdate(model.Area)
	 */
	public void saveOrUpdate(Area c) {
		dao.saveOrUpdate(c);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.AreaManager#update(model.Area)
	 */
	public void update(Area c) {
		dao.merge(c);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.AreaManager#delete(model.Area)
	 */
	public void delete(Area c) {
		dao.delete(c);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.AreaManager#delete(java.lang.String)
	 */
	public void delete(String ids) {
		dao.delete(ids);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see server.impl.AreaManager#findArea(java.lang.String)
	 */
	public List findAreaBySup(String code) {
		return dao.findAreaBySup(code);
	}

	public Map findFarther(String code, String jb) {
		// TODO Auto-generated method stub
		Map map = new HashMap<String, Object>();
		List<Object[]> list = dao.findFarther(code);
		boolean flag = false;
		//System.out.println("1:"+jb);
		int i=1;
		if(list.size()>0){
		Object[] obj =list.get(0);

			String ojb = obj[2] == null ? "0" : obj[2].toString();
			
		
			if (ojb.equals(jb)) {
				
				map.put("code", obj[0] == null ? "" : obj[0].toString());
				map.put("name", obj[1] == null ? "" : obj[1].toString());
				map.put("level", ojb);
				
				return map;
			} else {
				return findFarther((obj[3] == null ? "" : obj[3].toString()), jb);
			}
		
		}
		return null;

	}

	public boolean checkArea(String code) {

		return dao.checkArea(code);
	}

	public List<vo.Level> findLevel() {
		List<Object[]> list=dao.findLevel();
		List<vo.Level> levels=new ArrayList();
		for(Object[] obj:list){
			String id=obj[0]==null?"":obj[0].toString();
			String name=obj[1]==null?"":obj[1].toString();
			vo.Level level=new vo.Level();
			level.setId(id);
			level.setName(name);
			levels.add(level);
		}
		return levels;
	}
	
	public String getAreaString(String areacode){
		List<Record> list = dao.getAreaString(areacode);
		
		JSONArray jsonArr = new JSONArray();
		for(int i=0;i<list.size();i++){
			Record obj = list.get(i);
			JSONObject json = new JSONObject();
			json.put("id", obj.get("CODE"));
			json.put("pId", obj.get("SUPERIOR"));
			json.put("name", obj.get("NAME"));
			jsonArr.add(json);
		}
		return jsonArr.toString();
	}
	public String getAreaString(String areacode,int level ,String scbz){
		List<Object[]> list = dao.getAreaString(areacode,level , scbz);
		
		JSONArray jsonArr = new JSONArray();
		for(int i=0;i<list.size();i++){
			Object[] obj = list.get(i);
			JSONObject json = new JSONObject();
			json.put("id", obj[0].toString());
			json.put("pId", obj[2].toString());
			json.put("name", obj[1].toString());
			jsonArr.add(json);
		}
		return jsonArr.toString();
	}
	public List getJdList(){
		return dao.getJdList();
	}
	public List getQuList(){
		return dao.getQuList();
	}
	public  Area findArea(String code){
		return dao.findArea(code);
	}

	@Override
	public List findLevel(String superior, int level) {
		// TODO Auto-generated method stub
		return dao.findLevel(superior, level);
	}

	@Override
	public List getAreaList(String dataArea) {
		// TODO Auto-generated method stub
		return dao.getAreaList(dataArea);
	}

	@Override
	public void setLoginDAO(AreaDAO dao) {
		// TODO Auto-generated method stub
		
	}

	

	
}
