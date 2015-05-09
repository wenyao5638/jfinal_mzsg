package dao.imp;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Component;

import com.jfinal.plugin.activerecord.Db;

import common.Page;
import dao.CodeDAO;
import model.Code;
@Component("codeDAO")
public class CodeDAOImp extends BaseDAOImp<Code> implements CodeDAO{

	
	public Page findByPageWithBean(Page page, Code search) {
		String hql = "from Code as a where 1=1";
		List list = new ArrayList();
		if (search != null) {
			
			
			
		}
		Object[] obj = list.toArray();
		//System.out.println("数据:" + hql);
		page.setTotalElement(this.findTotalCount("select count(code) " + hql,
				obj));
		return this.findByPage(page, hql + " order by code asc", obj);

	}

	
	/* (non-Javadoc)
	 * @see dao.impl.CodeDAO#delete(java.lang.String)
	 */
	public void delete(String ids) {
		String hql = "delete xtsz_code where 1=1 and (";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			if (i == 0) {
				hql += " code='" + id[i] + "'";
			} else {
				hql += " or code='" + id[i] + "'";
			}
		}
		if (id.length == 0) {
			hql += " 1<>1";
		}
		hql += " )";
		Db.update(hql);
	}

	
	/* (non-Javadoc)
	 * @see dao.impl.CodeDAO#findCode(model.Code)
	 */
	public Code findCode(Code c){
		String hql="select * from xtsz_code where code=? and typecode=?";
		List l=new ArrayList();
		l.add(c.getStr("code"));
		l.add(c.getStr("typecode"));
		List list=Code.dao.find(hql, l.toArray());
		Code code=new Code();
		if(list.size()>0){
			code=(Code)list.get(0);
		}
		else {
			code=null;
		}
		return code;
		//return this.findById(Code.class, c.getCode());
	}
	
	/* (non-Javadoc)
	 * @see dao.impl.CodeDAO#findCode(java.lang.String)
	 */
	public boolean findCode(String id){
		String hql="select code from xtsz_code where code=?";
		List list=new ArrayList();
		list.add(id);
		List l=Code.dao.find(hql, list.toArray());
		boolean flag=false;
		if(l.size()>0){
			flag=true;
		}
		return flag;
	}
	public List findCodes(String typecode){
		String hql="select * from xtsz_code where typecode='"+typecode+"'";
		return Code.dao.find(hql);
		
	}

	public Page findsplc(Page page,Code c) {

		String sql = "select * from xtsz_code a,xtsz_splc b where a.typecode = 'splx' and a.code = b.splx ";
		List list = new ArrayList();
		if (c != null) {
			if (c.getStr("code") != null && c.getStr("code").trim().length() > 0) {
				sql += " and b.splx = ? ";
				list.add(c.getStr("code"));
			}
			
		}
		Object[] obj = list.toArray();
		// System.out.println("数据:" + hql);
		page.setTotalElement(this.findTotalCount("select count(1) " + sql,
				obj));
		sql = "select a.name,b.swxh,b.bz,b.id "
				+ sql ;
		return this.findByPage(page, sql + " order by b.splx,b.swxh ", obj);

	
	}



	public String getyxrytree(String area, String id) {
		String sql = "select area,spr,sprxm from xtsz_splc_spr where area like '"+area+"%' and lcbh = '"+id+"' ";
		List list = Code.dao.find(sql, null);
		JSONArray jsonArr = new JSONArray();
		for(int i=0;i<list.size();i++){
			Object[] obj = (Object[]) list.get(i);
			JSONObject json = new JSONObject();
			json.put("id", obj[1].toString());
			json.put("pId", obj[0].toString());
			json.put("name", obj[2].toString());
			jsonArr.add(json);
		}
		return jsonArr.toString();
	}


 
	public String getkxrytree(String area, String id) {
		String sql = " select username,usercnname,area from xtsz_usertable "
				+ " where area like '"+area+"%' and enable='1' and username not in "
				+ "(select spr from xtsz_splc_spr where lcbh = '"+id+"' and area like '"+area+"%') ";
		List list = Code.dao.find(sql, null);
		JSONArray jsonArr = new JSONArray();
		for(int i=0;i<list.size();i++){
			Object[] obj = (Object[]) list.get(i);
			JSONObject json = new JSONObject();
			json.put("id", obj[0].toString());
			json.put("pId", obj[2].toString());
			json.put("name", obj[1].toString());
			jsonArr.add(json);
		}
		return jsonArr.toString();
	}


 
	public String getspmc(String id) {
		String sql = " select b.name+'/'+a.bz from xtsz_splc a,xtsz_code b where a.id = '"+id
				+"' and b.typecode = 'splx' and a.splx = b.code ";
		return Code.dao.find(sql).toString();
	}


 
	public void savespry(String id, String u) {
		String sql = "insert into xtsz_splc_spr(id,lcbh,area,spr,sprxm)"
				+ "select newid(),'"+id+"',area,username,usercnname "
				+ "from xtsz_usertable where username in ("+u+") ";
		Db.update(sql);
	}


 
	public void deletespry(String id, String u) {
		// TODO Auto-generated method stub
		String sql = "delete from xtsz_splc_spr where lcbh = '"+id+"' and spr in ("+u+")";
		Db.update(sql);
	}
	public  void merge(Code c){
		
		String sql ="insert into xtsz_code(typecode,code,name) values(?,?,?)";
		Object [] obj = new Object[]{c.getStr("typecode"),c.getStr("code"),c.getStr("name")};
		Db.update(sql,obj);
		
	}
	public void updateCode(Code c){
		String sql ="update xtsz_code set name =? where typecode=? and code=?";
		Object [] obj = new Object[]{c.getStr("name"),c.getStr("typecode"),c.getStr("code")};
		Db.update(sql,obj);
	}
	public int findTj(String name){
		String sql=" select nf from ims_gztxrw where name='"+name+"'";
		int count=2;
		List list=Code.dao.find(sql);
		if(list.size()>0){
			count=Integer.parseInt(list.get(0).toString());
		}
		return count;
	}


	@Override
	public void saveOrUpdate(Code c) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void delete(Code c) {
		// TODO Auto-generated method stub
		
	}
	

}
