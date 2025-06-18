package com.hs.bbs;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// @WebServlet: 서블릿과 url 매핑
@WebServlet("/bbs/*")
public class BoardServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handleRequest(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handleRequest(req, resp);
	}

	
	protected void viewPage(HttpServletRequest req, HttpServletResponse resp, String viewName) throws ServletException, IOException {
		final String REDIRECT_PREFIX = "redirect:";
		final String FORWARD_PREFIX = "/WEB-INF/views/";
		final String FORWARD_SUFFIX = ".jsp";

		// 리다이렉트
		if (viewName.startsWith(REDIRECT_PREFIX)) {
			String cp = req.getContextPath(); // Path 가져오기
			String uri = cp + viewName.substring(REDIRECT_PREFIX.length()); // 앞에 redirect 제외시킴
			resp.sendRedirect(uri);
			return;
		}

		// 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(FORWARD_PREFIX + viewName + FORWARD_SUFFIX);
		rd.forward(req, resp);
	}

	
	protected void handleRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 방식 인코딩 설정
		req.setCharacterEncoding("utf-8");
		
		String method = req.getMethod(); // 메소드: GET, POST 등
		String uri = req.getRequestURI(); // cp부터 끝까지 주소(QueryString은 제외)
		
		if(method.equals("GET")) {
			// GET 방식으로 요청한 경우
			if(uri.contains("/list.do")) { // 글 리스트
				list(req, resp);
			} else if(uri.contains("/write.do")) { // 글 쓰기 폼
				writeForm(req, resp);
			} else if(uri.contains("/article.do")) { // 글 보기
				article(req, resp);
			} else if(uri.contains("/update.do")) { // 글 수정
				updateForm(req, resp);
			} else if(uri.contains("/delete.do")) { // 글 삭제
				delete(req, resp);
			}
			
		} else if(method.equals("POST")) {
			// POST 방식으로 요청한 경우
			if(uri.contains("/write.do")) { // 게시글 등록
				writeSubmit(req, resp);
			} else if(uri.contains("/update.do")) { // 게시글 수정
				updateSubmit(req, resp);
			}
		}
	}
	
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시글 리스트
		
		viewPage(req, resp, "bbs/list");
	}
	
	
	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글쓰기 폼
		
		req.setAttribute("mode", "write");
		viewPage(req, resp, "bbs/write");
	}
	
	
	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 등록
		
		// 넘어온 파라미터: name, subject, content, pwd
		BoardDAO dao = new BoardDAO();
		
		try {
			// 폼 데이터: 이름, 제목, 내용, 패스워드
			// 번호: 시퀀스 
			// 등록일 조회수: 기본값
			// ip: 클라이언트IP
			BoardDTO dto = new BoardDTO();
			
			// 폼데이터
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			
			// 클라이언트 IP
			dto.setIpAddr(req.getRemoteAddr());
			
			// 테이블에 저장
			dao.insertBoard(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 게시물 저장후 리스트로 리다이렉트
		viewPage(req, resp, "redirect:/bbs/list.do");
		
	}
	
	
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 보기
	}	
	
	
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 수정 폼
	}
	
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 수정 완료
	}
	
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 삭제
	}
	

}
