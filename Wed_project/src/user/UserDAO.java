package user;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/WED_PROJECT?&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "비밀번호";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		
		String sql = "SELECT userPassword FROM USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					if(userID.equals("admin"))
						return 2;  // 관리자 로그인
					return 1;  // 일반회원 로그인
				}
				else // 비밀번호 불일치
					return 0;
			}
			 // 아이디가 존재하지 않음
			return -1;
		}catch(Exception e) {}
		
		// 데이터베이스 오류
		return -2;
	}
	
	public int join(User user) {
		
		String sql = "INSERT INTO USER VALUES (?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5, user.getUserGender());
			pstmt.setString(6, user.getUserEmail());
			
			return pstmt.executeUpdate();
		
		} catch (SQLException e) {}

		// 데이터베이스 오류
		return -1;	
	}
	
	//user를 가져오는 함수
	public int getNext() { 
			
		String SQL = "SELECT userNo FROM USER ORDER BY userNo DESC LIMIT 10";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
				
			// 다음 게시물을 가져오기
			if(rs.next())
				return rs.getInt(1) + 1;
					
			return 1;//첫 번째 게시물인 경우
				
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return -1; //데이터베이스 오류
	}
	
	//수정 함수
	public int update(String userID, String userPassword, String userName, String userGender, String userEmail) {

		String SQL = "UPDATE USER SET userPassword = ?, userName= ?, userGender = ?, userEmail = ? WHERE userID = ?";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userPassword);
			pstmt.setString(2, userName);
			pstmt.setString(3, userGender);
			pstmt.setString(4, userEmail);
			pstmt.setString(5, userID);
				
			return pstmt.executeUpdate();

		} catch (Exception e) {}
			return -1; // 데이터베이스 오류
		}
		
	//삭제 함수
	public int delete(String userID) {

		String SQL = "DELETE USER WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);   
			pstmt.setString(1, userID);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
		
	public ArrayList<User> getList(int pageNumber){
		
		String SQL = "SELECT * FROM USER WHERE userNo >= ? ORDER BY userNo DESC LIMIT 10";	
		ArrayList<User> list = new ArrayList<User>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, (getNext() - (pageNumber) * 10));
			rs = pstmt.executeQuery();

			while (rs.next()) {

				User user = new User();
				user.setUserNo(rs.getInt(1));
				user.setUserID(rs.getString(2));
				user.setUserPassword(rs.getString(3));
				user.setUserName(rs.getString(4));
				user.setUserGender(rs.getString(5));
				user.setUserEmail(rs.getString(6));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list; 
	}
		
	//10 단위 페이징 처리를 위한 함수
	public boolean nextPage (int pageNumber) {
		
		String SQL = "SELECT * FROM USER WHERE userNo < ? ORDER BY userNo DESC LIMIT 10";
		ArrayList<User> list = new ArrayList<User>();
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, (getNext() - (pageNumber) * 10));
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}			
		return false; 		
	}
}

