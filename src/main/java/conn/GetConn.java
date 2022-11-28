package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import guest.GuestVO;

public class GetConn {
	private Connection conn = null;	//커넥션
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String driver ="com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaworks";
	private String user = "root";
	private String password = "1234";
	
	//필드를 만들때 생성 (geter 만들어 주기)
	private static GetConn instance = new GetConn();
	
	//객체 생성시에 DB연결
	private GetConn() { //싱글톤은 외부에서 사용 못하기 떄문에 private
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			//라이브러리 확인
			System.out.println("드라이버 검색 실패~~");
		} catch (SQLException e) {
			//url user pwd 확인
			System.out.println("Database 연동 실패");
		}
	}
	
	public Connection getConn() {
		return conn;
	}
	
	
	//객체 소멸처리
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}

	public static GetConn getInstance() {
		return instance;
	}
	
	
}
