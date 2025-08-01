package controller.college.student;

import java.io.IOException;
import java.util.List;

import dto.shop.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.college.StudentService;
import service.shop.CustomerService;

@WebServlet("/college/student/list.do")
public class ListController extends HttpServlet{
	
	private static final long serialVersionUID = 7217574776731435299L;
	
	private StudentService service = StudentService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// List<CustomerDTO> dtoList = service.findAll();
		
		// req.setAttribute("dtoList", dtoList);
		
		RequestDispatcher dipatcher = req.getRequestDispatcher("/WEB-INF/views/college/student/customer/list.jsp");
		dipatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doPost(req, resp);
	}
	
}
