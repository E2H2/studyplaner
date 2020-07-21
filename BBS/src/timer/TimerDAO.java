package timer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import timer.Timer;

//import java.util.ArrayList;
public class TimerDAO {
		// dao : 데이터베이스 접근 객체의 약자
		private Connection conn; // connection:db에접근하게 해주는 객체
		private PreparedStatement pstmt;
		private ResultSet rs;
		// mysql 처리부분
		public TimerDAO() {
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
		//현재의 시간을 가져오는 함수
		public String getDate() { 
			String SQL = "SELECT NOW()";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return ""; //데이터베이스 오류
		}
				
		//다른페이지로 이동시 임시 저장 하는 함수 
		public int saveTimer( String userID, String time) {
			String SQL = "INSERT INTO timer VALUES (?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, time);
			pstmt.setString(3, getDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
		}
		
		//다시 메인들어가면 저장된 타이머 내용 불러오기
		public Timer loadTimer(String userID) {
			String SQL = "SELECT * FROM timer WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Timer timer = new Timer();
				timer.setUserID(rs.getString(1));
				timer.setTime(rs.getString(2));
				timer.setTimerdate(rs.getString(3));
				return timer;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
		}
		
		//로그아웃시 타이머 리셋하는 함수
		public Timer resetTimer(String userID) {
			String SQL = "DELETE FROM timer WHERE userID= ?";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,userID);		
				Timer timer = new Timer();
				return timer;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null; //데이터베이스 오류
			
		}
		
}
		
			
			
			
		