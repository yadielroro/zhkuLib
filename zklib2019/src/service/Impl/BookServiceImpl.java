package service.Impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.BookDao;
import pojo.Book;
import pojo.PageBean;
import pojo.Student;
import pojo.Book;
import service.BookService;

@Service("bookService")
public class BookServiceImpl implements BookService {

	@Resource
	private BookDao bookDao;

	public List<Book> selectByAny(String word) {
		System.out.println(word);
		List<Book> books = bookDao.selectByAny(word);
		System.out.println(books.size());
		return books;
	}

	@Override
	public List<String> selectByName(String word) {
		List<String> bnames = bookDao.selectByName(word);
		System.out.println(bnames.size());
		return bnames;
	}

	@Override
	public List<Book> selectBookList() {
		return bookDao.selectBookList();
	}

	@Override
	public int selectCount() {
		return bookDao.selectCount();
	}

	@Override
	public PageBean<Book> findByPage(int currentPage) {
		PageBean<Book> pageBean = new PageBean<Book>();

		// 封装当前页数
		pageBean.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = bookDao.selectCount();
		pageBean.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());

		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Book> lists = bookDao.findByPage(start, size);
		pageBean.setLists(lists);

		return pageBean;
	}

	@Override
	public boolean addBook(String bid, String bname, String author, String publishment, String isbn, String buytime,
			String price, String status) {
		// TODO Auto-generated method stub
		// String permitted = "1";
		Book book = new Book(bid, bname, author, publishment, isbn, buytime, price, status);
		int i = bookDao.addBook(book);
		Book m = bookDao.isExistId(book.getBid());
		if (m != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateBook(String bid, String bname, String author, String publishment, String isbn, String buytime,
			String price, String status) {
		String old_isbn = bookDao.getBookById(bid).getIsbn();
		int i = bookDao.updateBook(bid, bname, author, publishment, isbn, buytime, price, status);
		String new_isbn = bookDao.getBookById(bid).getIsbn();
		if (old_isbn != new_isbn) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean deleteBook(String bid) {
		System.out.println(bid);
		int isDelete = bookDao.deleteBook(bid);
		System.out.println(isDelete);
		if (isDelete != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isExistId(String bid) {
		// TODO Auto-generated method stub
		Book book = bookDao.isExistId(bid);
		if (book != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Book getBookById(String bid) {
		// TODO Auto-generated method stub
		System.out.println("into service getBookById");
		Book book = bookDao.getBookById(bid);
		System.out.println(book);
		return book;
	}

	@Override
	public PageBean<Book> findBookById(int currentPage, String bid) {
		// TODO Auto-generated method stub
		Book book = this.getBookById(bid);
		PageBean<Book> pageBean = new PageBean<Book>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = bookDao.bookCountSameId(bid);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Book> lists = bookDao.findByPageById(bid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

}
