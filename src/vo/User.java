package vo;

import java.io.Serializable;

public class User implements Serializable{
	private String username;
	private String usercnname;
	private String areaname;
	private String area;
	private String rolename;
	private String roleid;
	private String createuser;
	private String createtime;
	private String lastlogintime;
	private String bmmc;
	private String lxdh;
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	private String syzt;
	public String getSyzt() {
		return syzt;
	}
	public void setSyzt(String syzt) {
		this.syzt = syzt;
	}
	private String phone;
	private String opt;
	private String opt2;
	private String opt3;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsercnname() {
		return usercnname;
	}
	public void setUsercnname(String usercnname) {
		this.usercnname = usercnname;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getCreateuser() {
		return createuser;
	}
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getLastlogintime() {
		return lastlogintime;
	}
	public void setLastlogintime(String lastlogintime) {
		this.lastlogintime = lastlogintime;
	}
	public String getBmmc() {
		return bmmc;
	}
	public void setBmmc(String bmmc) {
		this.bmmc = bmmc;
	}
	

	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public String getOpt2() {
		return opt2;
	}
	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}
	public String getOpt3() {
		return opt3;
	}
	public void setOpt3(String opt3) {
		this.opt3 = opt3;
	}
	
}
