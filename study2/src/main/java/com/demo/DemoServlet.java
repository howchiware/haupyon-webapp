package com.demo;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
	- HttpServlet
	  : 추상 클래스
	  : GenericServlet 클래스를 상속 받음
	  : GenericServlet 클래스의 service() 메소드가 재정의 되어 있음
	  : service() 메소드는 요청 method에 따라 다음의 메소드가 호출되도록 구현되어 있음
	    doGet(HttpServletRequest req, HttpServletResponse resp)
	    doPost(HttpServletRequest req, HttpServletResponse resp)
	       :
	  : 요청 메소드에 따라 doGet(), doPost()를 재정의하여 구현한다
*/

@WebServlet("/demo") // 서블릿과 uri 매핑
public class DemoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트가 GET 방식으로 요청한 경우 실행
		// GET: 기본 요청 방식. 주소 줄에 파라미터를 전달한다
		// 주소 => http://도메인?이름1=값1&이름2=값2
		
		// HTTPServletRequest 객체: 클라이언트의 요청 정보를 가진 객체
		// HTTPServletResponse 객체: 요청 처리 결과를 클라이언트에게 응답할 정보를 가지고 있는 객체
		
		try {
			// 클라이언트가 보낸 파라미터를 받는다
			String name = req.getParameter("name");
			int age = Integer.parseInt(req.getParameter("age"));
			
			String state = age >= 19 ? "성인" : "미성년자";
			
			// 처리 결과를 클라이언트에게 전송
			resp.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = resp.getWriter();
			
			out.print("<html>");
			out.print("<head><title>서블릿 예제</title></head>");
			out.print("<body>");
			out.print("<h3>GET 방식 요청 결과</h3>");
			out.print("<p>이름: " + name + ", 나이: " + age + ", " + state + "</p>");
			out.print("</body>");
			out.print("</html>");
		
		} catch (Exception e) {
			getServletContext().log("에러: ", e);
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트가 POST 방식으로 요청한 경우 실행
		// POST: <form method="post" action=...>~</form> 을 통하여 요청
		// POST 요청은 body에 정보를 실어서 보냄
		
		try {
			
			// 요청 정보의 문자 인코딩 설정. 서블릿 6.0부터는 생략 가능(기본 utf-8)
			req.setCharacterEncoding("utf-8");
			
			
			// 클라이언트가 보낸 파라미터를 받는다
			String name = req.getParameter("name");
			int age = Integer.parseInt(req.getParameter("age"));
			
			String state = age >= 19 ? "성인" : "미성년자";
			
			// 처리 결과를 클라이언트에게 전송
			resp.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = resp.getWriter();
			
			out.print("<html>");
			out.print("<head><title>서블릿 예제</title></head>");
			out.print("<body>");
			out.print("<h3>POST 방식 요청 결과</h3>");
			out.print("<p>이름: " + name + ", 나이: " + age + ", " + state + "</p>");
			out.print("</body>");
			out.print("</html>");
		
		} catch (Exception e) {
			getServletContext().log("에러: ", e);
		}
	}

}
