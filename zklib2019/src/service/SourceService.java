package service;

import pojo.Source;
import pojo.PageBean;

public interface SourceService {
	public Source getSourceById(String souid);

	public boolean isExistId(String souid);

	public PageBean<Source> findByPage(int currentPage);

	public boolean addSource(String souid, String mid, String ssum, String saddress, String sformat);

	public boolean updateSource(String souid, String mid, String ssum, String saddress, String sformat);

	public boolean deleteSource(String souid);

	public PageBean<Source> findSourceById(int currentPage, String souid);
	
	public PageBean<Source> findSourceByWord(int currentPage, String word);
}
