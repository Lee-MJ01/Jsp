package service.shop;

import java.util.List;

import dao.shop.CustomerDAO;
import dto.shop.CustomerDTO;

// enum : 상수 열거형=> 열거형으로 싱클톤 객체 생성 
public enum CustomerService {
	
	INSTANCE;
	private CustomerDAO dao = CustomerDAO.getInstance();
	
	public void register(CustomerDTO dto) {
		dao.insertCustomer(dto);
	}
	
	public CustomerDTO findById(String cid) {
		return dao.selectCustomer(cid);
	}
	
	public List<CustomerDTO> findAll() {
		return dao.selectAllCustomer();
	}
	
	public void modify(CustomerDTO dto) {
		dao.updateCustomer(dto);
	}
	
	public void delete(CustomerDTO dto) {
		dao.deleteCustomer(dto);
	}
	
}
