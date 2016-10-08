package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.bean.Disease;
import model.bo.DiseaseBO;

/**
 * Servlet implementation class ShowNewsServet
 */
@WebServlet("/ShowVaccineDiseaseByIdVaccineServlet")
public class ShowVaccineDiseaseByIdVaccineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowVaccineDiseaseByIdVaccineServlet() {
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
		DiseaseBO diseaseBO = new DiseaseBO();
		String vaccineIdStr = request.getParameter("vaccineId");
		int vaccineId = 0;
		if (vaccineIdStr != null) {
			vaccineId = Integer.parseInt(vaccineIdStr);
		}
		ArrayList<Disease> listDisease = diseaseBO.getDiseasesByVaccineId(vaccineId);
		String json = new Gson().toJson(listDisease);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);

	}

}
