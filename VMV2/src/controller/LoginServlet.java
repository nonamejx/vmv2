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
		String keywordSession = "userLogin";
		String keywordCookie = "idUserLogin";
		if (submit != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String rememberMe = request.getParameter("rememberMe");
			System.out.println(username+" "+password+" "+rememberMe);
			User userLogin = userBO.getUserByUsernamePassword(username, password);
			if (userLogin != null) {
				if ("on".equals(rememberMe)) {
					// Tạo cookie
					String idStr = MyUtils.getInstance(request, response).getValueCookieRemember(keywordCookie);
					if (!"".equals(idStr)){
						if(!idStr.equals(String.valueOf(userLogin.getUserId()))){
							if (MyUtils.getInstance(request, response).deleteCookieRemember(keywordCookie)> 0) {
								MyUtils.getInstance(request, response).setValueCookieRemember(userLogin.getUserId(),
										keywordCookie);
							}
						}
					}else{
						MyUtils.getInstance(request, response).setValueCookieRemember(userLogin.getUserId(),
								keywordCookie);
					} 
					
				} else if(rememberMe==null) {
					String idStr=MyUtils.getInstance(request, response).getValueCookieRemember(keywordCookie);
					if(idStr!=null){
						if(idStr.equals(String.valueOf(userLogin.getUserId()))){
							// Xóa cookie
							if (MyUtils.getInstance(request, response).deleteCookieRemember(keywordCookie) <= 0) {
								response.sendRedirect("user/login.jsp");
							}
						}
					}
				}
				// Tạo session
				MyUtils.getInstance(request, response).setSessionLogin(userLogin, keywordSession);
				response.sendRedirect("user/home.jsp");
			} else {
				javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("user/login.jsp?msg=1");
				rd.forward(request, response);
			}
		} else {
			// Lấy cookie remember
			String idStr = MyUtils.getInstance(request, response).getValueCookieRemember(keywordCookie);
			if (!"".equals(idStr)) {
				try {
					User userRemember = userBO.getUserById(Integer.parseInt(idStr));
					request.setAttribute("userRemember", userRemember);
				} catch (NumberFormatException ex) {
					response.sendRedirect("user/login.jsp");
				}
			}
			javax.servlet.RequestDispatcher rd = request.getRequestDispatcher("user/login.jsp");
			rd.forward(request, response);
		}
	}
}
