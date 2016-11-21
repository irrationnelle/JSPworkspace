package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MapService;

// board.do로 요청을 보낸 경우
@WebServlet(urlPatterns="/map.do")
public class MapController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// form 태그에서 넘어오는 한글 parameter 인코딩
		request.setCharacterEncoding("UTF-8");
		execute(request, response);
	}
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		
		MapService service = MapService.getInstance();
		
		String result = service.getXML(title);
		System.out.println(result);
		
		response.setContentType("text/xml;charset=UTF-8");
		response.getWriter().write(result.toString());
	}
}
