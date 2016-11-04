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
		} else if (action.equals("writeForm")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("loginId")==null) {
				viewPath="board_list.jsp";
			} else {
				viewPath = "write_form.jsp";
			}
		} else if(action.equals("write")) {
			request.setCharacterEncoding("euc-kr");	
			
			HttpSession session = request.getSession();
			
			String loginId = (String)session.getAttribute("loginId");
			
			if(loginId != null) {
				// 로그인 상태에서만 글쓰기 가능
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				ArticleVO article = new ArticleVO();
				article.setTitle(title);
				article.setContent(content);
				article.setId(loginId);
				
				int result = service.write(article);
				request.setAttribute("writeResult", result);
				viewPath = "write_result.jsp";
			} else {
				viewPath = "board_list.jsp";
			}
			
			
		} else if(action.equals("read")) {
			String articleIDstr = request.getParameter("articleID");
			int articleID = 0;
			
			if(articleIDstr != null && articleIDstr.length()>0) {
				articleID = Integer.parseInt(articleIDstr);
			}
			
			ArticleVO article = service.read(articleID);
			
			request.setAttribute("article", article);
			viewPath = "read.jsp";
		} else if (action.equals("updateForm")) {
			String articleNumstr = request.getParameter("articleID");
			int articleNum = 0;
			
			if(articleIDstr != null && articleIDstr.length()>0) {
				articleID = Integer.parseInt(articleIDstr);
			}
			
			ArticleVO original = service.readWithoutReadCount(articleID);
			
			if(original == null) {
				System.out.println("null");
			} else if (original != null) {
				original.getTitle();
			}

			request.setAttribute("original", original);
			viewPath = "update_form.jsp";
		} else if (action.equals("update")) {
			request.setCharacterEncoding("euc-kr");

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String password = request.getParameter("password");
			String articleIdStr = request.getParameter("articleId");
			int articleId = 0;
			
			if(articleIdStr!=null && articleIdStr.length()>0){
				articleId = Integer.parseInt(articleIdStr);
			}

			ArticleVO article = new ArticleVO();
			article.setArticleId(articleId);
			article.setTitle(title);
			article.setContent(content);
			article.setPassword(password);
			
			int result = service.modify(article);
			request.setAttribute("updateResult", result);
			viewPath = "update_result.jsp";
		}
			
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		
		dispatcher.forward(request, response);
	}
}
