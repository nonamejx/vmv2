package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import utils.Validate;
import model.bean.Disease;
import model.bean.News;
import model.bo.DiseaseBO;

/**
 * Servlet implementation class UpdateDiseasesServlet
 */
@WebServlet("/UpdateDiseasesServlet")
public class UpdateDiseasesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDiseasesServlet() {
        super();
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
		
		DiseaseBO diseaseBO = new DiseaseBO();
		String status = "fail";
		
		String diseaseId = request.getParameter("diseaseId");
		String diseaseName = request.getParameter("diseaseName");
		String description = request.getParameter("description");
		
		 // Validate
        boolean hasError = false;
        if (Validate.isEmpty(diseaseId)) {
    		hasError = true;
    	}
        
    	if (!Validate.checkString(diseaseName, 1, 100)) {
    		hasError = true;
    	}
    	
		if (!hasError) {
			Disease disease = diseaseBO.getDiseaseById(Integer.parseInt(diseaseId));
			disease.setDiseaseName(diseaseName);
			disease.setDescription(description);
			diseaseBO.updateDisease(disease);
			status = "success";
		}
		
		// send data
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(jsonObj.toString());
	}

}
