package dao;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() { return instance; }
	private final String DB_DRIVER = "org.mariadb.jdbc.Driver";
	
	private MemberDAO() {
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("DriverLoading Fail!");
			e.printStackTrace();
		}
	}
}
