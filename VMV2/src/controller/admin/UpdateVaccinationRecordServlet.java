package controller.admin;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.VaccinationRecord;
import model.bo.VaccinationRecordBO;
import utils.DateUtils;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class UpdateVaccinationRecordServlet
 */
@WebServlet("/UpdateVaccinationRecordServlet")
public class UpdateVaccinationRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVaccinationRecordServlet() {
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

		VaccinationRecordBO vaccinationRecordBO = new VaccinationRecordBO();
		String status = "fail";
		String userIdStr = request.getParameter("idUser");
		String vaccineIdStr = request.getParameter("idVaccine");
		String doseStr = request.getParameter("dose");
		String nextDoseDateStr = request.getParameter("nextDoseDate");

		int dose = -1, userId = -1, vaccineId = -1, check = -1;

		if (doseStr != null) {
			dose = Integer.parseInt(doseStr);
		}

		if (userIdStr != null) {
			userId = Integer.parseInt(userIdStr);
		}

		if (vaccineIdStr != null) {
			vaccineId = Integer.parseInt(vaccineIdStr);
		}

		Date nextDoseDate = null;
		if (nextDoseDateStr != null) {
			nextDoseDate = DateUtils.convertToSDate(nextDoseDateStr);
		}

		// get injection Date in database
		System.out
				.println(userId + " " + vaccineId + " " + dose + " id holder");

		VaccinationRecord vaccinationRecords = vaccinationRecordBO
				.getVaccinationRecord(userId, vaccineId, dose);

		System.out.println("next " + nextDoseDate);
		System.out.println("current " + vaccinationRecords.getInjectionDate());
		// Validate
		boolean hasError = false;
		if (userId <= 0) {
			hasError = true;
		}
		if (vaccineId <= 0) {
			hasError = true;
		}
		if (dose <= 0) {
			hasError = true;
		}
		if (nextDoseDate.compareTo(vaccinationRecords.getInjectionDate()) < 0) {
			System.out.println("fail here");
			hasError = true;
		}

		// update
		if (!hasError) {
			VaccinationRecord vaccinationRecord = new VaccinationRecord(userId,
					vaccineId, dose, vaccinationRecords.getInjectionDate(),
					nextDoseDate);
			check = vaccinationRecordBO
					.updateVaccinationRecord(vaccinationRecord);
			if (check > 0) {
				status = "success";
			}
		}
		// send Data
		System.out.println("update send json");
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObj.toString());

	}

}
