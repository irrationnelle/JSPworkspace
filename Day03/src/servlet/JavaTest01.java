package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JavaTest01")	// �ش� annotation�� ������ web.xml�� ������ ������־�� �Ѵ�.
public class JavaTest01 extends HttpServlet {
	private static final long serialVersionUID = 1L;	// Ŭ���� �ĺ� ���

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _clientName = request.getParameter("clientName");	// request ��ü���� Ŭ���̾�Ʈ�κ��� ���� parameter�� _clientName�� ����.
		System.out.println("JavaTest01 ������ Get��� ��û�� ����! \n" + _clientName);
		response.setContentType("text/html; charset=UTF-8");	// �ѱ�ó��
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("	<head>");
		writer.println("		<title> �ڹ� ������ ����ȭ��</title>");
		writer.println("	</head>");
		
		writer.println("	<body>");
		writer.println("		<h3>����� ���� clientName ��:"+ _clientName +"</h3>");
		writer.println("	</body>");
		writer.println("</html>");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _clientName = request.getParameter("clientName");	// request ��ü���� Ŭ���̾�Ʈ�κ��� ���� parameter�� _clientName�� ����.
		System.out.println("JavaTest01 ������ Post��� ��û�� ����! \n" + _clientName);
		response.setContentType("text/html; charset=UTF-8");	// �ѱ�ó��
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("	<head>");
		writer.println("		<title> �ڹ� ������ ����ȭ��</title>");
		writer.println("	</head>");
		
		writer.println("	<body>");
		writer.println("		<h3>����� ���� clientName ��:"+ _clientName +"</h3>");
		writer.println("	</body>");
		writer.println("</html>");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
