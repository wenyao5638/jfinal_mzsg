package vo;

public class Tree {
	private String id;
	private String name;
	private String pId;
	private boolean checked=false;
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	private boolean open=false;

	

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

}
