package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import pojo.Student;
import pojo.Student;

public interface StudentDao {
	public Student findStudent(@Param("sid") String sid, @Param("spwd") String spwd);

	public Student getStudentById(String sid);

	public Student isExistId(String sid);

	public List<Student> findAllStudnet();

	public int studentCount();

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from student limit #{start},#{size}")
	List<Student> findByPage(@Param("start") int start, @Param("size") int size);

	/**
	 * 分页操作，调用findByPage limit分页方法
	 */
	@Select("select * from Student where sid=#{sid} limit #{start},#{size}")
	List<Student> findByPageById(@Param("sid") String sid, @Param("start") int start, @Param("size") int size);

	public int addStudent(Student Student);

	public int updateStudent(@Param("sid") String sid, @Param("spwd") String spwd, @Param("sname") String sname,
			@Param("age") String age, @Param("gender") String gender, @Param("lesson") String lesson,
			@Param("department") String department, @Param("permitted") String permitted);

	public int deleteStudent(@Param("sid") String sid);

	public int studentCountSameId(@Param("sid") String sid);
	
	@Insert("insert into orderlist(order_id, sid, bid, endtime) values(#{order_id}, #{sid}, #{bid}, #{endtime})")
	public int insertOrder(@Param("order_id") String order_id, @Param("sid") String sid, @Param("bid") String bid, @Param("endtime") String endtime);
}
