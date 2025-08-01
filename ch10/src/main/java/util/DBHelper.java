package util;

import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;

public class DBHelper {
	
	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection(String dbcp) throws NamingException, SQLException{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("dbcp"); // 커넥션 풀 명
		
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
		
		if(conn != null) {
			conn.close();
		}
	}
	
}















