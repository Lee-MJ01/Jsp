package dao;

import java.util.ArrayList;
import java.util.List;

import dto.RegisterDTO;
import util.DBHelper;

public class RegisterDAO extends DBHelper {
	private static final RegisterDAO INSTANCE = new RegisterDAO();
	public static RegisterDAO getInstance() {
		return INSTANCE;
	}
	private RegisterDAO() {}
	
	public RegisterDTO select(String regStdNo, int RegLecNo) {
		
		return null;
	}
	
	public List<RegisterDTO> selectAll() {
		List<RegisterDTO> dtoList= new ArrayList<RegisterDTO>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from register");
			
			while(rs.next()) {
				RegisterDTO dto = new RegisterDTO();
				dto.setRegStdNo(rs.getString(1));
				dto.setRegLecNo(rs.getInt(2));
				dto.setRegMidScore(rs.getInt(3));
				dto.setRegFinalScore(rs.getInt(4));
				dto.setRegTotalScore(rs.getInt(5));
				dto.setRegGrade(rs.getString(6));
				
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtoList;
	}
	public void insert(RegisterDTO dto) {
		try {
			conn = getConnection();
			
			String sql = "insert into register(regstdno, reglecno) values(?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getRegStdNo());
			psmt.setInt(2, dto.getRegLecNo());
			
			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void update(RegisterDTO dto) {}
	public void delete(String regStdNo, int RegLecNo) {}
	
}
