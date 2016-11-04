package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		execute(request, response);
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// action�� parameter�� ��û ���� �ľ�
		String action = request.getParameter("action");
		String viewPath = "";
		
		switch(action) {
		case "joinForm":
			// ȸ������ ��� �����ֱ�
			viewPath = "join_form.jsp";
			break;
			
		case "join":
			//�Է��� �������� ȸ������ ����
		}
		
		//�ڹ� ������ �۾��� �P������ jsp���� forward�ϱ�
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
