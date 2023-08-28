package com.blog.action;

import com.blog.dao.FileDAO;
import com.blog.vo.FileVO;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

// 파일 업로드 기능 수행 클래스
public class FileUploadAction implements Action {
	
	private static final String UPLOAD_PATH = "C:\\Repository\\MY-DUCK";
	private static final int MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part = request.getPart("uploadFile");
		part.write(UPLOAD_PATH + File.separator + part.getSubmittedFileName());
		part.delete();

		FileVO fvo = new FileVO();
		fvo.setFilePath(UPLOAD_PATH + File.separator + part.getSubmittedFileName());
		fvo.setFileName(part.getSubmittedFileName());
		
		FileDAO dao = FileDAO.getInstance();
		dao.insertFile(fvo);
		
		System.out.println("Name : " + part.getName());
		System.out.println("ContentType : " + part.getContentType());
		System.out.println("Size : " + part.getSize());
		System.out.println("FileName : " + part.getSubmittedFileName());
		System.out.println("Header : " + part.getHeader("Content-Disposition"));
		
		// 생성된 경로를 JSON 형식으로 보내주기 위한 설정
		JsonObject obj = new JsonObject();
		obj.addProperty("url", UPLOAD_PATH);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(obj.toString());
		out.flush();
	}
}