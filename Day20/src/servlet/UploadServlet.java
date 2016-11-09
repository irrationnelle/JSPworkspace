package servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String uploadFolder = "c://uploaded//";
		
		// MultipartRequest 클래스의 생성자는 매우 여러가지.
		// 두번째 인자는 서버의 어느 위치에 저장할 것인지 디렉터리 경로를 나타낸다.
		// 세번째 인자는 파일 용량 최대 크기
		MultipartRequest mRequest = new MultipartRequest(request, uploadFolder, 1024*1024*5, "euc-kr", new DefaultFileRenamePolicy());
		
		// 실제 업로드가 진행되는 부분
		// File 객체는 실제로 파일이 저장.
		// MultipartRequest 객체는 파일이 저장되기 전 http 요청을 받을 때
		// 원 파일의 정보를 가진 채 필요할 때 클라이언트에게 전달하기 위한 객체 
		// 파일 업로드에서는 request를 받아 MultipartRequest로 가공해서 처리하기 때문에
		// 이후에는 request가 아닌 MultipartRequest 객체를 통해 getParameter 작업을 수행해야 한다.
		File file = mRequest.getFile("uploadFile");
		
		System.out.println("원본 파일 이름: "+mRequest.getOriginalFileName("uploadFile"));
		System.out.println("저장된 이름: "+file.getName());
		System.out.println("저장된 전체 경로: "+file.getAbsolutePath());
		System.out.println("파일 아닌 일반 파라미터: "+mRequest.getParameter("param"));
	}
}
