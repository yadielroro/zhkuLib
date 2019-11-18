package pojo;

public class Notice {
	private String nid;
	private String mid;
	private String nsum;
	private String ndate;
	private String ncontent;
	private String npic;

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(String nid, String mid, String nsum, String ndate, String ncontent, String npic) {
		super();
		this.nid = nid;
		this.mid = mid;
		this.nsum = nsum;
		this.ndate = ndate;
		this.ncontent = ncontent;
		this.npic = npic;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getNsum() {
		return nsum;
	}

	public void setNsum(String nsum) {
		this.nsum = nsum;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNpic() {
		return npic;
	}

	public void setNpic(String npic) {
		this.npic = npic;
	}

}
