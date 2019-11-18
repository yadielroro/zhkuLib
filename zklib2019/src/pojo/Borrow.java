package pojo;

public class Borrow {
	private String borrow_id;
	private String sid;
	private String bid;
	private String start;
	private String end;
	private String again;
	private String deal;

	public Borrow() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Borrow(String borrow_id, String sid, String bid, String start, String end, String again, String deal) {
		super();
		this.borrow_id = borrow_id;
		this.sid = sid;
		this.bid = bid;
		this.start = start;
		this.end = end;
		this.again = again;
		this.deal = deal;
	}

	public String getBorrow_id() {
		return borrow_id;
	}

	public void setBorrow_id(String borrow_id) {
		this.borrow_id = borrow_id;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getAgain() {
		return again;
	}

	public void setAgain(String again) {
		this.again = again;
	}

	public String getDeal() {
		return deal;
	}

	public void setDeal(String deal) {
		this.deal = deal;
	}

}
