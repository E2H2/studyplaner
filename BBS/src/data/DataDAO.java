package data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// 모든 할일+ 타이머 관련 데이터 DAO
public class DataDAO {
		// dao : 데이터베이스 접근 객체의 약자
		private Connection conn; // connection:db에접근하게 해주는 객체
		//private PreparedStatement pstmt;
		private ResultSet rs;
		// mysql 처리부분
		public DataDAO() {
		// 생성자를 만들어준다.
			try {
				String dbURL = "jdbc:mysql://localhost:3306/BBS?&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
				String dbID = "root";
				String dbPassword = "tiger";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
	}