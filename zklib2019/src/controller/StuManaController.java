package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Student;
import pojo.PageBean;
import service.StudentService;

@Controller
public class StuManaController {
	@Autowired
	private StudentService studentService;

	/**
	 * to studentCrud.jsp
	 */
	@RequestMapping("/toStudentCrud.action")
	public String toStudentCrud() {
		return "manager/studentCrud";
	}

	/**
	 * 表格显示所有数据
	 */
	@RequestMapping("/studentList.action")
	public String list(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model) {
		model.addAttribute("pagemsg", studentService.findByPage(currentPage));// 回显分页数据
		return "manager/studentCrud";
	}

	/**
	 * crud添加新学生
	 */
	@RequestMapping(value = "/createStudent.action")
	@ResponseBody
	public String createStudent(@RequestParam("sid") String sid, @RequestParam("spwd") String spwd,
			@RequestParam("sname") String sname, @RequestParam("age") String age, @RequestParam("gender") String gender,
			@RequestParam("lesson") String lesson, @RequestParam("department") String department,
			@RequestParam("permitted") String permitted) {
		Boolean boo = studentService.addStudent(sid, spwd, sname, age, gender, lesson, department, permitted);
		if (boo == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 通过sid寻找学生
	 */
	@RequestMapping("/getStudentById.action")
	@ResponseBody
	public Student getStudentById(String sid) {
		Student student = studentService.getStudentById(sid);
		return student;
	}

	/**
	 * 通过输入框查找学生
	 */
	@RequestMapping("/findStudentById.action")
	public String findStudentById(@RequestParam("sid") String sid,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		PageBean<Student> students = studentService.findStudentById(currentPage, sid);
		model.addAttribute("pagemsg", students);// 回显分页数据
		return "manager/studentCrud";
	}

	/**
	 * 更新学生
	 */
	@RequestMapping("/updateStudent.action")
	@ResponseBody
	public String studentUpdate(@RequestParam("sid") String sid, @RequestParam("spwd") String spwd,
			@RequestParam("sname") String sname, @RequestParam("age") String age, @RequestParam("gender") String gender,
			@RequestParam("lesson") String lesson, @RequestParam("department") String department,
			@RequestParam("permitted") String permitted) {
		Boolean bl = studentService.updateStudent(sid, spwd, sname, age, gender, lesson, department, permitted);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除学生
	 */
	@RequestMapping("/deleteStudent.action")
	@ResponseBody
	public String studentDelete(@RequestParam("sid") String sid) {
		Boolean bl = studentService.deleteStudent(sid);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
