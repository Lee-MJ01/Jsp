package dao;

import java.util.ArrayList;
import java.util.List;

import dto.CustomerDTO;
import dto.OrderDTO;
import dto.ProductDTO;
import util.DBHelper;

public class OrderDAO extends DBHelper{

	private static final OrderDAO INSTANCE = new OrderDAO();
	
	public static OrderDAO getInstance() {
		return INSTANCE;
	}
	private OrderDAO() {}
	
	public void insertOrder(OrderDTO dto) {
		try {
			conn = getConnection();
			String sql = "insert into \"Order\"(orderid,orderproduct,ordercount,orderdate) values(?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getOrderId());
			psmt.setInt(2, dto.getOrderproduct());
			psmt.setInt(3, dto.getOrderCount());
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
