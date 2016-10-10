package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import model.bean.Disease;
import model.bean.Vaccine;
import model.bo.DiseaseBO;
import model.bo.VaccineBO;

/**
 * Servlet implementation class ShowNewsServet
 */
@WebServlet("/ShowVaccineServlet")
public class ShowVaccineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowVaccineServlet() {
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
		VaccineBO vaccineBO = new VaccineBO();
		DiseaseBO diseaseBO = new DiseaseBO();
		String vaccineIdStr = request.getParameter("vaccineId");
		int vaccineId = 0;
		ArrayList<Disease> listDisease = null;
		Vaccine vaccine = null;
		JsonObject jsonObject = null;
		if (vaccineIdStr != null) {
			vaccineId = Integer.parseInt(vaccineIdStr);
			vaccine = vaccineBO.getVaccineById(vaccineId);
			listDisease = diseaseBO.getDiseasesByVaccineId(vaccineId);
			jsonObject = new JsonObject();
			jsonObject.addProperty("vaccineId", vaccine.getVaccineId());
			jsonObject.addProperty("vaccineName", vaccine.getVaccineName());
			jsonObject.addProperty("manufacturer", vaccine.getManufacturer());
			jsonObject.addProperty("price", vaccine.getPrice());
			jsonObject.addProperty("numberOfDoses", vaccine.getNumberOfDoses());
			jsonObject.addProperty("sideEffects", vaccine.getSideEffects());
			jsonObject.addProperty("indication", vaccine.getIndication());
			jsonObject.addProperty("contraindication", vaccine.getContraindication());
			jsonObject.addProperty("dosageAndUsage", vaccine.getDosageAndUsage());
			jsonObject.addProperty("image", vaccine.getImage());
			jsonObject.addProperty("vaccineDisease", setStringDisease(listDisease));
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObject.toString());
	}

	public String setStringDisease(ArrayList<Disease> listDisease) {
		String rs = "";
		for (int i = 0; i < listDisease.size(); i++) {
			if (i == listDisease.size() - 1) {
				rs += listDisease.get(i).getDiseaseId();
			} else {
				rs += listDisease.get(i).getDiseaseId() + ",";
			}
		}
		return rs;
	}
}
