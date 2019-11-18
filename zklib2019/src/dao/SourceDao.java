package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import pojo.Source;

public interface SourceDao {

	public Source getSourceById(String souid);

	public Source isExistId(String souid);

	public List<Source> findAllSource();

	public int sourceCount();

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from source limit #{start},#{size}")
	List<Source> findByPage(@Param("start") int start, @Param("size") int size);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from source where souid=#{souid} limit #{start},#{size}")
	List<Source> findByPageById(@Param("souid") String souid, @Param("start") int start, @Param("size") int size);

	public int addSource(Source source);

	public int updateSource(@Param("souid") String souid, @Param("mid") String mid, @Param("ssum") String ssum,
			@Param("saddress") String saddress, @Param("sformat") String sformat);

	public int deleteSource(@Param("souid") String souid);

	public int sourceCountSameId(@Param("souid") String souid);
	
	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	public List<Source> findSourceByWord(@Param("word") String word, @Param("start") int start, @Param("size") int size);
	
	public int sourceCountSameWord(@Param("word") String word);
}
