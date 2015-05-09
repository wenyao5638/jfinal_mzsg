package server.impl;

import java.util.ArrayList;
import java.util.List;
import model.Role;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import server.RoleManager;

import org.springframework.stereotype.Component;

import com.jfinal.plugin.activerecord.Record;

@Component("roleManager")
@SuppressWarnings("unchecked")
public class RoleManagerImpl implements RoleManager {


	public Role findRole(String roleid) throws Exception {

		return Role.dao.findRole(roleid);
	}

	public List findRoles(String area) {
		return Role.dao.findRoles(area);
	}

	public String getAllRoleList() throws Exception {
		List<Role> list = Role.dao.getAllRoleList();
		JSONArray jsonArr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			Role role = list.get(i);
			JSONObject json = new JSONObject();
			json.put("roleid", role.getStr("roleid"));
			json.put("rolename", role.getStr("rolename"));
			jsonArr.add(json);
		}
		return jsonArr.toString();
	}

	public String getMenuString(String areacode) throws Exception {
		List<Record> list = Role.dao.getMenuString(areacode);
		
		JSONArray jsonArr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			Record obj = list.get(i);
			JSONObject json = new JSONObject();
			
			json.put("id", obj.get(""));
			json.put("pId", obj.get("ROLEID"));
			json.put("name", obj.get("ROLENAME"));
			jsonArr.add(json);
		}
		System.out.println("MenuString: "+jsonArr.toString());
		return jsonArr.toString();
	}

	public void saveRole(Role role) throws Exception {
		Role.dao.saveRole(role);
	}

	public String getAdTreeString() throws Exception {
		List<Object[]> list = Role.dao.getAdTreeString();
		String treeString = "";
		int n = 1;
		for (Object[] obj : list) {
			if (n++ != 1) {
				treeString += ",";
			}
			treeString += "{id:\"" + obj[1].toString() + "\", pId:\""
					+ obj[0].toString() + "\", name:\"" + obj[2].toString()
					+ "\"";
			if (obj[1].toString().length() < 4) {
				treeString += ", open:true";
			}
			treeString += "}";
		}
		return treeString;
	}

	public String getNorTreeString() throws Exception {
		List<Object[]> list = Role.dao.getNorTreeString();
		String treeString = "";
		int n = 1;
		for (Object[] obj : list) {
			if (n++ != 1) {
				treeString += ",";
			}
			treeString += "{id:\"" + obj[1].toString() + "\", pId:\""
					+ obj[0].toString() + "\", name:\"" + obj[2].toString()
					+ "\"";
			if (obj[1].toString().length() < 4) {
				treeString += ", open:true";
			}
			treeString += "}";
		}
		return treeString;
	}

	public String getroleTreeString(String roleid) throws Exception {
		List<Object[]> list = Role.dao.getroleTreeString(roleid);

		String treeString = "";
		int n = 1;
		for (Object[] obj : list) {
			if (n++ != 1) {
				treeString += ",";
			}
			treeString += "{id:\"" + obj[1].toString() + "\", pId:\""
					+ obj[0].toString() + "\", name:\"" + obj[2].toString()
					+ "\"";
			if (obj[3].toString() != null && obj[3].toString().length() > 0) {
				treeString += ", checked:true";
			}
			if (obj[1].toString().length() < 4) {
				treeString += ", open:true";
			}
			treeString += "}";
		}
		return treeString;
	}

	public String getAdTreeStringbyRole(String roleid) throws Exception {
		List<Object[]> list = Role.dao.getAdTreeString();
		String controller = Role.dao.getRoleController(roleid);
		String treeString = "";
		int n = 1;
		for (Object[] obj : list) {
			if (n++ != 1) {
				treeString += ",";
			}
			treeString += "{id:\"" + obj[1].toString() + "\", pId:\""
					+ obj[0].toString() + "\", name:\"" + obj[2].toString()
					+ "\"";
			if (controller.contains("\"" + obj[1] + "\"")) {
				treeString += ", checked:true";
			}
			if (obj[1].toString().length() < 4) {
				treeString += ", open:true";
			}
			treeString += "}";
		}
		return treeString;
	}

	public List getRole(String roleid) throws Exception {
		List<Object[]> list = Role.dao.getAdTreeString();
		String controller = Role.dao.getRoleController(roleid);
		// String treeString = "";
		int n = 1;
		List<vo.Tree> tlist = new ArrayList();
		for (Object[] obj : list) {
			vo.Tree tree = new vo.Tree();
			tree.setId(obj[1].toString());
			tree.setpId(obj[0].toString());
			tree.setName(obj[2].toString());
			if (obj[1].toString().length() < 4) {
				tree.setOpen(true);
			}if (controller.contains("\"" + obj[1] + "\"")) {
				tree.setChecked(true);
			}
			tlist.add(tree);
		}
		return tlist;
	}

	public String getNorTreeStringbyRole(String roleid) throws Exception {
		List<Object[]> list = Role.dao.getNorTreeString();
		String ordinary = Role.dao.getRoleOrdinary(roleid);
		String treeString = "";
		int n = 1;
		for (Object[] obj : list) {
			if (n++ != 1) {
				treeString += ",";
			}
			treeString += "{id:\"" + obj[1].toString() + "\", pId:\""
					+ obj[0].toString() + "\", name:\"" + obj[2].toString()
					+ "\"";
			if (ordinary.contains("\"" + obj[1] + "\"")) {
				treeString += ", checked:true";
			}
			if (obj[1].toString().length() < 4) {
				treeString += ", open:true";
			}
			treeString += "}";
		}
		return treeString;
	}

	public void updateRoleList(Role role) throws Exception {
		Role.dao.updateRoleList(role);
	}

	public void deleteRole(String roleid) throws Exception {
		Role.dao.deleteRole(roleid);
	}
	public String findJlxx() {
		return Role.dao.findJlxx();
	}
	

}
