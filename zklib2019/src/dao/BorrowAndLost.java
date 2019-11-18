package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.Amerce;
import pojo.Borrow;
import pojo.Orderlist;

public interface BorrowAndLost {
	@Select("select again from borrow where borrow_id = #{borrow_id}")
	public String getBorrowAgain(@Param("borrow_id") String borrow_id);

	@Update("update borrow set again = #{again} where borrow_id = #{borrow_id}")
	public int updateBorrowAgain(@Param("borrow_id") String borrow_id, @Param("again") String again);

	@Select("select start from borrow where borrow_id = #{borrow_id}")
	public String getBorrowStart(@Param("borrow_id") String borrow_id);

	@Select("select end from borrow where borrow_id = #{borrow_id}")
	public String getBorrowEnd(@Param("borrow_id") String borrow_id);

	@Update("update borrow set start = #{start} where borrow_id = #{borrow_id}")
	public int updateBorrowStart(@Param("borrow_id") String borrow_id, @Param("start") String start);

	@Update("update borrow set end = #{end} where borrow_id = #{borrow_id}")
	public int updateBorrowEnd(@Param("borrow_id") String borrow_id, @Param("end") String end);

	@Delete("delete from borrow where borrow_id = #{borrow_id}")
	public int deleteBorrowById(@Param("borrow_id") String borrow_id);

	@Update("update book set status = #{status} where bid = #{bid}")
	public int updateBookStatus(@Param("bid") String bid, @Param("status") String status);

	@Insert("insert into amerce(amerce_id, borrow_id, sid, item, money, ispay, paytime) values(#{amerce_id},#{borrow_id},#{sid},#{item},#{money},#{ispay},#{paytime})")
	public int insertAmerceByLost(@Param("amerce_id") String amerce_id, @Param("borrow_id") String borrow_id,
			@Param("sid") String sid, @Param("item") String item, @Param("money") String money,
			@Param("ispay") String ispay, @Param("paytime") String paytime);
	
	@Update("update borrow set deal = #{deal} where borrow_id = #{borrow_id}")
	public int updateBorrowDeal(@Param("borrow_id") String borrow_id, @Param("deal") String deal);
	
	@Select("select price from book where bid = #{bid}")
	public String getBookPrice(@Param("bid") String bid);
	
	@Select("select borrow_id from borrow where bid = #{bid}")
	public String isBorrowExistId(@Param("bid") String bid);
}
