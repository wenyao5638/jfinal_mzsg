package vo;

public class Holiday{
	private String lx; //区分holiday表和workday表
	private String rq; //日期
	private String opt;//操作
	
	public String getLx() {
		return lx;
	}
	public void setLx(String lx) {
		this.lx = lx;
	}
	public String getRq() {
		return rq;
	}
	public void setRq(String rq) {
		this.rq = rq;
	}
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
}
