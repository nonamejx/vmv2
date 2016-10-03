package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.VaccinationRecordHolder;
import model.bo.VaccinationRecordBO;

import com.google.gson.Gson;

/**
 * Servlet implementation class ListVaccinationRecordServlet
 */
@WebServlet("/ListVaccinationRecordServlet")
public class ListVaccinationRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListVaccinationRecordServlet() {
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
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=utf-8");
		response.setCharacterEncoding("UTF-8");

		VaccinationRecordBO vaccinationRecordBO = new VaccinationRecordBO();
		ArrayList<VaccinationRecordHolder> vaccinationRecordHolders = vaccinationRecordBO
				.getAllVaccinationRecordsHolder();

		// tao id Vaccination Record Holder
		for (VaccinationRecordHolder vaRecordHolder : vaccinationRecordHolders) {
			vaRecordHolder.setVaccinationRecordHolderId(vaRecordHolder
					.getUserId()
					+ ";"
					+ vaRecordHolder.getVaccineId()
					+ ";"
					+ vaRecordHolder.getDose());
		}
		String json = new Gson().toJson(vaccinationRecordHolders);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
