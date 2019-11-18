package pojo;

public class Manager {
	private String mid;
	private String mpwd;
	private String level;

	public Manager(String mid, String mpwd, String level) {
		super();
		this.mid = mid;
		this.mpwd = mpwd;
		this.level = level;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

}
