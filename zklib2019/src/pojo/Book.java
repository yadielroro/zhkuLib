package pojo;

public class Book {
	private String bid;
	private String bname;
	private String author;
	private String publishment;
	private String isbn;
	private String buytime;
	private String price;
	private String status;

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(String bid, String bname, String author, String publishment, String isbn, String buytime, String price,
			String status) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.author = author;
		this.publishment = publishment;
		this.isbn = isbn;
		this.buytime = buytime;
		this.price = price;
		this.status = status;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublishment() {
		return publishment;
	}

	public void setPublishment(String publishment) {
		this.publishment = publishment;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBuytime() {
		return buytime;
	}

	public void setBuytime(String buytime) {
		this.buytime = buytime;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bname=" + bname + ", author=" + author + ", publishment=" + publishment
				+ ", isbn=" + isbn + ", buytime=" + buytime + ", price=" + price + ", status=" + status + "]";
	}

}
