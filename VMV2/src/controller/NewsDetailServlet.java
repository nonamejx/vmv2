package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.News;
import model.bean.User;
import model.bo.NewsBO;
import utils.MyUtils;

/**
 * Servlet implementation class NewsDetailServlet
 */
@WebServlet(urlPatterns = {"/news-detail", "/user/news-detail", "/admin/news-detail"})
public class NewsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		// BO
		NewsBO newsBO = new NewsBO();
		
		//OBJ
		News news = null;
		
		if (request.getParameter("id") != null) {
			int newsId = Integer.parseInt(request.getParameter("id"));
			news = newsBO.getNewsById(newsId);
		}
		
		request.setAttribute("news", news);
		
		User user = MyUtils.getSessionLogin(request);
		String template = "guest";
		if (user != null)
			if (user.getRole())
				template = "admin";
			else
				template = "user";
		request.setAttribute("template", template);
		
		RequestDispatcher rd = request.getRequestDispatcher("/user/news-detail.jsp");
		rd.forward(request, response);
	}

}
