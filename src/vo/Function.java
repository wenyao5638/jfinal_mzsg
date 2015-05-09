package vo;

import java.io.Serializable;

public class Function implements Serializable{

	/**
	 * 鍚撮箯楣�0130801
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String cnname;//鍚嶇О
	private String href;//url
	private String pid;//鐖剁粨鐐�
	private Integer xh;//鎺掑簭搴忓彿
	private String dlbz;//浠ｇ悊鏍囧織
	private String manage;//鏌ヨ绠＄悊
	private String opt;
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public String getManage() {
		return manage;
	}
	public void setManage(String manage) {
		this.manage = manage;
	}
	public String getDlbz() {
		return dlbz;
	}
	public void setDlbz(String dlbz) {
		this.dlbz = dlbz;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCnname() {
		return cnname;
	}
	public void setCnname(String cnname) {
		this.cnname = cnname;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public Integer getXh() {
		return xh;
	}
	public void setXh(Integer xh) {
		this.xh = xh;
	}
	
	
}
