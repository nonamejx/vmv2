package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;



import model.bean.User;
import model.bean.VaccinationRecordHolder;
import model.bo.VaccinationRecordBO;

/**
 * Servlet implementation class ListVaccinationHistoryServlet
 */
@WebServlet("/ListVaccinationHistoryServlet")
public class ListVaccinationHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListVaccinationHistoryServlet() {
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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		javax.servlet.http.HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");

		if (userLogin != null) {
			VaccinationRecordBO vaccinationRecordBO = new VaccinationRecordBO();
			ArrayList<VaccinationRecordHolder> vaccinationRecordHolders = vaccinationRecordBO
					.getVaccinationRecordHoldersByUser(userLogin.getUserId());

			String json = new Gson().toJson(vaccinationRecordHolders);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} else {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
		}
	}

}
