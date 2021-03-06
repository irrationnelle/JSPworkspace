package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JavaTest01")
public class JavaTest01 extends HttpServlet {

	public JavaTest01() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String userAgeStr = request.getParameter("userAge");
		int userAge = 0;
		if(userAgeStr != null) {
			userAge = Integer.parseInt(userAgeStr);
		}
		
		response.setContentType("text/html; charset=UTF-8");	// 한글처리
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("	<head>");
		writer.println("		<title>JavaTest01의 응답화면</title>");
		writer.println("	</head>");
		
		writer.println("	<body>");
		writer.println("		<h3>"+userID+"님 반갑습니다. 곧"+(userAge+1)+"살이 되시네요</h3>");
		writer.println("	</body>");
		writer.println("</html>");
	}

}
