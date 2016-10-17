package controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import model.bean.User;
import model.bo.UserBO;
import utils.DateUtils;

/**
 * Servlet implementation class CreateNewsServlet
 */
@WebServlet("/CreateUserServlet")
@MultipartConfig
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIRECTORY = "upload";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateUserServlet() {
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
		UserBO userBO = new UserBO();
		String fullName = null, gender = null, birthday = null, phoneNumber = null, address = null, username = null,
				password = null, avatar = null, rl = null;
		boolean role = true;
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
					String fileName = item.getName();
					String endFileName = FilenameUtils.getExtension(fileName);
					fileName = "User-" + System.nanoTime() + "." + endFileName;
					item.setFieldName(fileName);
					String root = getServletContext().getRealPath("/");
					File path = new File(root + "/uploads");
					if (!path.exists()) {
						path.mkdirs();
					}
					if (!fileName.equals("")) {
						File uploadedFile = new File(path + "/" + fileName);
						item.write(uploadedFile);
						avatar = fileName;
					}
				} else {
					switch (item.getFieldName()) {
					case "name":
						fullName = item.getString("UTF-8");
						break;
					case "dateOfBirth":
						birthday = item.getString("UTF-8");
						break;
					case "gender":
						gender = item.getString("UTF-8");
						break;
					case "phoneNumber":
						phoneNumber = item.getString("UTF-8");
						break;
					case "address":
						address = item.getString("UTF-8");
						break;
					case "username":
						username = item.getString("UTF-8");
						break;
					case "password":
						password = item.getString("UTF-8");
						break;
					case "isAdmin":
						rl = item.getString("UTF-8");
						if ("on".equals(rl)) {
							role = true;
						} else if ("1".equals(rl)) {
							role = false;
						}
						break;
					default:
						break;
					}
				}
			}
		} catch (Exception ex) {
			avatar = null;
		}

		// Validate
		boolean hasError = false;
		if (userBO.getUserByUsername(username) != null) {
			hasError = true;
		}
		if (phoneNumber.length() <= 0 || phoneNumber.length() > 11) {
			hasError = true;
		}
		if (!hasError) {
			User user = new User(fullName, Integer.parseInt(gender), DateUtils.convertToSDate(birthday), phoneNumber,
					address, username, password, role, avatar);
			userBO.insertUser(user);
			status = "success";
		}

		// send data
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("status", status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonObj.toString());
	}
}
