package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Disease;
import model.bo.DiseaseBO;

/**
 * Servlet implementation class NewsManagementServlet
 */
@WebServlet("/VaccineManagementServlet")
public class VaccineManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VaccineManagementServlet() {
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
		DiseaseBO diseaseBO = new DiseaseBO();
		ArrayList<Disease> listDisease = diseaseBO.getAllDiseases();
		request.setAttribute("listDisease", listDisease);
		// kiem tra dang nhap
		RequestDispatcher rd = request.getRequestDispatcher("admin/vaccine-management.jsp");
		rd.forward(request, response);

	}

}
