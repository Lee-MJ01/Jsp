package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/greeting.do")
public class GreetingServlet extends HttpServlet{
	// 서블릿 고유 번호
	private static final long serialVersionUID = -5968943589218638772L;
	
	@Override
	public void init() throws ServletException {
		// 서블릿이 최초 생성될 때 초기화 메서드
		System.out.println("GreetingServlet init...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GreetingServlet get 요청!!!");
		// HTML 출력
		resp.setContentType("text/html;charser=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charser'UTF-8'/>");
		writer.println("<title>GreetingServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>GreetingServlet</h3>");
		writer.println("<a href='/ch08/Servlet.jsp'>서블릿 메인</a>");
		writer.println("<a href='/ch08/hello.do'>Hello Servlet</a>");
		writer.println("<a href='/ch08/welcome.do'>welcome Servlet</a>");
		writer.println("<a href='/ch08/greeting.do'>greeting Servlet</a>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GreetingServlet post 요청!!!");
	}
}
