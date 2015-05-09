package dao;

import java.util.List;

import model.Code;
import common.Page;
public interface CodeDAO {


	public abstract Page findByPageWithBean(Page page, Code search);

	
	public abstract void delete(String ids);


	public abstract Code findCode(Code c);


	public abstract boolean findCode(String id);
	public abstract void saveOrUpdate(Code c);

	public abstract void merge(Code c);

	public abstract void delete(Code c);
	public List findCodes(String typecode);
	public abstract Page findsplc(Page page,Code c);


	public abstract String getyxrytree(String area, String id);


	public abstract String getkxrytree(String area, String id);


	public abstract String getspmc(String id);


	public abstract void savespry(String id, String u);


	public abstract void deletespry(String id, String u);
	
	public abstract void updateCode(Code c);
	public int findTj(String name);
}