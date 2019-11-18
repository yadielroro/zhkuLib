package interceptor;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/*
 * 编码拦截器
 * */
public class CharacterInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		return false;
	}
	
	class CharacterRequest extends HttpServletRequestWrapper{

		private HttpServletRequest request;

		public CharacterRequest(HttpServletRequest request) {
			super(request);
			// TODO Auto-generated constructor stub
			this.request=request;
		}
		public String getParameter(String name){
			String value = super.getParameter(name);
			if(value==null){
				return null;
			}
			String method = super.getMethod();
			if("get".equalsIgnoreCase(method)){
				try{
					value = new String(value.getBytes("iso-8859-1"),"utf-8");
				}catch(UnsupportedEncodingException e){
					throw new RuntimeException(e);
				}
			}
			return value;
		}
	}

}
