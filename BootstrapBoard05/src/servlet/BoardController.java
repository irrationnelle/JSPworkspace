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
import vo.ArticleVO;

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
		
		BoardService service = BoardService.getInstance();
		
		switch(action) {
		case "main":
			int currentPage = 0;
			String currentPageStr = request.getParameter("page");
			if(currentPageStr == null) {
				currentPage = 1;
			} else {
				currentPage = Integer.parseInt(currentPageStr);
			}
			
			ArticlePageVO articlePage = service.createArticlePage(currentPage);
			
			request.setAttribute("articlePage", articlePage);
			
			viewPath="board_list.jsp";
			break;
		
		case "read":
			String articleIdStr = request.getParameter("articleId");
			int articleId = Integer.parseInt(articleIdStr);
			
			ArticleVO article = service.read(articleId);
			
			request.setAttribute("article", article);
			
			viewPath="read.jsp";
			break;
		
		case "writeForm":
			viewPath="write_form.jsp";
			break;
		
		case "write":
			request.setCharacterEncoding("euc-kr");
			
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
			
			int result = service.write(title, writer, password, content);
			
			viewPath="board.do?action=main";
			System.out.println("글쓰기 결과: "+result);
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
