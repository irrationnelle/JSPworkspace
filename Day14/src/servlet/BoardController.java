package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/board.do")
public class BoardController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	// doGet과 doPost는 오버라이딩. 아래의 execute는 임의 지정.
	// get으로 받든, post로 받든 execute 메소드를 통해 실행시킴.
	public void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String viewPath = "";
		
		if(action == null || action.equals("main")) {
			request.setAttribute("articlePage", "게시글 목록 데이터");
			viewPath = "main.jsp";
		} else if(action.equals("writeForm")) {
			viewPath = "write_form.jsp";
		} else if(action.equals("write")) {
			request.setAttribute("writeResult", "글쓰기 수행결과 데이터");
			viewPath = "write_result.jsp";
		}
		
		// 선택된 jsp 뷰에게 forward를 하기 위한 객체
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
