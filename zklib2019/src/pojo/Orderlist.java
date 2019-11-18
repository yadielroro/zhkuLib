package pojo;

public class Orderlist {
	private String order_id;
	private String sid;
	private String bid;
	private String endtime;

	public Orderlist() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Orderlist(String order_id, String sid, String bid, String endtime) {
		super();
		this.order_id = order_id;
		this.sid = sid;
		this.bid = bid;
		this.endtime = endtime;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
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

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

}
