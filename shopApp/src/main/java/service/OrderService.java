package service;

import java.util.List;

import dao.CustomerDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dto.CustomerDTO;
import dto.OrderDTO;
import dto.ProductDTO;

public enum OrderService {
	
	INSTANCE;
	
	private OrderDAO dao = OrderDAO.getInstance();
	
	// DAO 요청메서드
	public void register(OrderDTO dto) {
		dao.insertOrder(dto);
	}
	
}
