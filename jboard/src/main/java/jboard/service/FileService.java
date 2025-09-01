package jboard.service;

import java.util.List;

import jboard.DAO.ArticleDAO;
import jboard.DAO.FileDAO;
import jboard.DTO.ArticleDTO;
import jboard.DTO.FileDTO;

public enum FileService {
	INSTANCE;
	
	private FileDAO dao = FileDAO.getInstance();
	
	public void register(FileDTO dto) {
		dao.insert(dto);
	}
	
	public FileDTO findById(int fno) {
		return dao.select(fno);
	}
	public List<FileDTO> findAll() {
		return dao.selectAll();
	}
	public void modify(FileDTO dto) {
		dao.update(dto);
	}
	public void remove(int fno) {
		dao.delete(fno);
	}
}
