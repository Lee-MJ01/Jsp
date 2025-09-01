package util;

import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;

public class DBHelper {
	
	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected PreparedStatement psmt1 = null;
	protected PreparedStatement psmt2 = null;
	protected PreparedStatement psmt3 = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() throws NamingException, SQLException{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/bankERD"); // 커넥션 풀 명
		
		return ds.getConnection();
	}
	
	public void closeAll() throws SQLException {
		
		if(rs != null) {
			rs.close();
		}
		
		if(stmt != null) {
			stmt.close();
		}
		
		if(psmt != null) {
			psmt.close();
		}
		
		if(psmt1 != null) {
			psmt1.close();
		}
		
		if(psmt2 != null) {
			psmt2.close();
		}
		
		if(psmt3 != null) {
			psmt3.close();
		}
		
		if(conn != null) {
			conn.close();
		}
	}
	
}















