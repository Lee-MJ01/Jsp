package servise;

import java.util.List;

import dao.RegisterDAO;
import dto.RegisterDTO;

public enum RegisterService {
	INSTANCE;
	
	RegisterDAO dao = RegisterDAO.getInstance();
	
	public RegisterDTO findById(String regStdNo, int RegLecNo) {
		return dao.select(regStdNo, RegLecNo);
	}
	public List<RegisterDTO> findAll() {
		return dao.selectAll();
	}
	public void regist(RegisterDTO dto) {
		dao.insert(dto);
	}
	public void modify(RegisterDTO dto) {
		dao.update(dto);
	}
	public void remove(String regStdNo, int RegLecNo) {
		dao.delete(regStdNo, RegLecNo);
	}
}
