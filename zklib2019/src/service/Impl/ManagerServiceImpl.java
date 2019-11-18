package service.Impl;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BookDao;
import dao.BraDao;
import dao.ManagerDao;
import dao.StudentDao;
import pojo.Amerce;
import pojo.Book;
import pojo.Manager;
import pojo.PageBean;
import pojo.Student;
import service.ManagerService;
import utils.DateUtil;

@Service("managerService")
@Transactional
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDao managerDao;
	@Autowired
	private BookDao bookDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private BraDao braDao;

	@Override
	public Manager findManager(String mid, String mpwd) {
		// TODO Auto-generated method stub
		Manager manager = this.managerDao.findManager(mid, mpwd);
		return manager;
	}

	@Override
	public boolean addManager(String mid, String mpwd) {
		// TODO Auto-generated method stub
		String level = "2";
		Manager manager = new Manager(mid, mpwd, level);
		int i = managerDao.addManager(manager);
		Manager m = managerDao.isExistId(manager.getMid());
		if (m != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateManager(String mid, String mpwd) {
		String old_mpwd = managerDao.getManagerById(mid).getMpwd();
		int i = managerDao.updateManager(mid, mpwd);
		String new_mpwd = managerDao.getManagerById(mid).getMpwd();
		if (old_mpwd != new_mpwd) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean deleteManager(String mid) {
		System.out.println(mid);
		int isDelete = managerDao.deleteManager(mid);
		System.out.println(isDelete);
		if (isDelete != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isExistId(String mid) {
		// TODO Auto-generated method stub
		Manager manager = managerDao.isExistId(mid);
		if (manager != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageBean<Manager> findByPage(int currentPage) {
		PageBean<Manager> pageBean = new PageBean<Manager>();

		// 封装当前页数
		pageBean.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = managerDao.managerCount();
		pageBean.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());

		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Manager> lists = managerDao.findByPage(start, size);
		pageBean.setLists(lists);

		return pageBean;
	}

	@Override
	public Manager getManagerById(String mid) {
		System.out.println("mid：" + mid);
		System.out.println("managerDao:" + managerDao);
		Manager manager = managerDao.getManagerById(mid);
		System.out.println("manager:" + manager);
		System.out.println(managerDao.getManagerById(mid).getClass().getName());
		return manager;
	}

	@Override
	public PageBean<Manager> findManagerById(int currentPage, String mid) {
		Manager manager = this.getManagerById(mid);
		PageBean<Manager> pageBean = new PageBean<Manager>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = managerDao.managerCountFromId(mid);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Manager> lists = managerDao.findByPageById(mid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public String canBorrow(String sid, String bid) {
		String msg = "OK";
		Book book = bookDao.selectBookById(bid);
		System.out.println(book.getBid() + "书号|状态" + book.getStatus());
		Student student = studentDao.getStudentById(sid);

		String endtime = braDao.getEndtime(bid);
		boolean remain = false;
		if (endtime != null) {
			System.out.println("endtime:" + endtime);
			Calendar rightNow = Calendar.getInstance();
			String now = DateUtil.getDateString(rightNow);
			System.out.println("now:" + now);
			remain = DateUtil.compare(now, endtime);
			System.out.println("remain:" + remain);
		}

		List<String> ispays = braDao.isAmerceById(sid);
		boolean flags = false;
		if (ispays != null) {
			for (int i = 0; i < ispays.size(); i++) {
				if (ispays.get(i).equals("0")) {
					flags = true;
				}
			}
		}

		if (book.getStatus().equals("0")) {
			msg = "该书尚未归库，不可借阅！";
			return msg;
		} else if (student.getPermitted().equals("0")) {
			msg = "该生没有借阅权限，不可借阅！";
			return msg;
		} else if (remain == true) {
			msg = "该书已经被预约，预约期限为" + endtime;
			return msg;
		} else if (flags) {
			msg = "该生尚有罚款未缴纳，不可借阅！";
			return msg;
		} else {
			Calendar rightNow = Calendar.getInstance();
			int day = 30;// 借阅期限为30天
			String start = DateUtil.getDateString(rightNow);
			String borrow_id = DateUtil.newId(rightNow);
			String end = DateUtil.addSomeDay(start, day);
			String again = "0";// 续借标记，“1”表示已续借，“0”表示未续借
			String deal = "1";// 借阅状态，“1”表示借阅存在，“0”表示借阅不存在
			braDao.addBorrow(borrow_id, sid, bid, start, end, again, deal);
			String status = "0";// 图书状态，“1”表示图书在库，“0”表示图书不在库
			braDao.updateBookStatus(bid, status);
			return msg;
		}

	}

	@Override
	public String canReturn(String bid) {
		// TODO Auto-generated method stub
		String sid = braDao.getBorrowSid(bid,"1");
		String borrow_id = braDao.getBorrowId(bid,"1");
		Calendar rightNow = Calendar.getInstance();
		String now = DateUtil.getDateString(rightNow);
		String end = braDao.getBorrowEnd(bid,"1");
		if (DateUtil.getDay(now, end) > 30) {
			String cost = (DateUtil.getDay(now, end) - 30) * 0.1 + " ";
			String amerce_id = DateUtil.newId(rightNow);
			braDao.addAmerce(amerce_id, borrow_id, sid, "超期罚款", cost, "0", "");
			return "超期罚款" + cost + "元，交完罚款再归还！";
		} else {
			String new_deal = "0";
			braDao.updateBorrowDeal(bid, new_deal);
			System.out.println("into updateBorrowDeal");
			String status = "1";
			braDao.updateBookStatus(bid, status);
			return "OK";
		}

	}

	@Override
	public PageBean<Amerce> findAllAmerceByPage(int currentPage) {
		PageBean<Amerce> pageBean = new PageBean<Amerce>();

		// 封装当前页数
		pageBean.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = braDao.amerceCount();
		pageBean.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());

		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Amerce> lists = braDao.findAllAmerceByPage(start, size);
		pageBean.setLists(lists);

		return pageBean;
	}

	@Override
	public PageBean<Amerce> findAmerceById(int currentPage, String sid) {
		PageBean<Amerce> pageBean = new PageBean<Amerce>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = braDao.managerCountFromId(sid);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Amerce> lists = braDao.findByPageById(sid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public Boolean pay(String amerce_id) {
		int ispay = braDao.updateAmerceDeal(amerce_id, "1");
		System.out.println(ispay);
		if (ispay != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String getManagerMlevel(String mid) {
		String level = managerDao.getMlevel(mid);
		return level;
	}

}
