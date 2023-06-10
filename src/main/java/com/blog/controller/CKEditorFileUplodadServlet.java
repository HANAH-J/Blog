package com.blog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
				 maxFileSize = 1024 * 1024 * 10,      // 10MB
				 maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class CKEditorFileUplodadServlet extends HttpServlet {
	private static final String UPLOAD_DIRECTORY = "upload";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String ckEditorFuncNum = request.getParameter("CKEditorFuncNum");
        String fileName = "";
    	
        for (Part part : request.getParts()) {
            if (part.getName().equals("imageFile")) {
            	fileName = getFileName(part);
                String uploadPath = UPLOAD_DIRECTORY + File.separator + fileName;
                part.write(uploadPath);
                break;
            }
        }

        String fileUrl = request.getContextPath() + "/" + UPLOAD_DIRECTORY + "/" + fileName;
        response.getWriter().print("<script type='text/javascript'>");
        response.getWriter().print("window.parent.CKEDITOR.tools.callFunction(" + ckEditorFuncNum + ", '" + fileUrl + "', 'Image uploaded successfully');");
        response.getWriter().print("</script>");
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");

        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return "";
    }
}