package controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.google.gson.JsonObject;

import model.bean.Vaccine;
import model.bean.VaccineDisease;
import model.bo.VaccineBO;
import model.bo.VaccineDiseaseBO;

/**
 * Servlet implementation class CreateNewsServlet
 */
@WebServlet("/UpdateVaccineServlet")
@MultipartConfig
public class UpdateVaccineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIRECTORY = "upload";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateVaccineServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=utf-8");
		response.setCharacterEncoding("UTF-8");

		VaccineDiseaseBO vaccineDiseaseBO = new VaccineDiseaseBO();
		VaccineBO vaccineBO = new VaccineBO();
		String vaccineId = null, vaccineName = null, manufacturer = null, price = null, numberOfDoses = null,
				sideEffects = null, indication = null, contraindication = null, dosageAndUsage = null, image = null,
				disease = null, oldImage = null;
		ArrayList<String> listDiseases = new ArrayList<>();
		String status = "fail";
		// checks if the request actually contains upload file
		if (!ServletFileUpload.isMultipartContent(request)) {
			PrintWriter writer = response.getWriter();
			writer.println("Request does not contain upload data");
			writer.flush();
			return;
		}
		// configures upload settings
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);

		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		// end configures upload settings

		try {
			List<FileItem> formItems = upload.parseRequest(request);
			Iterator<FileItem> iter = formItems.iterator();

			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (!item.isFormField()) {
					if (item.getSize() != 0) {
						String fileName = item.getName();
						String endFileName = FilenameUtils.getExtension(fileName);
						fileName = "Vaccine-" + System.nanoTime() + "." + endFileName;
						item.setFieldName(fileName);
						String root = getServletContext().getRealPath("/");
						File path = new File(root + "/uploads");
						if (!path.exists()) {
							path.mkdirs();
						}
						if (!fileName.equals("")) {
							File uploadedFile = new File(path + "/" + fileName);
							item.write(uploadedFile);
							image = fileName;
						}
					}

				} else {
					switch (item.getFieldName()) {
					case "vaccineId":
						vaccineId = item.getString("UTF-8");
						break;
					case "vaccineName":
						vaccineName = item.getString("UTF-8");
						break;
					case "manufacturer":
						manufacturer = item.getString("UTF-8");
						break;
					case "price":
						price = item.getString("UTF-8");
						break;
					case "numberOfDoses":
						numberOfDoses = item.getString("UTF-8");
						break;
					case "sideEffects":
						sideEffects = item.getString("UTF-8");
						break;
					case "indication":
						indication = item.getString("UTF-8");
						break;
					case "contraindication":
						contraindication = item.getString("UTF-8");
						break;
					case "dosageAndUsage":
						dosageAndUsage = item.getString("UTF-8");
						break;
					case "nameImage":
						oldImage = item.getString("UTF-8");
						break;
					case "disease":
						disease = item.getString("UTF-8");
						listDiseases.add(disease);
						break;

					default:
						break;
					}
				}
			}
		} catch (Exception ex) {
			image = null;
		}
		if (image == null) {
			image = oldImage;
		}
		// Validate
		boolean hasError = false;
		if (!hasError) {
			Vaccine vaccine = new Vaccine(Integer.parseInt(vaccineId), vaccineName, manufacturer,
					Double.parseDouble(price), Integer.parseInt(numberOfDoses), sideEffects, indication,
					contraindication, dosageAndUsage, image);
			if (vaccineBO.updateVaccine(vaccine) != 0) {
				ArrayList<VaccineDisease> listVaccineDisease = vaccineDiseaseBO
						.getVaccineDiseasesByVaccineId(Integer.parseInt(vaccineId));

				if (listVaccineDisease.size() == 0) {
					if (createVaccineDisease(Integer.parseInt(vaccineId), listDiseases) > 0) {
						status = "success";
					}
				} else {
					if (vaccineDiseaseBO.deleteVaccineDiseaseByVaccineId(Integer.parseInt(vaccineId)) > 0) {
						if (createVaccineDisease(Integer.parseInt(vaccineId), listDiseases) > 0) {
							status = "success";
						}
					}
				}
			}

		}

		// send data
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObj.toString());
	}

	public int createVaccineDisease(int idVaccine, ArrayList<String> listDiseases) {
		int rs = 1;
		VaccineDiseaseBO vaccineDiseaseBO = new VaccineDiseaseBO();
		for (String idDisease : listDiseases) {
			if (vaccineDiseaseBO
					.insertVaccineDisease(new VaccineDisease(idVaccine, Integer.parseInt(idDisease), "")) <= 0) {
				rs = 0;
				break;
			}
		}
		return rs;
	}

}
