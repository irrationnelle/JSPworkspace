package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MapService;

// board.do�� ��û�� ���� ���
@WebServlet(urlPatterns="/map.do")
public class MapController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// form �±׿��� �Ѿ���� �ѱ� parameter ���ڵ�
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
