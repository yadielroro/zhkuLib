package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.PageBean;
import pojo.Source;
import service.SourceService;

@Controller
public class SourceManaController {
	@Autowired
	private SourceService sourceService;

	/**
	 * to sourceCrud.jsp
	 */
	@RequestMapping("/toSourceCrud.action")
	public String toSourceCrud() {
		return "manager/sourceCrud";
	}

	/**
	 * 表格显示所有数据
	 */
	@RequestMapping("/sourceList.action")
	public String list(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
			Model model) {
		model.addAttribute("pagemsg", sourceService.findByPage(currentPage));// 回显分页数据
		return "manager/sourceCrud";
	}

	/**
	 * crud添加新资源
	 */
	@RequestMapping(value = "/createSource.action")
	@ResponseBody
	public String createSource(@RequestParam("souid") String souid, @RequestParam("mid") String mid,
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
	 * 通过souid寻找资源
	 */
	@RequestMapping("/getSourceById.action")
	@ResponseBody
	public Source getSourceById(String souid) {
		Source source = sourceService.getSourceById(souid);
		return source;
	}

	/**
	 * 通过输入框查找资源
	 */
	@RequestMapping("/findSourceById.action")
	public String findSourceById(@RequestParam("souid") String souid,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		PageBean<Source> sources = sourceService.findSourceById(currentPage, souid);
		model.addAttribute("pagemsg", sources);// 回显分页数据
		return "manager/sourceCrud";
	}

	/**
	 * 更新资源
	 */
	@RequestMapping("/updateSource.action")
	@ResponseBody
	public String sourceUpdate(@RequestParam("souid") String souid, @RequestParam("mid") String mid,
			@RequestParam("ssum") String ssum, @RequestParam("saddress") String saddress,
			@RequestParam("sformat") String sformat) {
		Boolean bl = sourceService.updateSource(souid, mid, ssum, saddress, sformat);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除资源
	 */
	@RequestMapping("/deleteSource.action")
	@ResponseBody
	public String sourceDelete(@RequestParam("souid") String souid) {
		Boolean bl = sourceService.deleteSource(souid);
		if (bl == true) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
