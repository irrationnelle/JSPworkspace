package servlet;

import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class DownloadServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String folderPath = "c:/uploaded/";
		String filename = "01.jpg";
		String fileURL = folderPath + filename;
		
		// 서버가 html이 아닌 파일 정보를 전달할 거라는 이야기.
		response.setHeader("Content-Disposition",  "attachment;filename="+ new String(filename.getBytes(), "ISO8859_1"));
		
		FileInputStream fis = new FileInputStream(fileURL);
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buf = new byte[1024];
		int size = 0;
		while((size = fis.read(buf)) != -1) {
			sos.write(buf, 0, size);
			sos.flush();
		}
		fis.close();
		sos.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
