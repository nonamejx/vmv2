package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import utils.MyUtils;

/**
 * Servlet implementation class NewsManagementServlet
 */
@WebServlet(urlPatterns = {"/user/profile", "/admin/profile"})
public class ProfileManagementUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileManagementUserServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		// kiem tra dang nhap
		User user = MyUtils.getInstance(request).getSessionLogin();
        request.setAttribute("template", (user!= null && user.getRole()) ? "admin" : "user");
        
		javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("/user/profile.jsp");
		rd.forward(request, response);
	}

}
