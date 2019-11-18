package service.Impl;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pojo.Notice;
import pojo.PageBean;
import service.NoticeService;
import dao.NoticeDao;

@Service("noticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public boolean addNotice(String nid, String mid, String nsum, String ndate, String ncontent, String npic) {
		// TODO Auto-generated method stub
		// String permitted = "1";
		Notice notice = new Notice(nid, mid, nsum, ndate, ncontent, npic);
		int i = noticeDao.addNotice(notice);
		Notice m = noticeDao.isExistId(notice.getNid());
		if (m != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateNotice(String nid, String mid, String nsum, String ndate, String ncontent, String npic) {
		String old_sum = noticeDao.getNoticeById(nid).getNsum();
		int i = noticeDao.updateNotice(nid, mid, nsum, ndate, ncontent, npic);
		String new_sum = noticeDao.getNoticeById(nid).getNsum();
		if (old_sum != new_sum) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean deleteNotice(String nid) {
		System.out.println(nid);
		int isDelete = noticeDao.deleteNotice(nid);
		System.out.println(isDelete);
		if (isDelete != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isExistId(String nid) {
		// TODO Auto-generated method stub
		Notice notice = noticeDao.isExistId(nid);
		if (notice != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageBean<Notice> findByPage(int currentPage) {
		PageBean<Notice> pageBean = new PageBean<Notice>();

		// 封装当前页数
		pageBean.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = noticeDao.noticeCount();
		pageBean.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());

		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Notice> lists = noticeDao.findByPage(start, size);
		pageBean.setLists(lists);
		System.out.println(lists);
		return pageBean;
	}

	@Override
	public Notice getNoticeById(String nid) {
		Notice notice = noticeDao.getNoticeById(nid);
		return notice;
	}

	@Override
	public PageBean<Notice> findNoticeById(int currentPage, String nid) {
		Notice notice = this.getNoticeById(nid);
		PageBean<Notice> pageBean = new PageBean<Notice>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = noticeDao.noticeCountSameId(nid);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Notice> lists = noticeDao.findByPageById(nid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public String getContentById(String nid) {
		String ncontent = noticeDao.getContentById(nid);		
		return ncontent;
	}

	@Override
	public PageBean<Notice> findByPageByWord(int currentPage, String word) {
		PageBean<Notice> pageBean = new PageBean<Notice>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = noticeDao.findByPageByWordCount(word);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Notice> lists = noticeDao.findByPageByWord(word, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}
}
