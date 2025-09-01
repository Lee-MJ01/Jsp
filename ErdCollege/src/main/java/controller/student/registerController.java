package controller.student;

import java.io.IOException;

import dto.RegisterDTO;
import dto.StudentDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servise.RegisterService;
import servise.StudentService;

@WebServlet("/student/register.do")
public class registerController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private StudentService service = StudentService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/student/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String stdNo = req.getParameter("stdNo");
		String stdName = req.getParameter("stdName");
		String stdHp = req.getParameter("stdHp");
		String stdYear = req.getParameter("stdYear");
		String stdAddress = req.getParameter("stdAddress");

		StudentDTO dto = new StudentDTO();
		dto.setStdNo(stdNo);
		dto.setStdName(stdName);
		dto.setStdHp(stdHp);
		dto.setStdYear(stdYear);
		dto.setStdAddress(stdAddress);
		service.regist(dto);
		
		resp.sendRedirect("/ErdCollege/student/list.do");
	}
	
}
