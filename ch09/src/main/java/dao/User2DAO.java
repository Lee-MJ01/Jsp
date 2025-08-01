package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.User2DTO;

public class User2DAO {
	private static User2DAO instance = new User2DAO();
	
	public static User2DAO getInstance() {
		return instance;
	}
	
	private User2DAO() {};
	
	public void insertUser2(User2DTO dto) throws NamingException, SQLException {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee2016");
		
		Connection conn = ds.getConnection();
		
		String sql = "insert into user2 values(?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, dto.getUser_id());
		psmt.setString(2, dto.getName());
		psmt.setString(3, dto.getHp());
		psmt.setInt(4, dto.getAge());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}
	
	public User2DTO selectUser2(String user_id){
		User2DTO dto = null;
		try {
			Context ctx = (Context) new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216");
			
			Connection conn = ds.getConnection();
			String sql = "select * from user2 where user_id = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new User2DTO();
				dto.setUser_id(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getString(4));
			}
			rs.close();
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<User2DTO> selectAllUser2() throws NamingException, SQLException {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216");
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user2");
		List<User2DTO> dtolist = new ArrayList<User2DTO>();
		while(rs.next()) {
			User2DTO dto = new User2DTO();
			dto.setUser_id(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAge(rs.getString(4));
			
			dtolist.add(dto);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		return dtolist;
	}
	
	public void updateUser2(User2DTO dto) throws NamingException, SQLException {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216");
		
		Connection conn = ds.getConnection();
		String sql = "update user2 set name = ?, hp =?, age = ? where user_id = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, dto.getUser_id());
		psmt.setString(2, dto.getName());
		psmt.setString(3, dto.getHp());
		psmt.setInt(4, dto.getAge());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}
	
	public void deleteUser2(String user_id) throws NamingException, SQLException {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216");
		
		Connection conn = ds.getConnection();
		String sql = "delete from user2 where user_id = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, user_id);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}
}
