package service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.RegisterDao;
import dao.StudentDao;
import pojo.Student;
import service.RegisterService;

@Service("registerService")
@Transactional
public class RegisterServiceImpl implements RegisterService{
	@Autowired
	private RegisterDao registerDao;
	
	@Override
	public void insertStudent(Student student) {
		// TODO Auto-generated method stub
		registerDao.insertStudent(student);
	}

}
