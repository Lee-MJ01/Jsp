package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBHelper {
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement psmt = null;
	private Statement stmt = null;
	
	public Connection getConnection(String dbcp) throws NamingException, SQLException{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("dbcp");
		
		return ds.getConnection();
	}
	
	public void closeAll() throws SQLException{
		if(rs != null) conn.close();
		if(stmt != null) stmt.close();
		if(psmt != null) psmt.close();
		if(conn != null) conn.close();
	}
}
