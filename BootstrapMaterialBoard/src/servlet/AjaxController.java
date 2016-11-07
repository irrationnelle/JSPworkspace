package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.ArticleVO;

@WebServlet("/data.do")
public class AjaxController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
		BoardService service = BoardService.getInstance();
		request.setCharacterEncoding("euc-kr");	
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String password = request.getParameter("password");
		String articleIdStr = request.getParameter("articleId");
		int articleId = Integer.parseInt(articleIdStr);
		
		ArticleVO article = new ArticleVO();
		article.setTitle(title);
		article.setWriter(writer);
		article.setContent(content);
		article.setPassword(password);
		article.setArticleId(articleId);
		
		int result = service.modify(article);
		
		response.getWriter().println("updateResult:"+result);
	};
}
