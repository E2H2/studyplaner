package data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// ��� ����+ Ÿ�̸� ���� ������ DAO
public class DataDAO {
		// dao : �����ͺ��̽� ���� ��ü�� ����
		private Connection conn; // connection:db�������ϰ� ���ִ� ��ü
		//private PreparedStatement pstmt;
		private ResultSet rs;
		// mysql ó���κ�
		public DataDAO() {
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
		
		
		
		
		
		
		
	}