package controller.shop.product;

import java.io.IOException;

import dto.shop.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.shop.CustomerService;

@WebServlet("/shop/customer/register.do")
public class registerController extends HttpServlet{
	
	private static final long serialVersionUID = 7217574776731435299L;
	
	// 서비스 객체 가져오기
	private CustomerService service = CustomerService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dipatcher = req.getRequestDispatcher("/WEB-INF/views/shop/customer/register.jsp");
		dipatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cid = req.getParameter("cid");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String address = req.getParameter("address");
		String rdate = req.getParameter("rdate");
		
		CustomerDTO dto = new CustomerDTO();
		dto.setCid(cid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAddress(address);
		dto.setRdate(rdate);
		
		service.register(dto);
		
		resp.sendRedirect("/ch10/shop/customer/list.do");
	}
	
}
