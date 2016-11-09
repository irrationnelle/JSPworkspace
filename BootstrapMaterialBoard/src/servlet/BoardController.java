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
import service.CommentService;
import vo.ArticlePageVO;
import vo.ArticleVO;
import vo.CommentPageVO;

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
		CommentService cService = CommentService.getInstance();
		
		if(action == null) {
			action="main";
		}
		
		String articleIdStr = null;
		int articleId = 0;
		int result = -1;
		ArticleVO article = null;
		String title = null;
		String content = null;
		
		HttpSession session = request.getSession();
		
		switch(action){
		
		case "main":
			viewPath = "start_template_encode.jsp";
			break;
			
		case "refresh":
			viewPath = "board.do?action=board";
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
			
		case "write":
			request.setCharacterEncoding("euc-kr");	
			
			title = request.getParameter("title");
			String id = (String)session.getAttribute("id");
			content = request.getParameter("content");
			
			article = new ArticleVO();
			article.setTitle(title);
			article.setId(id);
			article.setContent(content);
			
			service = BoardService.getInstance();
			result = service.write(article);
			
			System.out.println("글쓰기 결과: "+result);
			break;
			
		case "read":
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			
			article = service.read(articleId);
			request.setAttribute("article", article);
			
			// comment 포워딩
			int cPage = 1;
			
			String cPageStr = request.getParameter("cPage");
			if(cPageStr != null) {
				cPage = Integer.parseInt(cPageStr);
			}
			
			CommentPageVO commentPage = cService.makeCommentPage(articleId, cPage);
			request.setAttribute("commentPage", commentPage);
			
			viewPath = "start_read.jsp";
			break;
			
		case "update":
			request.setCharacterEncoding("euc-kr");	
			
			title = request.getParameter("title");
			content = request.getParameter("content");
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			
			article = new ArticleVO();
			article.setTitle(title);
			article.setContent(content);
			article.setArticleId(articleId);
			article.setId((String)session.getAttribute("id"));
			
			
			result = service.modify(article);
			
			System.out.println("글수정결과: "+result);
			break;
			
		case "updateWithoutRead":
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			
			article = service.read(articleId);
			request.setAttribute("article", article);
			break;
			
		case "delete":
			
			title = request.getParameter("title");
			content = request.getParameter("content");
			articleIdStr = request.getParameter("articleId");
			articleId = Integer.parseInt(articleIdStr);
			
			article = new ArticleVO();
			article.setTitle(title);
			article.setContent(content);
			article.setArticleId(articleId);
			
			result = service.delete(article);
			
			System.out.println("글삭제결과: "+result);
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}
}
