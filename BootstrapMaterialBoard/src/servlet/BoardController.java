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
public class BoardController extends HttpServlet {

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
		
		if(action == null) {
			action="main";
		}
		
		String articleIdStr = null;
		int articleId = 0;
		int result = -1;
		ArticleVO article = null;
		
		switch(action){
		
		case "main":
			viewPath = "start_template_encode.jsp";
			break;
		
		case "board":
			String pageStr = request.getParameter("page");
			int pageNum = 1;
			if(pageStr != null && pageStr.length()>0) { // "" <-- 이게 들어오는 걸 방지하기 위해 pageStr.length()>0 검사도 넣어준다.
				pageNum = Integer.parseInt(pageStr);
			}
			
			ArticlePageVO articlePage = service.makePage(pageNum);
			
			request.setAttribute("articlePage", articlePage);
			viewPath = "start_board.jsp";
			break;
			
		case "read":
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			
			article = service.read(articleId);
			request.setAttribute("article", article);
			viewPath = "start_read.jsp";
			break;
			
		case "updateForm":
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			
			article = service.readWithoutReadCount(articleId);
			
			viewPath="start_update_form.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
