package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.DiseaseBO;
import model.bo.NewsBO;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class DeleteDiseaseServlet
 */
@WebServlet("/DeleteDiseasesServlet")
public class DeleteDiseasesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDiseasesServlet() {
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
		String diseaseIdStr = request.getParameter("diseaseId");
		int diseaseId = 0;
		String status = "fail";
		
		if (diseaseIdStr != null) {
			diseaseId = Integer.parseInt(diseaseIdStr);
		}
		
		if (diseaseBO.deleteDisease(diseaseId) != 0)
			status = "success";
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);
		
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(jsonObj.toString());
	}

}
