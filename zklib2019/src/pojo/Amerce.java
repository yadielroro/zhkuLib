package pojo;

public class Amerce {
	private String amerce_id;
	private String borrow_id;
	private String sid;
	private String item;
	private String money;
	private String ispay;
	private String paytime;

	public Amerce() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Amerce(String amerce_id, String borrow_id, String sid, String item, String money, String ispay,
			String paytime) {
		super();
		this.amerce_id = amerce_id;
		this.borrow_id = borrow_id;
		this.sid = sid;
		this.item = item;
		this.money = money;
		this.ispay = ispay;
		this.paytime = paytime;
	}

	public String getAmerce_id() {
		return amerce_id;
	}

	public void setAmerce_id(String amerce_id) {
		this.amerce_id = amerce_id;
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

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getIspay() {
		return ispay;
	}

	public void setIspay(String ispay) {
		this.ispay = ispay;
	}

	public String getPaytime() {
		return paytime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}

}
