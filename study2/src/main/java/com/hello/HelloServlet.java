package com.hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

/*
 *  - GenericServlet
 *    : 추상 클래스
 *    : Servlet 인터페이스 구현 클래스
 *    : 서블릿의 기반이 되는 클래스
 *    : service() 메소드는 추상 메소드로 반드시 재정의 해야 한다
 * 
 * */

public class HelloServlet extends GenericServlet {

	private static final long serialVersionUID = 1L;

	private long count;
	
	@Override
		public void init(ServletConfig config) throws ServletException {
			
			super.init(config);
			
			// 서블릿이 초기화 될 때 한번 실행
			System.out.println("init...");
		}
	
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		// 클라이언트가 요청할 때마다 실행
		
		// req: 클라이언트 요청 정보를 가지고 있는 객체
		// resp: 클라이언트 요청 내용을 처리 후 응답 정보를 가지고 있는 객체
		try {
			count++;
			
			// System.out.println("service: " + count);
			
			Calendar cal = Calendar.getInstance();
			String s = String.format("%tF %tT", cal, cal);
			
			// 클라이언트에게 보내는 문서의 type
			resp.setContentType("text/html; charset=utf-8");
			
			// 클라이언트에게 HTML 문서 전송
			PrintWriter out = resp.getWriter(); // getWriter(): 출력 스트림
			
			out.print("<html>");
			out.print("<head><title>첫번째 예제</title></head>");
			out.print("<body>");
			out.print("<h3>서블릿 첫번째 예제</h3>");
			out.print("<p>접속 날짜 및 시간: " + s + "</p>");
			out.print("<p>COUNT: " + count + "</p>");
			out.print("</body>");
			out.print("</html>");
			
		} catch (Exception e) {
			getServletContext().log("error: ", e);
		}
		
	}
	
	@Override
	public void destroy() {
		// 서블릿이 파괴될 때 한번 실행(WAS가 종료되는 시점)
		System.out.println("destroy...");
	}
	
	

}
