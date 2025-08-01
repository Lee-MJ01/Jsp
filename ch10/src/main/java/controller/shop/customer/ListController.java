package controller.shop.customer;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.shop.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.shop.CustomerService;

@WebServlet("/shop/customer/list.do")
public class ListController extends HttpServlet{
	
	private static final long serialVersionUID = 7217574776731435299L;
	
	private CustomerService service = CustomerService.INSTANCE;
	
	// 로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 	개발환경에서는 System 출력으로 개발과정을 테스트할 수 있지만
		 	배포환경에서는 System 출력이 자원낭비로 처리됨. 따라서 System 출력으로 하지 않고 Logger를 이용해 출력
		 	
		  	개발 단계에서는 debug 레벨로 로그 작업
		  	배포 단계에서는 warn 레벨 이상으로 로그 작업
		 */
		
		// 로그 레벨
		logger.debug("debug here1");
		logger.info("info here1");
		logger.warn("warn here1");
		logger.error("error here1");
		
		List<CustomerDTO> dtoList = service.findAll();
		
		//로그 레벨
		logger.debug("debug here2 :" + dtoList);
		logger.info("info here2: " + dtoList);
		logger.warn("warn here2:" + dtoList);
		logger.error("error here2:" + dtoList);
		
		req.setAttribute("dtoList", dtoList);
		
		RequestDispatcher dipatcher = req.getRequestDispatcher("/WEB-INF/views/shop/customer/list.jsp");
		dipatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doPost(req, resp);
	}
	
}
