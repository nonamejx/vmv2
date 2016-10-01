package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Disease;
import model.bean.News;
import model.bo.DiseaseBO;
import model.bo.NewsBO;

import com.google.gson.Gson;

/**
 * Servlet implementation class ShowDiseasesServlet
 */
@WebServlet("/ShowDiseasesServlet")
public class ShowDiseasesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowDiseasesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DiseaseBO diseaseBO = new DiseaseBO();
		String diseasesIdStr = request.getParameter("diseasesId");
		int diseaseId = -1;
		
		if (diseasesIdStr != null) {
			diseaseId = Integer.parseInt(diseasesIdStr);
		}
		
		Disease disease = diseaseBO.getDiseaseById(diseaseId);
		
		String json = new Gson().toJson(disease);
		
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	}

}
