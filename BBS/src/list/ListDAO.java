package list;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import list.List;

public class ListDAO {

		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		//������ ���̵� ��� 
		public ListDAO() {
			try {
				String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
				String dbID ="root";
				String dbPassword ="tiger";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
				
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

		
		//�α׾ƿ��� ����Ʈ �����ϱ�
		public int savelist(List list) {
			String SQL = "INSERT INTO list VALUES (?,?,?,?,?,?,?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, list.getUserID());
				pstmt.setString(2, getDate());
				pstmt.setString(3, list.getList1());
				pstmt.setString(4, list.getList2());
				pstmt.setString(5, list.getList3());
				pstmt.setString(6, list.getList4());
				pstmt.setString(7, list.getList5());

				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // DB ����
		}
		//�ٽ� ���ε��� ����� ����Ʈ ���� �ҷ�����
		public List loadlist(String userID) {
			String SQL = "SELECT * FROM list WHERE userID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					List list = new List();
					list.setUserID(rs.getString(1));
					list.setDate(rs.getString(2));
					list.setList1(rs.getString(3));
					list.setList2(rs.getString(4));
					list.setList3(rs.getString(5));
					list.setList4(rs.getString(6));
					list.setList5(rs.getString(7));
					return list;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;	
		}
		
}


