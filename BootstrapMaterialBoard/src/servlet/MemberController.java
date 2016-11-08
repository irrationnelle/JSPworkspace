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
		String action = request.getParameter("action");
		String viewPath = "";
		
		MemberService service = MemberService.getInstance();
		
		String id = null;
		String password = null;
		String name = null;
		String email = null;
		MemberVO member = null;
		
		int result = -1;
		boolean isLogin = false;
		
		HttpSession session = request.getSession();;
		
		switch(action){
		case "signup":
			id = request.getParameter("id");
			password = request.getParameter("password");
			name = request.getParameter("name");
			email = request.getParameter("email");
			
			member = new MemberVO();
			member.setId(id);
			member.setName(name);
			member.setPassword(password);
			member.setEmail(email);
			
			result = service.signup(member);
			System.out.println("Sign Up Result: "+result);
			break;
		
		case "login":
			id = request.getParameter("id");
			password = request.getParameter("password");
			
			member = new MemberVO();
			member.setId(id);
			member.setPassword(password);
			
			isLogin = service.login(member);
			
			
			if(isLogin) {
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				System.out.println("Login Result: Success");
				break;
			} else {
				System.out.println("Login Result: Fail");
				break;
			}
			
		case "logout":
			session.invalidate();
			viewPath = "board.do?action=main";
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
