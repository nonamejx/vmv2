package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.VaccinationRecordBO;

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
		
		int dose = -1;
		VaccinationRecordBO vaccinationRecordBO = new VaccinationRecordBO();
		//get dose trong db
		
		//get tong so mui cua loai vaccine do
		
		//kiem tra, neu so dose < tong so mui thi tang len 1, hoac tra ve 0
		
		//tra so do ve json
	}

}
