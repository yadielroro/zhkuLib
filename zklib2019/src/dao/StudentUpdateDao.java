package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Student;

public interface StudentUpdateDao {
	public void updateStudent(@Param("oldPwd") String oldPwd, @Param("newPwd") String newPwd);
}
