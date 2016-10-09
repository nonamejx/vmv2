package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.UserBO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("login");
		UserBO userBO = new UserBO();
		if (submit != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String rememberMe = request.getParameter("rememberMe");

			User userLogin = userBO.getUserByUsernamePassword(username, password);

			if (userLogin != null) {
				if ("on".equals(rememberMe)) {
					setRememberMe(userLogin.getUserId(), response);
				} else {
					deleteRememberMe(request, response);
				}
				javax.servlet.http.HttpSession session = request.getSession();
				session.setAttribute("userLogin", userLogin);
				if (userLogin.getRole()) {
					response.sendRedirect("user/home.jsp");
				}
			} else {
				javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("user/login.jsp?msg=1");
				rd.forward(request, response);
			}
		} else {
			int id = readCookies(request);
			if (id > 0) {
				User userRemember = userBO.getUserById(id);
				request.setAttribute("userRemember", userRemember);
			}
			javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("user/login.jsp");
			rd.forward(request, response);
		}
	}

	public void setRememberMe(int id, HttpServletResponse response) {
		Cookie userRemember = new Cookie("idUserLogin", String.valueOf(id));
		userRemember.setMaxAge(60 * 60 * 24);
		response.addCookie(userRemember);
	}

	public int readCookies(HttpServletRequest request) {
		int rs = 0;
		Cookie cookie = null;
		Cookie[] cookies = null;
		// Get an array of Cookies associated with this domain
		cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if ("idUserLogin".equals(cookie.getName())) {
					rs = Integer.parseInt(cookie.getValue());
				}
			}
		}
		return rs;
	}

	public int deleteRememberMe(HttpServletRequest request, HttpServletResponse response) {
		int rs = 0;
		Cookie cookie = null;
		Cookie[] cookies = null;
		// Get an array of Cookies associated with this domain
		cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if ("idUserLogin".equals(cookie.getName())) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		return rs;
	}
}
