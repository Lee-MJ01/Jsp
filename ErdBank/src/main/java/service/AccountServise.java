package service;

import java.util.List;

import dao.AccountDAO;
import dto.AccountDTO;

public enum AccountServise {
	INSTANCE;
	
	private AccountDAO dao = AccountDAO.getIntance();
	
	public AccountDTO findById(String a_no) {
		return dao.select(a_no);
	}
	public List<AccountDTO> findAll() {
		return dao.selectAll();
	}
	public void regist(AccountDTO dto) {
		dao.insert(dto);
	}
	public void modify(AccountDTO dto) {
		dao.update(dto);
	}
	public void remove(String a_no) {
		dao.delete(a_no);
	}
}
