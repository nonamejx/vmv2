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
			String username = request.getParameter("username").trim();
			String password = request.getParameter("password");
			String rememberMe = request.getParameter("rememberMe");
			User userLogin = userBO.getUserByUsernamePassword(username, password);
			System.out.println(userLogin);
			if (userLogin != null) {
				// checked remember
				if ("on".equals(rememberMe)) {
					if (MyUtils.getInstance(request).isRememberMe()) {
						String idStr = MyUtils.getInstance(request).getDetailCookieRemember();
						if (!idStr.equals(String.valueOf(userLogin.getUserId()))) {
							MyUtils.getInstance(request).editCookieRemember(userLogin.getUserId(), response);
						}
					} else {
						MyUtils.getInstance(request).createValueCookieRemember(userLogin.getUserId(), response);
					}

				} else {
					if (MyUtils.getInstance(request).isRememberMe()) {
						String idStr = MyUtils.getInstance(request).getDetailCookieRemember();
						if (idStr.equals(String.valueOf(userLogin.getUserId()))) {

							MyUtils.getInstance(request).deleteCookieRemember(response);
						}
					}
				}
				// T?o session
				MyUtils.createLoginSession(request, userLogin);
				response.sendRedirect("home");

			} else {
				javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("login.jsp?msg=1");
				rd.forward(request, response);
			}
		} else {
			int ck = 1;
			// L?y cookie remember
			if (MyUtils.getInstance(request).isRememberMe()) {
				String idStr = MyUtils.getInstance(request).getDetailCookieRemember();
				try {
					int id = Integer.parseInt(idStr);
					request.setAttribute("userRemember", userBO.getUserById(id));
				} catch (NumberFormatException ex) {
					javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("login.jsp?msg=2");
					rd.forward(request, response);
					ck = 0;
				}

			}
			if (ck == 0) {
				return;
			} else {
				javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
		}	
	}
}
