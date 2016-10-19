package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JavaTest02")
public class JavaTest02 extends HttpServlet {
       
    public JavaTest02() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item = request.getParameter("item");
		
		System.out.println("item 파라미터"+item);
		
		// item이라는 이름으로 오는 다수의 parameter를 받는 String 배열
		String[] items = request.getParameterValues("item");
		for(String s: items) {
			System.out.println("여러 개: "+s);
		}
		
		response.setContentType("text/html; charset=UTF-8");	// 한글처리
		
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("	<head>");
		writer.println("		<title>JavaTest02의 응답화면</title>");
		writer.println("	</head>");
		
		writer.println("	<body>");
		writer.println("		<h3>Nothing</h3>");
		writer.println("	</body>");
		writer.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
