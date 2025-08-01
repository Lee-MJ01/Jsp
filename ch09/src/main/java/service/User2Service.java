package service;

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

import dao.User2DAO;
import dto.User2DTO;

public class User2Service {
	
	private static User2Service instance = new User2Service();
	
	public static User2Service getInstance() {
		return instance;
	}
	
	public User2Service() {}
	
	private User2DAO dao = User2DAO.getInstance();
	
	public void register(User2DTO dto) throws NamingException, SQLException {
		dao.insertUser2(dto);
	}
	
	public User2DTO findById(String user_id){
		return dao.selectUser2(user_id);
	}
	
	public List<User2DTO> findAll() throws NamingException, SQLException  {
		return dao.selectAllUser2();
	}
	
	public void modify(User2DTO dto) throws NamingException, SQLException {
		dao.updateUser2(dto);
	}
	
	public void delete(String user_id) throws NamingException, SQLException {
		dao.deleteUser2(user_id);
	}
	
}
