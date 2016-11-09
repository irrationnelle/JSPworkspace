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
		
		//���� ������ ���ε�� ���� ��� �����ֱ�
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
		// ���� ���ε� �� post ������� ��û ����
		request.setCharacterEncoding("euc-kr");
		
		String uploadFolder = "c://uploaded//";
		
		// MultipartRequest Ŭ������ �����ڴ� �ſ� ��������.
		// �ι�° ���ڴ� ������ ��� ��ġ�� ������ ������ ���͸� ��θ� ��Ÿ����.
		// ����° ���ڴ� ���� �뷮 �ִ� ũ��
		MultipartRequest mRequest = new MultipartRequest(request, uploadFolder, 1024*1024*5, "euc-kr", new DefaultFileRenamePolicy());
		
		// ���� ���ε尡 ����Ǵ� �κ�
		// File ��ü�� ������ ������ ����.
		// MultipartRequest ��ü�� ������ ����Ǳ� �� http ��û�� ���� ��
		// �� ������ ������ ���� ä �ʿ��� �� Ŭ���̾�Ʈ���� �����ϱ� ���� ��ü 
		// ���� ���ε忡���� request�� �޾� MultipartRequest�� �����ؼ� ó���ϱ� ������
		// ���Ŀ��� request�� �ƴ� MultipartRequest ��ü�� ���� getParameter �۾��� �����ؾ� �Ѵ�.
		// ������ ����Ǵ� ����
		File file = mRequest.getFile("uploadFile");
		
		// ������ ����� ���� ������ DB�� insert ��Ű��
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
