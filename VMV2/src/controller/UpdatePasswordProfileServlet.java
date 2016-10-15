package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import model.bean.User;
import model.bo.UserBO;

/**
 * Servlet implementation class CreateNewsServlet
 */
@WebServlet("/UpdatePasswordProfileServlet")
@MultipartConfig
public class UpdatePasswordProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePasswordProfileServlet() {
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

		UserBO userBO = new UserBO();
		String password = request.getParameter("password");
		String userId = request.getParameter("userId");
		String status = "fail";
		if (password != null && userId != null) {
			// Validate
			boolean hasError = false;
			if (!hasError) {
				User user = userBO.getUserById(Integer.parseInt(userId));
				if (user != null) {
					user.setPassword(password);
					if (userBO.updateUser(user) > 0) {
						status = "success";
					}
				}
			}

		}

		// send data
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObj.toString());
	}
}
