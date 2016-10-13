package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.VaccinationRecordHolder;
import model.bo.VaccinationRecordBO;

import com.google.gson.Gson;

/**
 * Servlet implementation class ShowVaccinationRecordServlet
 */
@WebServlet("/ShowVaccinationRecordServlet")
public class ShowVaccinationRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowVaccinationRecordServlet() {
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
		VaccinationRecordBO vaccinationRecordBO = new VaccinationRecordBO();
		String vaccinationRecordIdStr = request
				.getParameter("vaccinationRecordId");
		int idUser = -1, idVaccine = -1, dose = -1;
		if (vaccinationRecordIdStr != null) {
			String[] vaccinationRecordId = vaccinationRecordIdStr.split(";");
			idUser = Integer.parseInt(vaccinationRecordId[0]);
			idVaccine = Integer.parseInt(vaccinationRecordId[1]);
			dose = Integer.parseInt(vaccinationRecordId[2]);
		}
		VaccinationRecordHolder vaccinationRecordHolder = vaccinationRecordBO
				.getVaccinationRecordHolderById(idUser, idVaccine, dose);
		String json = new Gson().toJson(vaccinationRecordHolder);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
