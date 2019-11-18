package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.PageBean;
import pojo.Book;
import service.BookService;

@Controller
public class BookManaController {
	@Autowired
	private BookService bookService;
	
	/**
	 * to bookCrud.jsp
	 */
	@RequestMapping("/toBookCrud.action")
	public String toBookCrud() {
		return "manager/bookCrud";
	}

	/**
	 * 表格显示所有数据
	 */
	@RequestMapping("/bookList.action")
	public String list(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model) {
		model.addAttribute("pagemsg", bookService.findByPage(currentPage));// 回显分页数据
		return "manager/bookCrud";
	}

	/**
	 * crud添加新图书
	 */
	@RequestMapping(value = "/createBook.action")
	@ResponseBody
	public String createBook(@RequestParam("bid") String bid, @RequestParam("bname") String bname,
			@RequestParam("author") String author, @RequestParam("publishment") String publishment, @RequestParam("isbn") String isbn,
			@RequestParam("buytime") String buytime, @RequestParam("price") String price,
			@RequestParam("status") String status) {
		Boolean boo = bookService.addBook(bid, bname, author, publishment, isbn, buytime, price, status);
		if (boo == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 通过bid寻找图书
	 */
	@RequestMapping("/getBookById.action")
	@ResponseBody
	public Book getBookById(String bid) {
		System.out.println("bid:"+bid);
		Book book = bookService.getBookById(bid);
		System.out.println(book.getBname());
		return book;
	}

	/**
	 * 通过输入框查找图书
	 */
	@RequestMapping("/findBookById.action")
	public String findBookById(@RequestParam("bid") String bid,
			@RequestParam(value = "currentPpublishment", defaultValue = "1", required = false) int currentPpublishment, Model model) {
		PageBean<Book> books = bookService.findBookById(currentPpublishment, bid);
		model.addAttribute("pagemsg", books);// 回显分页数据
		return "manager/bookCrud";
	}

	/**
	 * 更新图书
	 */
	@RequestMapping("/updateBook.action")
	@ResponseBody
	public String bookUpdate(@RequestParam("bid") String bid, @RequestParam("bname") String bname,
			@RequestParam("author") String author, @RequestParam("publishment") String publishment, @RequestParam("isbn") String isbn,
			@RequestParam("buytime") String buytime, @RequestParam("price") String price,
			@RequestParam("status") String status) {
		Boolean bl = bookService.updateBook(bid, bname, author, publishment, isbn, buytime, price, status);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除图书
	 */
	@RequestMapping("/deleteBook.action")
	@ResponseBody
	public String bookDelete(@RequestParam("bid") String bid) {
		Boolean bl = bookService.deleteBook(bid);
		System.out.println("in bookDelete");
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
}
