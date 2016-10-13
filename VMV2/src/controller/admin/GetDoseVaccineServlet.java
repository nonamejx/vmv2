package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import model.bean.Vaccine;
import model.bo.VaccinationRecordBO;
import model.bo.VaccineBO;

/**
 * Servlet implementation class GetDoseVaccineServlet
 */
@WebServlet("/GetDoseVaccineServlet")
public class GetDoseVaccineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDoseVaccineServlet() {
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

		String userIdStr = request.getParameter("userId");
		String vaccineIdStr = request.getParameter("vaccineId");

		int userId = -1, vaccineId = -1, dose = -1, sumDose = -1;
		String status = "success";

		if (userIdStr != null) {
			userId = Integer.parseInt(userIdStr);
		}

		if (vaccineIdStr != null) {
			vaccineId = Integer.parseInt(vaccineIdStr);
		}

		VaccinationRecordBO vaccinationRecordBO = new VaccinationRecordBO();
		// get dose trong db
		dose = vaccinationRecordBO.getCurrentDose(userId, vaccineId);

		// get tong so mui cua loai vaccine do
		VaccineBO vaccineBO = new VaccineBO();
		Vaccine vaccine = vaccineBO.getVaccineById(vaccineId);
		sumDose = vaccine.getNumberOfDoses();

		// kiem tra số mũi
		if (dose < sumDose)
			dose += 1;
		else
			status = "fail";

		// send data
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("dose", dose);
		jsonObj.addProperty("status", status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObj.toString());
	}

}
