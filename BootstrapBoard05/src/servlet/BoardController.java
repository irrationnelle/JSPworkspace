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

@WebServlet("/board.do")
public class BoardController extends HttpServlet{
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
		
		if(action == null || action.equals("main")) {
			int currentPage = 0;
			String currentPageStr = request.getParameter("page");
			if(currentPageStr == null) {
				currentPage = 1;
			} else {
				currentPage = Integer.parseInt(currentPageStr);
			}
			
			BoardService service = BoardService.getInstance();
			ArticlePageVO articlePage = service.createArticlePage(currentPage);
			
			request.setAttribute("articlePage", articlePage);
			
			viewPath="board_list.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
