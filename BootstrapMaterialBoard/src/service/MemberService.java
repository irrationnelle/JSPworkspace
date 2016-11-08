package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.DBHelper;
import dao.MemberDAO;
import vo.MemberVO;

public class MemberService {
	private static MemberService instance = new MemberService();
	public static MemberService getInstance() { return instance; }
	
	MemberDAO dao = MemberDAO.getInstance();
	
	public int signup(MemberVO member){
		int result = dao.insert(member);
		return result;
	}
	
	public boolean login(MemberVO member) {
		boolean isLogin = false;
		MemberVO original = dao.selectMember(member.getId());
		if(original.getPassword().equals(member.getPassword())) {
			isLogin = true;
		}
		return isLogin;
	}
}
