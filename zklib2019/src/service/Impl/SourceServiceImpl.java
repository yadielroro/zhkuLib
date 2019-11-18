package service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pojo.Source;
import pojo.PageBean;
import service.SourceService;
import dao.SourceDao;

@Service("sourceService")
@Transactional
public class SourceServiceImpl implements SourceService {
	@Autowired
	private SourceDao sourceDao;

	@Override
	public boolean addSource(String souid, String mid, String ssum, String saddress, String sformat) {
		// TODO Auto-generated method stub
		// String permitted = "1";
		Source source = new Source(souid, mid, ssum, saddress, sformat);
		int i = sourceDao.addSource(source);
		Source m = sourceDao.isExistId(source.getSouid());
		if (m != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateSource(String souid, String mid, String ssum, String saddress, String sformat) {
		String old_sum = sourceDao.getSourceById(souid).getSsum();
		int i = sourceDao.updateSource(souid, mid, ssum, saddress, sformat);
		String new_sum = sourceDao.getSourceById(souid).getSsum();
		if (old_sum != new_sum) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean deleteSource(String souid) {
		System.out.println(souid);
		int isDelete = sourceDao.deleteSource(souid);
		System.out.println(isDelete);
		if (isDelete != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isExistId(String souid) {
		// TODO Auto-generated method stub
		Source source = sourceDao.isExistId(souid);
		if (source != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageBean<Source> findByPage(int currentPage) {
		PageBean<Source> pageBean = new PageBean<Source>();

		// 封装当前页数
		pageBean.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = sourceDao.sourceCount();
		pageBean.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());

		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Source> lists = sourceDao.findByPage(start, size);
		pageBean.setLists(lists);
		System.out.println(lists);
		for(int i = 0;i < lists.size(); i ++){
			System.out.println(lists.get(i).getSformat());
			}
		
		return pageBean;
	}

	@Override
	public Source getSourceById(String souid) {
		Source source = sourceDao.getSourceById(souid);
		return source;
	}

	@Override
	public PageBean<Source> findSourceById(int currentPage, String souid) {
		Source source = this.getSourceById(souid);
		PageBean<Source> pageBean = new PageBean<Source>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = sourceDao.sourceCountSameId(souid);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		List<Source> lists = sourceDao.findByPageById(souid, start, size);
		pageBean.setLists(lists);
		return pageBean;
	}

	@Override
	public PageBean<Source> findSourceByWord(int currentPage, String word) {
		PageBean<Source> pageBean = new PageBean<Source>();
		// 封装当前页数
		pageBean.setCurrPage(currentPage);
		// 每页显示的数据
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int totalCount = sourceDao.sourceCountSameWord(word);
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);// 向上取整
		pageBean.setTotalPage(num.intValue());
		int start = (currentPage - 1) * pageSize;
		int size = pageBean.getPageSize();
		// 封装每页显示的数据
		System.out.println("totalCount:"+totalCount+"|word:"+word+"|start:"+start+"|size:"+size);
		List<Source> lists = sourceDao.findSourceByWord(word, start, size);
		
		pageBean.setLists(lists);
		return pageBean;
	}
}
