package controller.admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Disease;
import model.bo.DiseaseBO;
import model.bo.VaccinationRecordBO;
import utils.Validate;

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
		String diseaseName = request.getParameter("user");
		String description = request.getParameter("vaccine");
		String doseStr = request.getParameter("dose");
		String nextDoseDateStr = request.getParameter("nextDoseDate");
		
		int dose = -1; 
		if(doseStr!=null){
			dose = Integer.parseInt(doseStr);
		}
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		Date nextDoseDate = null;
		if(nextDoseDateStr!=null){
			try {
				nextDoseDate = dateFormat.parse(nextDoseDateStr);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String injectionDateStr = dateFormat.format(new Date());
		Date injectionDate = null;
		try {
			injectionDate = dateFormat.parse(injectionDateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(nextDoseDate);
		System.out.println(injectionDate);
	}

}
