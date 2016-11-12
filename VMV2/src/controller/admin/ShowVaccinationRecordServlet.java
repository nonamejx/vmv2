package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bean.VaccinationRecordHolder;
import model.bean.Vaccine;
import model.bo.UserBO;
import model.bo.VaccinationRecordBO;
import model.bo.VaccineBO;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

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
		UserBO userBO = new UserBO();
		VaccineBO vaccineBO = new VaccineBO();
		
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
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		jsonObject.addProperty("vaccinationRecord", gson.toJson(vaccinationRecordHolder));
		
		Vaccine vaccine = vaccineBO.getVaccineById(idVaccine);
		jsonObject.addProperty("vaccine", gson.toJson(vaccine));
		
		User user = userBO.getUserById(idUser);
		jsonObject.addProperty("user", gson.toJson(user));
		
//		String json = new Gson().toJson(vaccinationRecordHolder);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObject.toString());
	}

}
