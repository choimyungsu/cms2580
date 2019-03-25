package com.common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.Content;
import com.book.ContentDAO;

/**
 * Servlet implementation class bookContentSearchServlet
 */
@WebServlet("/bookContentSearchServlet")
public class bookContentSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/hteml;charset=UTF-8");
		String bookid = request.getParameter("bookid");
		String contentId = request.getParameter("contentId");
		response.getWriter().write(getJSON(bookid,contentId));
	}
	
	
	// [ 특수문자 처리가 필요함..
	public String getJSON(String bookid,String contentId) {
		if(bookid == null) bookid="";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\" : [");
		ContentDAO contentDAO = new ContentDAO();
		ArrayList<Content> content = contentDAO.searchContentsPage(bookid,contentId); // 본인ContentID는 제외하고 검색 
		for(int i=0; i<content.size(); i++) {
			result.append("{\"resultMccode\": \"" +content.get(i).getId() + "\", \"resultMcname\":\""+ content.get(i).getTitle()  +"\"}");
			//result.append("{\"resultMcname\": \"" +content.get(i).getTitle() + "\"}");
			//마지막 줄 처리 
			if(content.size() > (i+1)) { result.append(",");}
			
		}
		result.append("]}");
		System.out.println(result.toString());
		return result.toString();
					
		}
}
