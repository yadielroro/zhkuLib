package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import pojo.Book;
import pojo.Student;

public interface BookDao {

	/**
	 * 根据书名或出版社或作者或isbn查找一本书
	 */
	List<Book> selectByAny(String word);

	List<String> selectByName(String word);

	/**
	 * 查询所有图书
	 */
	List<Book> selectBookList();

	/**
	 * 查询图书记录总数
	 */
	int selectCount();

	public Book getBookById(String bid);

	public Book isExistId(String bid);

	public List<Book> findAllBook();

	public int bookCount();

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from book limit #{start},#{size}")
	List<Book> findByPage(@Param("start") int start, @Param("size") int size);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from book where bid=#{bid} limit #{start},#{size}")
	List<Book> findByPageById(@Param("bid") String bid, @Param("start") int start, @Param("size") int size);

	public int addBook(Book Book);

	public int updateBook(@Param("bid") String bid, @Param("bname") String bname, @Param("author") String author,
			@Param("publishment") String publishment, @Param("isbn") String isbn, @Param("buytime") String buytime,
			@Param("price") String price, @Param("status") String status);

	public int deleteBook(@Param("bid") String bid);

	public int bookCountSameId(@Param("bid") String bid);

	public Book selectBookById(String bid);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	public List<Book> findBooksByWord(@Param("word") String word, @Param("start") int start, @Param("size") int size);

	public int findBooksByWordCount(@Param("word") String word);
}
