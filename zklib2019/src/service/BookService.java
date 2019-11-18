package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Book;
import pojo.PageBean;

public interface BookService {

	List<Book> selectByAny(String word);

	List<String> selectByName(String word);

	List<Book> selectBookList();

	int selectCount();

	PageBean<Book> findByPage(int currentPage);

	public Book getBookById(String bid);

	public boolean isExistId(String bid);

	public boolean addBook(String bid, String bname, String author, String publishment, String isbn, String buytime,
			String price, String status);

	public boolean updateBook(String bid, String bname, String author, String publishment, String isbn, String buytime,
			String price, String status);

	public boolean deleteBook(String bid);

	public PageBean<Book> findBookById(int currentPage, String bid);
}
