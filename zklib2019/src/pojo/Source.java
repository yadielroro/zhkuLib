package pojo;

public class Source {
	private String souid;
	private String mid;
	private String ssum;
	private String saddress;
	private String sformat;

	public Source() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Source(String souid, String mid, String ssum, String saddress, String sformat) {
		super();
		this.souid = souid;
		this.mid = mid;
		this.ssum = ssum;
		this.saddress = saddress;
		this.sformat = sformat;
	}

	public String getSouid() {
		return souid;
	}

	public void setSouid(String souid) {
		this.souid = souid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getSsum() {
		return ssum;
	}

	public void setSsum(String ssum) {
		this.ssum = ssum;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	public String getSformat() {
		return sformat;
	}

	public void setSformat(String sformat) {
		this.sformat = sformat;
	}

}
