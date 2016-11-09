package servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FileDAO;
import vo.FileVO;

@WebServlet("/file.do")
public class FileController extends HttpServlet {
	private FileDAO dao = FileDAO.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String viewPath = "";
		
		if(action == null) {
			action = "fileList";
		}
		
		switch(action) {
		
		//현재 서버에 업로드된 파일 목록 보여주기
		case "fileList":
			List<FileVO> fileList = dao.selectFileList();
			request.setAttribute("fileList", fileList);
			viewPath = "file_list.jsp";
			break;
			
		case "uploadForm":
			viewPath = "upload_form.jsp";
			break;
			
		case "download":
			String fileNumStr = request.getParameter("fileNum");
			if(fileNumStr != null && fileNumStr.length()>0) {
				int fileNum = Integer.parseInt(fileNumStr);
			}
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
		dispatcher.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드 시 post 방식으로 요청 전달
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
		// 서버에 저장되는 문장
		File file = mRequest.getFile("uploadFile");
		
		// 폴더에 저장된 파일 정보를 DB에 insert 시키기
		FileVO fileVO = new FileVO();
		fileVO.setFileName(mRequest.getOriginalFileName("uploadFile"));
		fileVO.setSavedPath(file.getAbsolutePath());
		fileVO.setDownCount(0);
		fileVO.setFileSize((int)file.length());
		
		int result = dao.insert(fileVO);
		
		request.setAttribute("uploadResult", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("upload_result.jsp");
		dispatcher.forward(request, response);
	}
}
