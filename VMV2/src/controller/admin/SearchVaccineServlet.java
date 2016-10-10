package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bean.Vaccine;
import model.bo.UserBO;
import model.bo.VaccineBO;

import com.google.gson.Gson;

/**
 * Servlet implementation class SearchVaccineServlet
 */
@WebServlet("/SearchVaccineServlet")
public class SearchVaccineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchVaccineServlet() {
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
		
		String keywordVaccine = request.getParameter("keywordVaccine");
		System.out.println("vo day "+keywordVaccine);
		VaccineBO vaccineBO = new VaccineBO();
		ArrayList<Vaccine> listVaccin = vaccineBO.searchVaccine(keywordVaccine);

		String json = new Gson().toJson(listVaccin);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
