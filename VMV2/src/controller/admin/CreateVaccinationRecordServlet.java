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
 * Servlet implementation class CreateVaccinationRecordServlet
 */
@WebServlet("/CreateVaccinationRecordServlet")
public class CreateVaccinationRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateVaccinationRecordServlet() {
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

		// add
		if (!hasError) {
			VaccinationRecord vaccinationRecord = new VaccinationRecord(userId,
					vaccineId, dose, DateUtils.convertToSDate(new java.util.Date()), nextDoseDate);
			check = vaccinationRecordBO
					.insertVaccinationRecord(vaccinationRecord);
			if (check != 0) {
				status = "success";
			}
		}
		// send Data
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObj.toString());
	}

}
