package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import pojo.Manager;
import pojo.Student;

/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 获取请求的URL
		String url = request.getRequestURI();
		// URL:除了登录请求外，其他的URL都进行拦截控制
		if (url.indexOf("/login.action") >= 0 || url.indexOf("/register.action") >= 0
				|| url.indexOf("/toSummary.action") >= 0 || url.indexOf("/toAllBook.action") >= 0
				|| url.indexOf("/searchBook.action") >= 0 || url.indexOf("/upload.action") >= 0
				|| url.indexOf("/download.action") >= 0 || url.indexOf("/toResource.action") >= 0
				|| url.indexOf("/ajax1.action") >= 0 || url.indexOf("/mlogin.action") >= 0
				|| url.indexOf("/getBooksByWord.action") >= 0 || url.indexOf("/findSourceByWord.action") >= 0
				|| url.indexOf("/addSource.action") >= 0|| url.indexOf("/toService.action") >= 0
				|| url.indexOf("/findNoticeByWord.action") >= 0|| url.indexOf("/toMain.action") >= 0) {
			return true;
		}
		// 获取Session
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("STUDENT_SESSION");
		Manager manager = (Manager) session.getAttribute("MANAGER_SESSION");
		// 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
		if (student != null) {
			return true;
		}
		if (manager != null) {
			return true;
		}
		// 不符合条件的给出提示信息，并转发到登录页面
		request.setAttribute("msg", "您还没有登录，请先登录！");
		if (url.indexOf("manager") >= 0) {
			request.getRequestDispatcher("/WEB-INF/jsp/student/main.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/WEB-INF/jsp/manager/main.jsp").forward(request, response);
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
