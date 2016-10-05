package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.VaccinationRecordBO;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class DeleteVaccinationRecordServlet
 */
@WebServlet("/DeleteVaccinationRecordServlet")
public class DeleteVaccinationRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteVaccinationRecordServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		VaccinationRecordBO vaccinationRecordBO = new VaccinationRecordBO();
		String vaccinationRecordIdStr = request
				.getParameter("vaccinationRecordId");
		String status = "fail";

		// tach id vaccination record
		String[] vaccinationRecordId = vaccinationRecordIdStr.split(";");
		int userId = Integer.parseInt(vaccinationRecordId[0]);
		int vaccineId = Integer.parseInt(vaccinationRecordId[1]);
		int dose = Integer.parseInt(vaccinationRecordId[2]);

		if (vaccinationRecordBO.deleteVaccinationRecord(userId, vaccineId, dose) > 0)
			status = "success";

		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObj.toString());
	}

}
