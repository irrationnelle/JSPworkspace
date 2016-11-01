package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.ArticlePageVO;

// board.do로 요청을 보낸 경우
@WebServlet(urlPatterns="/board.do")
public class BoardController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// form 태그에서 넘어오는 한글 parameter 인코딩
		request.setCharacterEncoding("euc-kr");
		execute(request, response);
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String viewPath = "";
		
		BoardService service = BoardService.getInstance();
		
		if(action == null || action.equals("main")) {
			// action 값이 main 또는 null: 게시판 목록보기
			String pageStr = request.getParameter("page");
			int page = 1;
			if(pageStr != null && pageStr.length()>0) {
				page = Integer.parseInt(pageStr);
			}
			ArticlePageVO articlePage = service.makePage(page);
			request.setAttribute("articlePage", articlePage);
			
			viewPath = "board_list.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		
		dispatcher.forward(request, response);
	}
}
