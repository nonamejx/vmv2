package controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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

import com.google.gson.JsonObject;

import model.bean.News;
import model.bo.NewsBO;
import utils.DateUtils;
import utils.Validate;

/**
 * Servlet implementation class CreateNewsServlet
 */
@WebServlet("/UpdateNewsServlet")
@MultipartConfig
public class UpdateNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String UPLOAD_DIRECTORY = "upload";
    private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		
		NewsBO newsBO = new NewsBO();
		String newsId = null, title = null, content = null, image = null, endDateStr = null;
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
         
        
        String uploadPath = getServletContext().getRealPath("")
            + File.separator + UPLOAD_DIRECTORY;
        
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
                        
                } else {
                	switch (item.getFieldName()) {
	                	case "newsId":
	                		newsId = item.getString("UTF-8");
							break;
						case "title":
							title = item.getString("UTF-8");
							break;
						case "content":
							content = item.getString("UTF-8");
							break;
						case "end_date":
							endDateStr = item.getString("UTF-8");
							break;
						default:
							break;
					}
                }
            }
        } catch (Exception ex) {
        	image = null;
        }
        
        // Validate
        boolean hasError = false;
        if (Validate.isEmpty(newsId)) {
    		hasError = true;
    	}
        
    	if (!Validate.checkString(title, 1, 100)) {
    		hasError = true;
    	}
    	
		if (!hasError) {
			News news = newsBO.getNewsById(Integer.parseInt(newsId));
			news.setTitle(title);
			news.setContent(content);
			news.setCreatedDate(DateUtils.convertToTimestamp(new Date()));
			news.setEndDate(DateUtils.convertToTimestamp(endDateStr));
			if (image != null)
				news.setImage(image);
			if (newsBO.updateNews(news) != 0)
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