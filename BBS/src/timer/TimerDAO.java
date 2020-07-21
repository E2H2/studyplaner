package timer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import timer.Timer;

//import java.util.ArrayList;
public class TimerDAO {
		// dao : �����ͺ��̽� ���� ��ü�� ����
		private Connection conn; // connection:db�������ϰ� ���ִ� ��ü
		private PreparedStatement pstmt;
		private ResultSet rs;
		// mysql ó���κ�
		public TimerDAO() {
		// �����ڸ� ������ش�.
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
		//������ �ð��� �������� �Լ�
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
			return ""; //�����ͺ��̽� ����
		}
				
		//�ٸ��������� �̵��� �ӽ� ���� �ϴ� �Լ� 
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
		return -1; // DB ����
		}
		
		//�ٽ� ���ε��� ����� Ÿ�̸� ���� �ҷ�����
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
		
		//�α׾ƿ��� Ÿ�̸� �����ϴ� �Լ�
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
			return null; //�����ͺ��̽� ����
			
		}
		
}
		
			
			
			
		