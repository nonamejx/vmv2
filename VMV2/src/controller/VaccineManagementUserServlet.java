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
@WebServlet(urlPatterns = {"/vaccine", "/user/vaccine"})
public class VaccineManagementUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VaccineManagementUserServlet() {
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
		
		User user = MyUtils.getInstance(request).getSessionLogin();
        String template = "guest";
        if (user != null)
        	if (user.getRole())
        		template = "admin";
        	else
        		template = "user";
        request.setAttribute("template", template);
		
		javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("/user/vaccine.jsp");
		rd.forward(request, response);
	}

}
