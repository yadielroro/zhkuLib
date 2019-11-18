package service;

import java.util.List;

import pojo.Amerce;
import pojo.Book;
import pojo.Manager;
import pojo.PageBean;

public interface ManagerService {
	public Manager getManagerById(String mid);

	public Manager findManager(String mid, String mpwd);

	public boolean isExistId(String mid);

	public PageBean<Manager> findByPage(int currentPage);

	public boolean addManager(String mid, String mpwd);

	public boolean updateManager(String mid, String mpwd);

	public boolean deleteManager(String mid);

	public PageBean<Manager> findManagerById(int currentPage, String mid);

	public String canBorrow(String sid, String bid);
	
	public String canReturn(String bid);
	
	public PageBean<Amerce> findAllAmerceByPage(int currentPage);
	
	public PageBean<Amerce> findAmerceById(int currentPage, String sid);
	
	public Boolean pay(String amerce_id);
	
	public String getManagerMlevel(String mid);
}
