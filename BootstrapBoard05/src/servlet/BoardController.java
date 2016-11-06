package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		ArticleVO article = null;
		
		String articleIdStr = null;
		int articleId = 0;
		String title = null;
		String writer = null;
		String password = null;
		String content = null;
		
		int result = -1;
		
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
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			
			article = service.read(articleId);
			
			request.setAttribute("article", article);
			
			viewPath="read.jsp";
			break;
		
		case "writeForm":
			viewPath="write_form.jsp";
			break;
		
		case "write":
			request.setCharacterEncoding("euc-kr");
			
			title = request.getParameter("title");
			writer = request.getParameter("writer");
			password = request.getParameter("password");
			content = request.getParameter("content");
			
			result = service.write(title, writer, password, content);
			
			viewPath="board.do?action=main";
			System.out.println("글쓰기 결과: "+result);
			break;
			
		case "updateForm":
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			article = service.readWithoutReadCount(articleId);

			request.setAttribute("article", article);
			viewPath = "update_form.jsp";
			break;
			
		case "update":
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			title = request.getParameter("title");
			writer = request.getParameter("writer");
			password = request.getParameter("password");
			content = request.getParameter("content");
			
			result = service.modify(articleId, title, writer, password, content);
			
			viewPath = "board.do?action=main";
			System.out.println("글수정 결과: "+result);
			break;
		
		case "deleteForm":
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			
			article = service.readWithoutReadCount(articleId);
			
			request.setAttribute("article", article);
			
			viewPath="delete_form.jsp";
			break;
			
		case "delete":
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			password = request.getParameter("password");
			
			result = service.delete(articleId, password);
			viewPath="board.do?action=main";
			System.out.println("글삭제 결과: "+result);
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
