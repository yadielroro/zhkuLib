package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.Amerce;
import pojo.Borrow;
import pojo.Orderlist;

public interface BraDao {
	public List<String> isAmerceById(String sid);

	public int addBorrow(@Param("borrow_id") String borrow_id, @Param("sid") String sid, @Param("bid") String bid,
			@Param("start") String start, @Param("end") String end, @Param("again") String again,
			@Param("deal") String deal);

	public int updateBookStatus(@Param("bid") String bid, @Param("status") String status);

	public int updateBorrowDeal(@Param("bid") String bid, @Param("deal") String deal);

	@Select("select end from borrow where bid = #{bid} and deal = #{deal}")
	public String getBorrowEnd(@Param("bid") String bid, @Param("deal") String deal);

	@Select("select sid from borrow where bid = #{bid} and deal = #{deal}")
	public String getBorrowSid(@Param("bid") String bid, @Param("deal") String deal);

	@Select("select borrow_id from borrow where bid = #{bid} and deal = #{deal}")
	public String getBorrowId(@Param("bid") String bid, @Param("deal") String deal);

	public String getBorrowDeal(@Param("bid") String bid);

	public int addAmerce(@Param("amerce_id") String amerce_id, @Param("borrow_id") String borrow_id,
			@Param("sid") String sid, @Param("item") String item, @Param("money") String money,
			@Param("ispay") String ispay, @Param("paytime") String paytime);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from amerce limit #{start},#{size}")
	public List<Amerce> findAllAmerceByPage(@Param("start") int start, @Param("size") int size);

	@Select("select count(*) from amerce")
	public int amerceCount();

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from amerce where sid=#{sid} limit #{start},#{size}")
	public List<Amerce> findByPageById(@Param("sid") String sid, @Param("start") int start, @Param("size") int size);

	@Select("select count(*) from amerce where sid = #{sid}")
	public int managerCountFromId(String sid);

	@Update("update amerce set ispay = #{ispay} where amerce_id = #{amerce_id}")
	public int updateAmerceDeal(@Param("amerce_id") String amerce_id, @Param("ispay") String ispay);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from borrow where sid=#{sid} and deal = #{deal} order by borrow_id desc limit #{start},#{size}")
	public List<Borrow> getBorrowBySid(@Param("sid") String sid, @Param("deal") String deal, @Param("start") int start,
			@Param("size") int size);

	@Select("select count(*) from borrow where sid =#{sid} and deal =#{deal}")
	public int getBorrowBySidCount(@Param("sid") String sid, @Param("deal") String deal);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from borrow where sid=#{sid} order by borrow_id desc limit #{start},#{size}")
	public List<Borrow> getAllBorrowBySid(@Param("sid") String sid, @Param("start") int start, @Param("size") int size);

	@Select("select count(*) from borrow where sid =#{sid}")
	public int getAllBorrowBySidCount(@Param("sid") String sid);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from amerce where sid=#{sid} limit #{start},#{size}")
	public List<Amerce> getAmerceBySid(@Param("sid") String sid, @Param("start") int start, @Param("size") int size);

	@Select("select count(*) from amerce where sid = #{sid}")
	public int getAmerceBySidCount(String sid);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from orderlist where sid=#{sid} limit #{start},#{size}")
	public List<Orderlist> getOrderBySid(@Param("sid") String sid, @Param("start") int start, @Param("size") int size);

	@Select("select count(*) from orderlist where sid =#{sid}")
	public int getOrderBySidCount(String sid);

	@Select("select order_id from orderlist where bid = #{bid}")
	public String isOrder(@Param("bid") String bid);

	@Select("select endtime from orderlist where bid = #{bid}")
	public String getEndtime(@Param("bid") String bid);
}
