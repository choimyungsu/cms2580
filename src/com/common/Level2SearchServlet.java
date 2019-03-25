package com.common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.Examlist;
import com.exam.ExamlistDAO;

/**
 * Servlet implementation class Level2SearchServlet
 */
@WebServlet("/Level2SearchServlet")
public class Level2SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hteml;charset=UTF-8");
		String level1 = request.getParameter("level1");
		response.getWriter().write(getJSON(level1));
	}
	
	
	// [ 특수문자 처리가 필요함..
	public String getJSON(String examcode) {
		if(examcode == null) examcode="";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\" : [");
		ExamlistDAO examlistDAO = new ExamlistDAO();
		ArrayList<Examlist> examList = examlistDAO.search(examcode);
		for(int i=0; i<examList.size(); i++) {
			result.append("{\"resultMccode\": \"" +examList.get(i).getTurn() + "\"}");
			//마지막 줄 처리 
			if(examList.size() > (i+1)) { result.append(",");}
			
		}
		result.append("]}");
		//System.out.println(result.toString());
		return result.toString();
					
		}
}
