package controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class HomeServlet
 */
@WebServlet(urlPatterns = {"/home", "/user/home", "/admin/home"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
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
		ArrayList<News> newsList = null;
		
		int page = 1;
		int recordsPerPage = 8;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));

		
		newsList = newsBO.getNewsLimit((page - 1) * recordsPerPage, recordsPerPage);
		int noOfRecords = newsBO.countNews();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.setAttribute("newsList", newsList);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        
        User user = MyUtils.getSessionLogin(request);
        String template = "guest";
        if (user != null)
        	if (user.getRole())
        		template = "admin";
        	else
        		template = "user";
        request.setAttribute("template", template);
		
		RequestDispatcher rd = request.getRequestDispatcher("/user/home.jsp");
		rd.forward(request, response);
	}

}
