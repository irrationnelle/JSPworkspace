package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.MemberVO;

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
		// action의 parameter로 요청 종류 파악
		String action = request.getParameter("action");
		String viewPath = "";
		MemberService service = MemberService.getInstance();
		
		switch(action) {
		case "joinForm":
			// 회원가입 양식 보여주기
			viewPath = "join_form.jsp";
			break;
			
		case "join":
			//입력한 내용으로 회원가입 진행
			MemberVO member = new MemberVO();
			member.setId(request.getParameter("id"));
			member.setPassword(request.getParameter("password"));
			member.setName(request.getParameter("name"));
			member.setEmail(request.getParameter("email"));
			
			if(service.join(member) == true) {
				viewPath = "join_success.jsp";
			} else {
				viewPath = "join_fail.jsp";
			}
			break;
		case "login":
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			if(service.login(id, password) == true) {
				HttpSession session = request.getSession();
				session.setAttribute("loginId", id);
			} else {
			}
			viewPath = "login_result.jsp";
			break;
		case "logout":
			HttpSession session = request.getSession();
			session.invalidate();
			viewPath = "logout.jsp";
			break;
		}
		
		//자바 서블릿의 작업이 긑났으면 jsp에게 forward하기
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
