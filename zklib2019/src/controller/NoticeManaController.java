package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.PageBean;
import pojo.Notice;
import service.NoticeService;

@Controller
public class NoticeManaController {
	@Autowired
	private NoticeService noticeService;

	/**
	 * to noticeCrud.jsp
	 */
	@RequestMapping("/noticeCrud.action")
	public String toNoticeCrud() {
		return "manager/noticeCrud";
	}
	
	/**
	 * to noticeCrud.jsp
	 */
	@RequestMapping("/noticeList.action")
	public String list(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model) {
		model.addAttribute("pagemsg", noticeService.findByPage(currentPage));// 回显分页数据
		return "manager/noticeCrud";
	}

	/**
	 * crud添加新布告
	 */
	@RequestMapping(value = "/createNotice.action")
	@ResponseBody
	public String createNotice(@RequestParam("nid") String nid, @RequestParam("mid") String mid,
			@RequestParam("nsum") String nsum, @RequestParam("ndate") String ndate,
			@RequestParam("ncontent") String ncontent, @RequestParam("npic") String npic) {
		Boolean boo = noticeService.addNotice(nid, mid, nsum, ndate, ncontent, npic);
		if (boo == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 通过nid寻找布告
	 */
	@RequestMapping("/getNoticeById.action")
	@ResponseBody
	public Notice getNoticeById(String nid) {
		System.out.println(nid);
		Notice notice = noticeService.getNoticeById(nid);
		System.out.println(notice.getNid());
		return notice;
	}

	/**
	 * 通过输入框查找布告
	 */
	@RequestMapping("/findNoticeById.action")
	public String findNoticeById(@RequestParam("nid") String nid,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		PageBean<Notice> notices = noticeService.findNoticeById(currentPage, nid);
		model.addAttribute("pagemsg", notices);// 回显分页数据
		return "manager/noticeCrud";
	}

	/**
	 * 更新布告
	 */
	@RequestMapping("/updateNotice.action")
	@ResponseBody
	public String noticeUpdate(@RequestParam("nid") String nid, @RequestParam("mid") String mid,
			@RequestParam("nsum") String nsum, @RequestParam("ndate") String ndate,
			@RequestParam("ncontent") String ncontent, @RequestParam("npic") String npic) {
		Boolean bl = noticeService.updateNotice(nid, mid, nsum, ndate, ncontent, npic);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除布告
	 */
	@RequestMapping("/deleteNotice.action")
	@ResponseBody
	public String noticeDelete(@RequestParam("nid") String nid) {
		Boolean bl = noticeService.deleteNotice(nid);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
}
