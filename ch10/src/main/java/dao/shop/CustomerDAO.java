package dao.shop;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.shop.CustomerDTO;
import util.DBHelper;

public class CustomerDAO extends DBHelper{
	
	private static final CustomerDAO INSTANCE = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return INSTANCE;
	}
	private CustomerDAO() {}
	private final String DBCP = "jdbc/shop";
	
	// 로거 생성
	private Logger logger = LoggerFactory(this.getClass());
	
	public void insertCustomer(CustomerDTO dto) {
		try {
			conn = getConnection("DBCP");
			String sql = "insert into customer values(?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getRdate());
			
			psmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			// e.printStackTrace(); // 개발과정에서만 콘솔로 확인하는 것. 실제 배포가 되었을 때는 이렇게 안함(로그 기록해야함)
			logger.error(e.getMessage());
		}
	}
	
	private Logger LoggerFactory(Class<? extends CustomerDAO> class1) {
		// TODO Auto-generated method stub
		return null;
	}
	public CustomerDTO selectCustomer(String cid) {
		CustomerDTO dto = null;
		try {
			conn = getConnection("DBCP");
			
			String sql = "select * from customer where cid = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new CustomerDTO();
				dto.setCid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAddress(rs.getString(4));
				dto.setRdate(rs.getString(5));
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<CustomerDTO> selectAllCustomer() {
		List<CustomerDTO> dtolist = new ArrayList<CustomerDTO>(); 
		
		try {
			conn = getConnection("DBCP");
			stmt=conn.createStatement();
			String sql = "select * from customer";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				dto.setCid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAddress(rs.getString(4));
				dto.setRdate(rs.getString(5));
				
				dtolist.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtolist;
	}
	
	public void updateCustomer(CustomerDTO dto) {
		// 내가 구현
	}
	
	public void deleteCustomer(CustomerDTO dto) {
		
	}
}
