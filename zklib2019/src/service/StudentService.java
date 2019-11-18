package service;

import pojo.Student;
import pojo.Amerce;
import pojo.Book;
import pojo.Borrow;
import pojo.Orderlist;
import pojo.PageBean;

public interface StudentService {
	public Student findStudent(String sid, String spwd);

	public Student getStudentById(String sid);

	public boolean isExistId(String sid);

	public PageBean<Student> findByPage(int currentPage);

	public boolean addStudent(String sid, String spwd, String sname, String age, String gender, String lesson,
			String department, String permitted);

	public boolean updateStudent(String sid, String spwd, String sname, String age, String gender, String lesson,
			String department, String permitted);

	public boolean deleteStudent(String sid);

	public PageBean<Student> findStudentById(int currentPage, String sid);
	
	public PageBean<Book> findBooksByWord(int currentPage, String word);
	
	public PageBean<Borrow> getBorrowBySid(int currentPage, String sid);
	
	public PageBean<Borrow> getAllBorrowBySid(int currentPage, String sid);
	
	public PageBean<Amerce> getAmerceBySid(int currentPage, String sid);
	
	public PageBean<Orderlist> getOrderBySid(int currentPage, String sid);
	
	public Boolean again(String borrow_id);
	
	public Boolean lostBook(String borrow_id, String bid, String sid);
	
	public Boolean isOrder(String bid, String status, String sid);
}
