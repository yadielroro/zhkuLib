package service;

import pojo.Notice;
import pojo.PageBean;

public interface NoticeService {
	public Notice getNoticeById(String nid);

	public boolean isExistId(String nid);

	public PageBean<Notice> findByPage(int currentPage);

	public boolean addNotice(String nid, String mid, String nsum, String ndate, String ncontent, String npic);

	public boolean updateNotice(String nid, String mid, String nsum, String ndate, String ncontent, String npic);

	public boolean deleteNotice(String nid);

	public PageBean<Notice> findNoticeById(int currentPage, String nid);
	
	public String getContentById(String nid);
	
	public PageBean<Notice> findByPageByWord(int currentPage, String word);
}
