package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommentService;
import vo.CommentPageVO;
import vo.CommentVO;

@WebServlet("/comment.do")
public class CommentController extends HttpServlet{
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
		CommentService service = CommentService.getInstance();
		
		if(action == null) {
			action = "write";
		}
		
		switch(action) {
		case "write":
			String articleIdStr = request.getParameter("articleId");
			int articleId = -1;
			if(articleIdStr != null) {
				articleId = Integer.parseInt(articleIdStr);
			}
			System.out.println(articleId);
			String id = request.getParameter("id");
			String content = request.getParameter("content");
			int result = -1;
			
			CommentVO comment = new CommentVO();
			comment.setArticleId(articleId);
			comment.setId(id);
			comment.setContent(content);
			
			result = service.write(comment);
			System.out.println("Comment Write Result: "+result);
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
	}

}
