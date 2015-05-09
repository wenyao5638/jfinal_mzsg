package vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Area {
	private String code;

	private String level;

	private String name;

	private String opt;
	private String scbz;

	public String getScbz() {
		return scbz;
	}

	public void setScbz(String scbz) {
		this.scbz = scbz;
	}
	private String superior;
	private List<Map> areas = new ArrayList();
	public List<Map> getAreas() {
		return areas;
	}

	public void setAreas(List<Map> areas) {
		this.areas = areas;
	}

	public String getCode() {
		return code;
	}

	public String getLevel() {
		return level;
	}

	public String getName() {
		return name;
	}

	public String getOpt() {
		return opt;
	}

	public String getSuperior() {
		return superior;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public void setSuperior(String superior) {
		this.superior = superior;
	}
}
