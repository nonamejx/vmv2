package controller.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Disease;
import model.bean.News;
import model.bo.DiseaseBO;
import model.bo.NewsBO;

import com.google.gson.JsonObject;

import utils.DateUtils;
import utils.Validate;

/**
 * Servlet implementation class CreateDiseaseServlet
 */
@WebServlet("/CreateDiseaseServlet")
public class CreateDiseaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateDiseaseServlet() {
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
		String diseaseName = request.getParameter("diseaseName");
		String description = request.getParameter("description");
		
		// Validate
        boolean hasError = false;
    	if (!Validate.checkString(diseaseName, 1, 100)) {
    		hasError = true;
    	}
    	if (!hasError) {
			Disease diseases = new Disease(diseaseName,description);
			diseaseBO.insertDisease(diseases);
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
