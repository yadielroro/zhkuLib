package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import pojo.Notice;

public interface NoticeDao {

	public Notice getNoticeById(String nid);

	public Notice isExistId(String nid);

	public List<Notice> findAllNotice();

	public int noticeCount();

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from notice limit #{start},#{size}")
	List<Notice> findByPage(@Param("start") int start, @Param("size") int size);

	/**
	 * 分页操作，调用findByPndate limit分页方法
	 */
	@Select("select * from notice where nid=#{nid} limit #{start},#{size}")
	List<Notice> findByPageById(@Param("nid") String nid, @Param("start") int start, @Param("size") int size);

	public int addNotice(Notice notice);

	public int updateNotice(@Param("nid") String nid, @Param("mid") String mid, @Param("nsum") String nsum,
			@Param("ndate") String ndate, @Param("ncontent") String ncontent, @Param("npic") String npic);

	public int deleteNotice(@Param("nid") String nid);

	public int noticeCountSameId(@Param("nid") String nid);
	
	@Select("select ncontent from notice where nid=#{nid}")
	public String getContentById(@Param("nid") String nid);
	
	/**
	 * 分页操作，调用findByPndate limit分页方法
	 */
	@Select("select * from notice where nsum like concat('%', #{word}, '%') limit #{start},#{size}")
	public List<Notice> findByPageByWord(@Param("word") String word, @Param("start") int start, @Param("size") int size);
	
	/**
	 * 分页操作，调用findByPndate limit分页方法
	 */
	@Select("select count(*) from notice where nsum like concat('%', #{word}, '%')")
	public int findByPageByWordCount(@Param("word") String word);
}
