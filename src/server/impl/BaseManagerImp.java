package server.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.jfinal.plugin.activerecord.Record;

import server.BaseManager;
import common.Page;
import dao.BaseDAO;
/**
 * 
 * @author wangliang
 *
 */
public class BaseManagerImp {

	private BaseDAO dao;

	public void setDao(BaseDAO dao) {

		this.dao = dao;
	}
	
	public String list2String(List list,String ... jsonpara){
		JSONArray jsonArr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			Record obj = (Record) list.get(i);
			JSONObject json = new JSONObject();
			
			json.put(jsonpara[i], obj.get(""));
			json.put("pId", obj.get("ROLEID"));
			json.put("name", obj.get("ROLENAME"));
			jsonArr.add(json);
		}
		System.out.println("MenuString: "+jsonArr.toString());
		return jsonArr.toString();
		
	}
	
	
}
