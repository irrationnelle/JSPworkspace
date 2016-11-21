package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchBook.do")
public class NaverServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("search.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		// keyword ������ ���� ���� �ɼ�
		String urlStr = "https://openapi.naver.com/v1/search/book.xml?query="+keyword+"&display=20";
		
		URL url = new URL(urlStr);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("X-Naver-Client-Id", "4TNgV8a3Wjgd3SUoP7qM");
		connection.setRequestProperty("X-Naver-Client-Secret", "Ufxa6z7UVv");
		
		// ��������� �����۾�
		
		// ���⼭���� ���̹��� ������ �о���� �۾�
		
		// input Stream�� �޾ƿ� �� �� ȿ������ �޾ƿ��� ���� BufferedReader�� �����ش�.
		BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
		
		// �ݺ����� ������ �� String�� ����� ��� ���̴� ���� �����ϱ� ���� StringBuffer ��ü ����
		StringBuffer result = new StringBuffer();
		String line;
		
		while((line = br.readLine()) != null) {
			result.append(line);
		}
		
//		System.out.println(result.toString());
		
		// Ŭ���̾�Ʈ���� ��� ������(xml) �����ϱ�
		response.setContentType("text/xml;charset=UTF-8");
		response.getWriter().write(result.toString());
	}
}
