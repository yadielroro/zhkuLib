package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import pojo.Manager;

public interface ManagerDao {
	public Manager getManagerById(String mid);
	
	public Manager findManager(@Param("mid") String mid, @Param("mpwd") String mpwd);
	
	public Manager isExistId(String mid);
	
	public List<Manager> findAllManager();
	
	public int managerCount();
	
	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from manager limit #{start},#{size}")
	List<Manager> findByPage(@Param("start")int start , @Param("size")int size);
	
	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from manager where mid=#{mid} limit #{start},#{size}")
	List<Manager> findByPageById(@Param("mid")String mid, @Param("start")int start , @Param("size")int size);
	
	public int addManager(Manager manager);
	
	public int updateManager(@Param("mid")String mid, @Param("mpwd")String mpwd);
	
	public int deleteManager(@Param("mid")String mid);
	
	public int managerCountFromId(@Param("mid")String mid);
	
	@Select("select level from manager where mid = #{mid}")
	public String getMlevel(@Param("mid") String mid);
}
