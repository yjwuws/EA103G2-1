package filters;

import java.io.*;
import java.util.Arrays;

import javax.servlet.*;
import javax.servlet.http.*;

public class LoginFilter implements Filter {

	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws ServletException, IOException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String servletPath = (String) req.getServletPath();
		String[] paths = servletPath.split("/");
		Boolean ispathprotected = true;
		if (Arrays.binarySearch(paths, "back-end") > 0) {  //back-end不需前台登入
			ispathprotected = false;
		} else if (Arrays.binarySearch(paths, "index") > 0) {  //front-end index folder is free
			ispathprotected = false;
		}

		HttpSession session = req.getSession(); // 【從 session 判斷此user是否登入過】
		Object tnt_no = session.getAttribute("tnt_no");
		Object lld_no = session.getAttribute("lld_no");


		if (ispathprotected && (tnt_no == null) && (lld_no == null)) {// protected path

				session.setAttribute("location", req.getRequestURI());
				res.sendRedirect(req.getContextPath() + "/front-end/index/Identify.jsp");
//				System.out.println("3.重導去Identify.jsp");
				return;

		} else {
			chain.doFilter(req, res);
		}
	}
}