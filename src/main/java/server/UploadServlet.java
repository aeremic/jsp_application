package server;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import main.DatabaseAccess;

@WebServlet("/add_phone")
@MultipartConfig
public class UploadServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = (String) request.getParameter("name");
		
		Part filePart = request.getPart("image");
	    String fileName = getSubmittedFileName(filePart);
		String image = "img/" + fileName; // temp
		
		String description = (String) request.getParameter("description");
		double price = Double.valueOf(request.getParameter("price"));
		
		// todo upload img
	    InputStream fileContent = filePart.getInputStream();
	    byte[] buffer = new byte[fileContent.available()];
	    fileContent.read(buffer);
		
		DatabaseAccess.addPhone(name, image, description, price);
		response.sendRedirect(request.getContextPath() + "/pages/admin_page.jsp");
	}
	
	private static String getSubmittedFileName(Part part) {
	    for (String cd : part.getHeader("content-disposition").split(";")) {
	        if (cd.trim().startsWith("filename")) {
	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
	        }
	    }
	    return null;
	}
}
