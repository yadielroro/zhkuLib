package service.Impl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pojo.Student;
import pojo.Amerce;
import pojo.Book;
import pojo.Borrow;
import pojo.Orderlist;
import pojo.PageBean;
import service.StudentService;
import utils.DateUtil;
import dao.BookDao;
import dao.BorrowAndLost;
import dao.StudentDao;
import dao.BraDao;

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private BookDao bookDao;
	@Autowired
	private BraDao braDao;
	@Autowired
	private BorrowAndLost bat;

	@Override
	public Student findStudent(String sid, String spwd) {
		Student student = this.studentDao.findStudent(sid, spwd);
		return student;
	}

	@Override
	public boolean addStudent(String sid, String spwd, String sname, String age, String gender, String lesson,
			String department, String permitted) {
		// TODO Auto-generated method stub
		// String permitted = "1";
		Student student = new Student(sid, spwd, sname, age, gender, lesson, department, permitted);
		studentDao.addStudent(student);
		Student m = studentDao.isExistId(student.getSid());
		if (m != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateStudent(String sid, String spwd, String sname, String age, String gender, String lesson,
			String department, String permitted) {
		String old_spwd = studentDao.getStudentById(sid).getSpwd();
		studentDao.updateStudent(sid, spwd, sname, age, gender, lesson, department, permitted);
		String new_spwd = studentDao.getStudentById(sid).getSpwd();
		if (old_spwd != new_spwd) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean deleteStudent(String sid) {
		System.out.println(sid);
		int isDelete = studentDao.deleteStudent(sid);
		System.out.println(isDelete);
		if (isDelete != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isExistId(String sid) {
		// TODO Auto-generated method stub
		Student student = studentDao.isExistId(sid);
		if (student != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageBean<Student> findByPage(int currentPage) {
		PageBean<Student> pageBean = new PageBean<Student>();

		// 封装当前页数
		pageBean.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = studentDao.studentCount();
		pageBean.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());

		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Student> lists = studentDao.findByPage(start, size);
		pageBean.setLists(lists);
		System.out.println(lists);
		return pageBean;
	}

	@Override
	public Student getStudentById(String sid) {
		System.out.println("sid：" + sid);
		System.out.println("studentDao:" + studentDao);
		Student student = studentDao.getStudentById(sid);
		System.out.println("student:" + student);
		System.out.println(studentDao.getStudentById(sid).getClass().getName());
		return student;
	}

	@Override
	public PageBean<Student> findStudentById(int currentPage, String sid) {
		PageBean<Student> pageBean = new PageBean<Student>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = studentDao.studentCountSameId(sid);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Student> lists = studentDao.findByPageById(sid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public PageBean<Book> findBooksByWord(int currentPage, String word) {
		System.out.println("in findBooksByWord");
		PageBean<Book> pageBean = new PageBean<Book>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = bookDao.findBooksByWordCount(word);
		System.out.println("totalCount:" + totalCount);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		System.out.println("size:" + size);
		List<Book> lists = bookDao.findBooksByWord(word, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public PageBean<Borrow> getBorrowBySid(int currentPage, String sid) {
		PageBean<Borrow> pageBean = new PageBean<Borrow>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = braDao.getBorrowBySidCount(sid, "0");
		System.out.println("totalCount:" + totalCount);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		System.out.println("size:" + size);
		List<Borrow> lists = braDao.getBorrowBySid(sid, "0", start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public PageBean<Borrow> getAllBorrowBySid(int currentPage, String sid) {
		PageBean<Borrow> pageBean = new PageBean<Borrow>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = braDao.getAllBorrowBySidCount(sid);
		System.out.println("totalCount:" + totalCount);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		System.out.println("size:" + size);
		List<Borrow> lists = braDao.getAllBorrowBySid(sid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public PageBean<Amerce> getAmerceBySid(int currentPage, String sid) {
		PageBean<Amerce> pageBean = new PageBean<Amerce>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = braDao.getAmerceBySidCount(sid);
		System.out.println("totalCount:" + totalCount);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		System.out.println("size:" + size);
		List<Amerce> lists = braDao.getAmerceBySid(sid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public PageBean<Orderlist> getOrderBySid(int currentPage, String sid) {
		System.out.println("into getOrderBySid" + "|sid=" + sid);
		PageBean<Orderlist> pageBean = new PageBean<Orderlist>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = braDao.getOrderBySidCount(sid);
		System.out.println("totalCount:" + totalCount);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		System.out.println("size:" + size);
		List<Orderlist> lists = braDao.getOrderBySid(sid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public Boolean again(String borrow_id) {
		String again = bat.getBorrowAgain(borrow_id);
		if (again == "1") {
			return false;
		} else {
			bat.updateBorrowAgain(borrow_id, "1");
			String start = bat.getBorrowEnd(borrow_id);
			String end = DateUtil.addSomeDay(start, 30);
			bat.updateBorrowStart(borrow_id, start);
			bat.updateBorrowEnd(borrow_id, end);
			return true;
		}
	}

	@Override
	public Boolean lostBook(String borrow_id, String bid, String sid) {
		bat.updateBorrowDeal(borrow_id, "1");
		bat.updateBookStatus(bid, "2");// 2表示丢失
		String money = bat.getBookPrice(bid);
		Calendar rightNow = Calendar.getInstance();
		String amerce_id = DateUtil.newId(rightNow);
		bat.insertAmerceByLost(amerce_id, borrow_id, sid, "丢失图书", money, "0", "0");
		return true;
	}

	@Override
	public Boolean isOrder(String bid, String status, String sid) {
		Boolean flag;
		String borrow_id = bat.isBorrowExistId(bid);
		if (borrow_id != null) {
			flag = false;
		} else {
			flag = true;
		}
		if (status.equals("1")) {
			return false;
		} else if (flag) {
			return false;
		} else {
			Calendar rightNow = Calendar.getInstance();
			String order_id = DateUtil.newId(rightNow);
			String date = DateUtil.getDateString(rightNow);
			String endtime = DateUtil.addSomeDay(date, 30);
			studentDao.insertOrder(order_id, sid, bid, endtime);
			return true;
		}
	}
}
