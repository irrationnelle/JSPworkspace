package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JavaTest01")	// 해당 annotation이 없으면 web.xml에 서블릿을 등록해주어야 한다.
public class JavaTest01 extends HttpServlet {
	private static final long serialVersionUID = 1L;	// 클래스 식별 상수

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _clientName = request.getParameter("clientName");	// request 객체에서 클라이언트로부터 받은 parameter를 _clientName에 저장.
		System.out.println("JavaTest01 서블릿이 Get방식 요청을 받음! \n" + _clientName);
		response.setContentType("text/html; charset=UTF-8");	// 한글처리
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("	<head>");
		writer.println("		<title> 자바 서블릿의 응답화면</title>");
		writer.println("	</head>");
		
		writer.println("	<body>");
		writer.println("		<h3>당신이 보낸 clientName 값:"+ _clientName +"</h3>");
		writer.println("	</body>");
		writer.println("</html>");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _clientName = request.getParameter("clientName");	// request 객체에서 클라이언트로부터 받은 parameter를 _clientName에 저장.
		System.out.println("JavaTest01 서블릿이 Post방식 요청을 받음! \n" + _clientName);
		response.setContentType("text/html; charset=UTF-8");	// 한글처리
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("	<head>");
		writer.println("		<title> 자바 서블릿의 응답화면</title>");
		writer.println("	</head>");
		
		writer.println("	<body>");
		writer.println("		<h3>당신이 보낸 clientName 값:"+ _clientName +"</h3>");
		writer.println("	</body>");
		writer.println("</html>");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
