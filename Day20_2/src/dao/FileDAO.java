package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.FileVO;

public class FileDAO {
	private static FileDAO instance = new FileDAO();
	public static FileDAO getInstance() {
		return instance;
	}
	
	private FileDAO() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading Fail!");
			e.printStackTrace();
		}
	}
	
	public List<FileVO> selectFileList() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<FileVO> fileList = new ArrayList<>();
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT * FROM file_board";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				FileVO file = new FileVO();
				file.setFileNum(rs.getInt(1));
				file.setFileName(rs.getString(2));
				file.setSavedPath(rs.getString(3));
				file.setDownCount(rs.getInt(4));
				file.setFileSize(rs.getInt(5));
				fileList.add(file);
			}
		} catch (SQLException e) {
			System.out.println("selectFileList fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(stmt);
			DBHelper.close(con);
		}
		
		return fileList;		
	}
	
	public int insert(FileVO fileVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "INSERT INTO file_board (file_name, saved_path, down_count, file_size) VALUES(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, fileVO.getFileName());
			pstmt.setString(2, fileVO.getSavedPath());
			pstmt.setInt(3, fileVO.getDownCount());
			pstmt.setInt(4, fileVO.getFileSize());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		
		return result;
	}

	public FileVO selectFile(int fileNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FileVO result = null;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT * FROM file_board WHERE file_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fileNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new FileVO();
				result.setFileNum(rs.getInt(1));
				result.setFileName(rs.getString(2));
				result.setSavedPath(rs.getString(3));
				result.setDownCount(rs.getInt(4));
				result.setFileSize(rs.getInt(5));
			}
		} catch (SQLException e) {
			System.out.println("selectFile Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return result;
	}
	
	public int updateDownCount(int fileNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "UPDATE file_board SET down_count=down_count+1 WHERE file_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fileNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateDownCount fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		
		return result;
	}
}
