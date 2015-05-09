package vo;

import java.io.Serializable;

/**
 * 社区专职工作者变动情况表
 * @author wenyao
 *
 */
public class Sgddtable implements Serializable{
	
	private String area;
	private String nf;
	
	
	private String jd;//街道
	private String sq;//社区
	private String rzhs;//入住户数
	private String zzsgxm;//在职社工姓名
	private String zzsgsl;//在职社工人数
	private String xzsgsl;//新增社工人数
	private String xzsgxmsj;//新增社工姓名&
	private String jcsgsl;//减少社工人数
	private String jcsgxmsj;//减少社工姓名&离岗月份
	public String getJd() {
		return jd;
	}
	public void setJd(String jd) {
		this.jd = jd;
	}
	public String getSq() {
		return sq;
	}
	public void setSq(String sq) {
		this.sq = sq;
	}
	public String getRzhs() {
		return rzhs;
	}
	public void setRzhs(String rzhs) {
		this.rzhs = rzhs;
	}
	public String getZzsgxm() {
		return zzsgxm;
	}
	public void setZzsgxm(String zzsgxm) {
		this.zzsgxm = zzsgxm;
	}
	public String getZzsgsl() {
		return zzsgsl;
	}
	public void setZzsgsl(String zzsgsl) {
		this.zzsgsl = zzsgsl;
	}
	public String getXzsgsl() {
		return xzsgsl;
	}
	public void setXzsgsl(String xzsgsl) {
		this.xzsgsl = xzsgsl;
	}
	public String getXzsgxmsj() {
		return xzsgxmsj;
	}
	public void setXzsgxmsj(String xzsgxmsj) {
		this.xzsgxmsj = xzsgxmsj;
	}
	public String getJcsgsl() {
		return jcsgsl;
	}
	public void setJcsgsl(String jcsgsl) {
		this.jcsgsl = jcsgsl;
	}
	public String getJcsgxmsj() {
		return jcsgxmsj;
	}
	public void setJcsgxmsj(String jcsgxmsj) {
		this.jcsgxmsj = jcsgxmsj;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getNf() {
		return nf;
	}
	public void setNf(String nf) {
		this.nf = nf;
	}
	
	
	
}
