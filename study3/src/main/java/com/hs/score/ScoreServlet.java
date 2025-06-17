package com.hs.score;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/score/*") // 주소 매핑
public class ScoreServlet extends HttpServlet {

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
		
		//리다이렉트
		if(viewName.startsWith(REDIRECT_PREFIX)) {
			String cp = req.getContextPath(); // Path 가져오기
			String uri = cp + viewName.substring(REDIRECT_PREFIX.length()); // 앞에 redirect 제외시킴
			resp.sendRedirect(uri);
			return;
		}
		
		// 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(FORWARD_PREFIX + viewName + FORWARD_SUFFIX);
		rd.forward(req, resp);		
	}
	
	// GET이건 POST이건 여기서 짜겠다
	protected void handleRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String method = req.getMethod().toUpperCase();
		String uri = req.getRequestURI(); // cp(Context Path)에서 끝까지 주소
										// url => http://localhost:9090/study3/score/list.do
										// uri => study3/score/list.do
		
		if(method.equals("GET")) {
			// GET 방식으로 요청한 경우
			if(uri.indexOf("/list.do") != -1) {
				list(req, resp); // 리스트
			} else if(uri.indexOf("/write.do") != -1) {
				writeForm(req, resp); // 등록폼
			} else if(uri.indexOf("/update.do") != -1) {
				updateForm(req, resp); // 수정폼
			} else if(uri.indexOf("/delete.do") != -1) {
				delete(req, resp); // 삭제완료
			}
			
		} else if(method.equals("POST")) {
			// POST 방식으로 요청한 경우
			if(uri.indexOf("/write.do") != -1) {
				writeSubmit(req, resp); // 저장 완료
			} else if(uri.indexOf("/update.do") != -1) {
				updateSubmit(req, resp); // 수정 완료
			}
		}
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 성적 리스트
		
		viewPage(req, resp, "score/list");
		
	}
	
	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 등록 화면
		
		// 포워딩
		viewPage(req, resp, "score/write");
	}
	
	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 추가 완료
		// 넘어온 파라미터: hak, name, birth, kor, eng, mat
		ScoreDAO dao = new ScoreDAO();
		
		try {
			// 파라미터 받기
			ScoreDTO dto = new ScoreDTO();
			dto.setHak(req.getParameter("hak"));
			dto.setName(req.getParameter("name"));
			dto.setBirth(req.getParameter("birth"));
			dto.setKor(Integer.parseInt(req.getParameter("kor")));
			dto.setEng(Integer.parseInt(req.getParameter("eng")));
			dto.setMat(Integer.parseInt(req.getParameter("mat")));
			
			dao.insertScore(dto);
			
		} catch (Exception e) {
			
		}
		
		// 리스트 페이지로 리다이렉트
		viewPage(req, resp, "redirect:/score/list.do");
		
		// 여기서 포워딩하면 안되는 이유 => 데이터가 한 번 더 들어갈 수도 있다..
	}
	
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 화면
	}
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 완료
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 자료 삭제
	}

}
