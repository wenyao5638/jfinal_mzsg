package vo;
public class Code {
	private String typecode;
	private String code;
	private String name;
	private String opt;
	private String id;
	private String state;

	public String getTypecode() {
		return typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	private String _parentId;



	public String get_parentId() {
		return _parentId;
	}

	public void set_parentId(String parentId) {
		_parentId = parentId;
	}

	public String getCode() {
		return code;
	}

	public String getName() {
		return name;
	}

	public String getOpt() {
		return opt;
	}

	
	public void setCode(String code) {
		this.code = code;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	
}
