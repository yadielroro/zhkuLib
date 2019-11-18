package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import pojo.Notice;
import pojo.Student;
import service.BookService;
import service.NoticeService;
import service.StudentService;

@Controller
public class StudentController {
	// 依赖注入
	@Autowired
	private StudentService studentService;
	@Autowired
	private BookService bookService;
	@Autowired
	private NoticeService noticeService;

	/**
	 * 根据sid获得當前的借阅记录
	 */
	@RequestMapping(value = "/nowBorrow.action")
	public String nowBorrow(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model, HttpSession session) {
		String sid = (String) session.getAttribute("sid");
		model.addAttribute("pagemsg", studentService.getBorrowBySid(currentPage, sid));// 回显分页数据
		return "student/currentBorrow";
	}

	/**
	 * 根据sid获得所有的借阅记录
	 */
	@RequestMapping(value = "/historyBorrow.action")
	public String historyBorrow(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			HttpSession session, Model model) {
		String sid = (String) session.getAttribute("sid");
		model.addAttribute("pagemsg", studentService.getAllBorrowBySid(currentPage, sid));// 回显分页数据
		return "student/historyBorrow";
	}

	/**
	 * 根据sid获得"丢失图书"记录
	 */
	@RequestMapping(value = "/amerceList.action")
	public String amerceList(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			HttpSession session, Model model) {
		String sid = (String) session.getAttribute("sid");
		model.addAttribute("pagemsg", studentService.getAmerceBySid(currentPage, sid));// 回显分页数据
		return "student/amerceList";
	}

	/**
	 * 根据sid获得预约记录
	 */
	@RequestMapping(value = "/orderList.action")
	public String orderList(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			HttpSession session, Model model) {
		String sid = (String) session.getAttribute("sid");
		model.addAttribute("pagemsg", studentService.getOrderBySid(currentPage, sid));// 回显分页数据
		return "student/orderList";
	}

	/**
	 * 前往资讯页面
	 */
	@RequestMapping(value = "/toService.action")
	public String toService(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model) {
		model.addAttribute("pagemsg", noticeService.findByPage(currentPage));// 回显分页数据
		return "student/service";
	}

	/**
	 * 根据sid获得预约记录
	 */
	@RequestMapping(value = "/findNoticeByWord.action")
	public String findNoticeByWord(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam("word") String word, Model model) {
		model.addAttribute("pagemsg", noticeService.findByPageByWord(currentPage, word));// 回显分页数据
		return "student/service";
	}

	/**
	 * ajax查看布告内容
	 */
	@RequestMapping("/getContentById.action")
	@ResponseBody
	public Notice getContentById(@RequestParam("nid") String nid, HttpServletResponse response) {
		Notice notice = noticeService.getNoticeById(nid);
		response.setHeader("Content-type", "application/json");
		return notice;
	}

	/**
	 * 續借
	 */
	@RequestMapping("/again.action")
	@ResponseBody
	public String again(@RequestParam("borrow_id") String borrow_id, HttpServletResponse response) {
		System.out.println("into again");
		Boolean bl = studentService.again(borrow_id);
		System.out.println("studentService.again bl is" + bl);
		if (bl == true) {
			return "OK";
		} else {
			return "failed";
		}
	}

	/**
	 * 挂失
	 */
	@RequestMapping("/lostBook.action")
	@ResponseBody
	public String lost(@RequestParam("borrow_id") String borrow_id, @RequestParam("bid") String bid,
			@RequestParam("sid") String sid) {
		Boolean bl = studentService.lostBook(borrow_id, bid, sid);
		if (bl == true) {
			return "OK";
		} else {
			return "failed";
		}
	}

	/**
	 * 预约图书页面
	 */
	@RequestMapping("/orderBook.action")
	public String orderBook() {
		return "student/orderBook";
	}

	/**
	 * 查找预约的图书
	 */
	@RequestMapping("/findOrderBook")
	public String findOrderBook(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam("word") String word, Model model) {
		model.addAttribute("pagemsg", studentService.findBooksByWord(currentPage, word));// 回显分页数据
		return "student/orderBook";
	}

	/**
	 * 进行预约操作
	 */
	@RequestMapping("/isOrder.action")
	@ResponseBody
	public String isOrder(@RequestParam("bid") String bid, @RequestParam("status") String status, HttpSession session) {
		String sid = (String) session.getAttribute("sid");
		Boolean bl = studentService.isOrder(bid, status, sid);
		if (bl == true) {
			return "OK";
		} else {
			return "failed";
		}
	}
}
