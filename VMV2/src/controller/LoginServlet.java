package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.UserBO;
import utils.MyUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
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
				// checked remember
				if ("on".equals(rememberMe)) {
					if (MyUtils.getInstance(request).isRememberMeSelected()) {
						String idStr = MyUtils.getInstance(request).getDetailCookieRemember();
						if (!idStr.equals(String.valueOf(userLogin.getUserId()))) {
							MyUtils.getInstance(request).editCookieRemember(userLogin.getUserId(), response);
						}
					} else {
						MyUtils.getInstance(request).createValueCookieRemember(userLogin.getUserId(), response);
					}

				} else {
					if (MyUtils.getInstance(request).isRememberMeSelected()) {
						String idStr = MyUtils.getInstance(request).getDetailCookieRemember();
						if (idStr.equals(String.valueOf(userLogin.getUserId()))) {
							MyUtils.getInstance(request).deleteCookieRemember(response);
						}
					}
				}
				// Tạo session
				MyUtils.getInstance(request).createLoginSession(userLogin);
				if (MyUtils.getInstance(request).isLoggedIn()) {
					response.sendRedirect("home");
				} else {
					response.sendRedirect("user/login");
				}
			} else {
				javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("/user/login.jsp?msg=1");
				rd.forward(request, response);
			}
		} else {
			// Lấy cookie remember
			if (MyUtils.getInstance(request).isRememberMeSelected()) {
				String idStr = MyUtils.getInstance(request).getDetailCookieRemember();
				try {
					int id = Integer.parseInt(idStr);
					request.setAttribute("userRemember", userBO.getUserById(id));
				} catch (NumberFormatException ex) {
				}
			}
			javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("/user/login.jsp");
			rd.forward(request, response);
		}
	}
}
