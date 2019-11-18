package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.sf.json.JSONArray;
import pojo.Book;
import pojo.Manager;
import pojo.PageBean;
import pojo.Student;
import service.BookService;
import service.ManagerService;
import service.RegisterService;
import service.SourceService;
import service.StudentService;

@Controller
public class MainController {
	// 依赖注入
	@Autowired
	private StudentService studentService;
	@Autowired
	private RegisterService registerService;
	@Autowired
	private BookService bookService;
	@Autowired
	private SourceService sourceService;

	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action")
	public String login(@RequestParam("sid") String sid, @RequestParam("spwd") String spwd,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model,
			HttpSession session) {
		System.out.println("into login");
		// 通过账号和密码查询用户
		Student student = studentService.findStudent(sid, spwd);
		if (student != null) {
			// 将用户账号添加到Session
			session.setAttribute("STUDENT_SESSION", student);
			session.setAttribute("uname", student.getSname());
			session.setAttribute("sid", student.getSid());
			session.setAttribute("spwd", student.getSpwd());
			model.addAttribute("pagemsg", studentService.getBorrowBySid(currentPage, sid));// 回显分页数据
			return "student/currentBorrow";
		} else {
			model.addAttribute("msg", "账号或密码错误，请重新输入！");
			// 返回到登录页面
			return "student/main";
		}
	}
	
	/**
	 * 用户注册
	 */
	@RequestMapping(value = "/register.action", method = RequestMethod.POST)
	public String register(@RequestParam("sid") String sid, @RequestParam("spwd") String spwd,
			@RequestParam("sname") String sname) {
		Student student = new Student();
		String permitted = "1";
		student.setSid(sid);
		student.setSpwd(spwd);
		;
		student.setSname(sname);
		student.setPermitted(permitted);
		registerService.insertStudent(student);
		return "main";
	}

	/**
	 * 访问概况
	 */
	@RequestMapping(value = "/toSummary.action")
	public String toSummary(HttpSession session, Model model) {
		String un = (String) session.getAttribute("uname");
		model.addAttribute("uname", un);
		return "student/summary";
	}

	/**
	 * 返回首页
	 */
	@RequestMapping(value = "/toMain.action")
	public String toStudent() {
		return "student/main";
	}

	/**
	 * 注销用户
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		// 清除Session
		session.invalidate();
		// 回到首页
		return "student/main";
	}

	/**
	 * 账号信息
	 */
	@RequestMapping(value = "/toInformation.action")
	public String toInformation(HttpSession session, Model model) {
		Student s = (Student) session.getAttribute("STUDENT_SESSION");
		model.addAttribute("sid", s.getSid());
		model.addAttribute("spwd", s.getSpwd());
		model.addAttribute("sname", s.getSname());
		model.addAttribute("age", s.getAge());
		model.addAttribute("gender", s.getGender());
		model.addAttribute("lesson", s.getLesson());
		model.addAttribute("department", s.getDepartment());
		// 如果字符串相等则返回值为0
		String permitted = (s.getPermitted() == "1") ? "不可借阅" : "可以借阅";
		model.addAttribute("permitted", permitted);
		return "student/studentInformation";
	}

	/**
	 * 修改密码
	 */
	@RequestMapping(value = "/changePwd.action")
	public String changePwd(@RequestParam("oldPwd") String oldPwd, @RequestParam("newPwd") String newPwd) {

		return "student/main";
	}

	/**
	 * 书库
	 */
	@RequestMapping(value = "/toAllBook.action")
	public String toAllBook(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model, HttpSession session) {
		System.out.println("toAllBook");
		session.getAttribute("uname");
		model.addAttribute("pagemsg", bookService.findByPage(currentPage));// 回显分页数据
		return "student/allBook";
	}

	/**
	 * 首页检索图书
	 */
	@RequestMapping(value = "/searchBook.action")
	public String toSearchBook(@RequestParam("word") String word, Model model) {
		model.addAttribute("pagemsg", bookService.selectByAny(word));
		return "student/showBook";
	}

	/**
	 * ajax检索图书
	 */
	@RequestMapping(value = "/ajax1.action")
	public void ajax(@RequestParam("word") String word, HttpServletResponse response) throws IOException {
		System.out.println("已经成功进入AjaxController");
		List<String> blist = bookService.selectByName(word);
		System.out.println(blist.toString());
		// 把list实体封装到json对象中
		JSONArray jArray = JSONArray.fromObject(blist);
		// 向客户端输出json对象
		System.out.println("json" + "jArray.toString():" + jArray.toString());
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(jArray.toString());
	}

	/**
	 * 资源
	 */
	@RequestMapping(value = "/toResource.action")
	public String toResource(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model) {
		model.addAttribute("pagemsg", sourceService.findByPage(currentPage));// 回显分页数据
		return "student/resource";
	}

	/**
	 * 根据ssum输入框模糊搜索资源
	 */
	@RequestMapping(value = "/findSourceByWord.action")
	public String findSourceByWord(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam("word") String word, Model model) {
		model.addAttribute("pagemsg", sourceService.findSourceByWord(currentPage, word));// 回显分页数据
		return "student/resource";
	}

	/**
	 * 添加新资源的信息补充
	 */
	@RequestMapping(value = "/addSource.action")
	@ResponseBody
	public String addSource(@RequestParam("souid") String souid, @RequestParam("mid") String mid,
			@RequestParam("ssum") String ssum, @RequestParam("saddress") String saddress,
			@RequestParam("sformat") String sformat) {
		Boolean boo = sourceService.addSource(souid, mid, ssum, saddress, sformat);
		if (boo == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 文件上传
	 */
	@RequestMapping(value = "/upload.action", produces = "text/html;charset=utf-8")
	public String upload(@RequestParam("file") CommonsMultipartFile partFile, HttpServletRequest request, Model model)
			throws IOException {
		try {
			String path = request.getServletContext().getRealPath("/upload");
			// String name = request.getParameter("name");
			// System.out.println(name);
			System.out.println(path);// 这个临时文件的路径
			String filename = partFile.getOriginalFilename();
			System.out.println(filename);// 文件的名字
			File file = new File(path + "/" + filename);
			InputStream inputStream = partFile.getInputStream();
			FileUtils.copyInputStreamToFile(inputStream, file);
			if (inputStream != null) {
				inputStream.close();
			}
			System.out.println("文件上传成功！");
			return "student/resource";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("文件上传失败！");
			return "student/resource";
		}
	}

	/**
	 * 文件下载
	 */
	@RequestMapping(value = "/download.action")
	@ResponseBody
	public void download(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("saddress") String saddress, @RequestParam("sformat") String sformat, Model model)
			throws IOException {
		String path = request.getServletContext().getRealPath("/upload");
		String fn = path + "\\" + saddress + "." + sformat;
		System.out.println("fn:" + fn);
		try {
			File file = new File(fn);
			if (!file.exists()) {
				model.addAttribute("message", "您要下载的资源已被删除！！");
				System.out.println("您要下载的资源已被删除！！");
				// return "student/resource";
				return;
			}
			String name = file.getName();
			response.addHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(name, "utf-8"));
			// response.setContentType("multipart/form-data");
			// FileUtils.copyFile(file, response.getOutputStream());
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(fn);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		} catch (Exception e) {

		}
		System.out.println("next-OK");
		// return "OK";
		// return "student/resource";
	}

	/**
	 * 书库：通过输入框查找图书
	 */
	@RequestMapping("/getBooksByWord.action")
	public String getBooksByWord(@RequestParam("word") String word,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		System.out.println("word:" + word);
		PageBean<Book> book = studentService.findBooksByWord(currentPage, word);
		model.addAttribute("pagemsg", book);// 回显分页数据
		model.addAttribute("word", word);
		return "student/showBook";
	}

}
