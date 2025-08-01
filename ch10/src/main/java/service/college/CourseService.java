package service.college;

import java.util.List;

import dao.college.StudentDAO;
import dto.college.StudentDTO;

public enum CourseService {
	INSTANCE;
	
	private StudentDAO dao = StudentDAO.getInstance();
	
	public void register(StudentDTO dto) {
		dao.insertStudent(dto);
	}
	public StudentDTO selectStudent(String stdNo) {
		
		return dao.selectStudent(stdNo);
	}
	public List<StudentDTO> selectAllStudent() {
		
		
		return dao.selectAllStudent();
	}
	public void updateStudent(StudentDTO dto) {
		dao.updateStudent(dto);
	}
	public void deleteStudent(String stdNo) {
		dao.deleteStudent(stdNo);
	}
}
