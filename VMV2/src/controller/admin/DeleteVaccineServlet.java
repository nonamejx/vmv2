package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import model.bo.VaccineBO;

/**
 * Servlet implementation class DeleteNewsServlet
 */
@WebServlet("/DeleteVaccineServlet")
public class DeleteVaccineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteVaccineServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VaccineBO vaccineBO = new VaccineBO();
		String vaccineIdStr = request.getParameter("vaccineId");
		int vaccineId = 0;
		String status = "fail";
		if (vaccineIdStr != null) {
			vaccineId = Integer.parseInt(vaccineIdStr);
		}
		if (vaccineBO.deleteVaccine(vaccineId) != 0) {
			status = "success";
		}
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObj.toString());
	}

}
