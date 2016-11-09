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
		File file = mRequest.getFile("uploadFile");
		
		System.out.println("���� ���� �̸�: "+mRequest.getOriginalFileName("uploadFile"));
		System.out.println("����� �̸�: "+file.getName());
		System.out.println("����� ��ü ���: "+file.getAbsolutePath());
		System.out.println("���� �ƴ� �Ϲ� �Ķ����: "+mRequest.getParameter("param"));
	}
}
