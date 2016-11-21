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
		// keyword 다음에 오는 것은 옵션
		String urlStr = "https://openapi.naver.com/v1/search/book.xml?query="+keyword+"&display=20";
		
		URL url = new URL(urlStr);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("X-Naver-Client-Id", "4TNgV8a3Wjgd3SUoP7qM");
		connection.setRequestProperty("X-Naver-Client-Secret", "Ufxa6z7UVv");
		
		// 여기까지는 연결작업
		
		// 여기서부터 네이버의 데이터 읽어오는 작업
		
		// input Stream을 받아올 때 더 효율좋게 받아오기 위해 BufferedReader로 감싸준다.
		BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
		
		// 반복문을 수행할 때 String을 상수로 계속 붙이는 것을 방지하기 위해 StringBuffer 객체 생성
		StringBuffer result = new StringBuffer();
		String line;
		
		while((line = br.readLine()) != null) {
			result.append(line);
		}
		
//		System.out.println(result.toString());
		
		// 클라이언트에게 결과 데이터(xml) 응답하기
		response.setContentType("text/xml;charset=UTF-8");
		response.getWriter().write(result.toString());
	}
}
