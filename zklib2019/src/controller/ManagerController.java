package controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Manager;
import pojo.PageBean;
import pojo.Student;
import service.ManagerService;
import service.StudentService;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;

	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/mlogin.action")
	public String mlogin(@RequestParam("mid") String mid, @RequestParam("mpwd") String mpwd, Model model,
			HttpSession session) {
		// 通过账号和密码查询用户
		Manager manager = managerService.findManager(mid, mpwd);
		if (manager != null) {
			// 将管理员账号添加到Session
			session.setAttribute("MANAGER_SESSION", manager);
			session.setAttribute("Mid", manager.getMid());
			// 跳转到主页面
			String level = managerService.getManagerMlevel(mid);
			if(level.equals("1")){
			return "manager/main";}else{return "manager/mainOrdinary";}
		} else {
			model.addAttribute("msg", "账号或密码错误，请重新输入！");
			// 返回到登录页面
			return "manager/mlogin";
		}
	}

	/**
	 * 添加新普通管理员
	 */
	@RequestMapping(value = "/addManager.action")
	public String addManager(@RequestParam("mid") String mid, @RequestParam("mpwd") String mpwd, Model model,
			HttpSession session) {
		// 通过账号和密码查询用户
		Boolean boo = managerService.addManager(mid, mpwd);
		if (boo == true) {
			model.addAttribute("msg", "新管理员" + mid + "插入成功！");
		} else {
			model.addAttribute("msg", mid + "已经存在，插入不成功！");
		}
		return "manager/main";
	}

	/**
	 * 添加新普通管理员ajax
	 */
	@RequestMapping("/isExistId.action")
	public void isExistName(@RequestParam("mid") String mid, HttpServletResponse response) throws IOException {
		if (managerService.isExistId(mid)) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}

	/**
	 * to main.jsp
	 */
	@RequestMapping("/toManagerMain.action")
	public String toMain() {
		return "manager/main";
	}

	/**
	 * to managerCrud.jsp
	 */
	@RequestMapping("/toManagerCrud.action")
	public String toManagerCrud() {
		return "manager/managerCrud";
	}

	/**
	 * 表格显示所有数据
	 */
	@RequestMapping("/list.action")
	public String list(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model) {
		model.addAttribute("pagemsg", managerService.findByPage(currentPage));// 回显分页数据
		return "manager/managerCrud";
	}

	/**
	 * crud添加新普通管理员
	 */
	@RequestMapping(value = "/createManager.action")
	@ResponseBody
	public String createManager(@RequestParam("mid") String mid, @RequestParam("mpwd") String mpwd) {
		Boolean boo = managerService.addManager(mid, mpwd);
		if (boo == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 通过mid寻找管理员
	 */
	@RequestMapping("/getManagerById.action")
	@ResponseBody
	public Manager getManagerById(String mid) {
		Manager manager = managerService.getManagerById(mid);
		return manager;
	}

	/**
	 * 通过输入框查找管理员
	 */
	@RequestMapping("/findManagerById.action")
	public String findManagerById(@RequestParam("mid") String mid,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		PageBean<Manager> managers = managerService.findManagerById(currentPage, mid);
		model.addAttribute("pagemsg", managers);// 回显分页数据
		return "manager/managerCrud";
	}

	/**
	 * 更新管理员
	 */
	@RequestMapping("/updateManager.action")
	@ResponseBody
	public String managerUpdate(@RequestParam("mid") String mid, @RequestParam("mpwd") String mpwd) {
		Boolean bl = managerService.updateManager(mid, mpwd);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除管理员
	 */
	@RequestMapping("/deleteManager.action")
	@ResponseBody
	public String managerDelete(@RequestParam("mid") String mid) {
		Boolean bl = managerService.deleteManager(mid);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 借阅图书
	 */
	@RequestMapping(value = "/borrow.action")
	@ResponseBody
	public String borrow(@RequestParam("sid") String sid, @RequestParam("bid") String bid) {
		String msg = managerService.canBorrow(sid, bid);
		System.out.println(msg);
		return msg;
	}

	/**
	 * 归还图书
	 */
	@RequestMapping(value = "/returns.action")
	@ResponseBody
	public String returns(@RequestParam("bid") String bid) {
		String msg = managerService.canReturn(bid);
		System.out.println(msg);
		return msg;
	}

	/**
	 * 罚款管理
	 */
	@RequestMapping(value = "/amerce.action")
	public String amerce(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model) {
		model.addAttribute("pagemsg", managerService.findAllAmerceByPage(currentPage));// 回显分页数据
		return "manager/amerceCrud";
	}
	
	/**
	 * 根据sid查找的罚款记录
	 */
	@RequestMapping(value = "/getAmerceBySid.action")
	public String getAmerceBySid(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model, @RequestParam("sid")String sid) {
		model.addAttribute("pagemsg", managerService.findAmerceById(currentPage,sid));// 回显分页数据
		return "manager/amerceCrud";
	}
	
	/**
	 * 删除管理员
	 */
	@RequestMapping("/pay.action")
	@ResponseBody
	public String pay(@RequestParam("amerce_id") String amerce_id) {
		Boolean bl = managerService.pay(amerce_id);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

}
