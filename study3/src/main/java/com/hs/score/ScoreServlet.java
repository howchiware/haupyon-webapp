package com.hs.score;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.hs.util.MyUtil;

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
			} else if(uri.indexOf("/deleteList.do") != -1) {
				deleteList(req, resp); // 다중 삭제
			}
		}
	}
	
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 성적 리스트
		// 넘어오는 파라미터: [page]
		ScoreDAO dao = new ScoreDAO();
		MyUtil util = new MyUtil();
		
		try {
			// 페이지 번호
			String page = req.getParameter("page");
			int current_page = 1; // 최초에는 1페이지가 나와야 함
			if(page != null) { // 문자열 null은 null 이 아니다...//http://localhost:9090/study3/score/list.do?page=null 은 문자열 null 이라서 이 곳의 if문을 통화하지 못한다
				current_page = Integer.parseInt(page); // 넘어온 것이 문자열이라서 다시 숫자로 변환
			}
			
			// 전체 데이터 개수
			int dataCount;
			dataCount = dao.dataCount();
			
			// 전체 페이지 수
			int size = 10;
			int total_page = util.pageCount(dataCount, size);
			if(current_page > total_page) { // web은 정적
				current_page = total_page;
			}
			
			// 학생 리스트 가져오기
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			List<ScoreDTO> list = dao.listScore(offset, size);
			
			// 페이징 처리
			String cp = req.getContextPath();
			String listUrl = cp + "/score/list.do";
			String paging = util.paging(current_page, total_page, listUrl);
			
			// 포워딩할 JSP에 전달할 속성
			req.setAttribute("list", list);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("total_page", total_page);
			req.setAttribute("page", current_page);
			req.setAttribute("paging", paging);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		viewPage(req, resp, "score/list");
		
	}
	
	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 등록 화면
		
		
		// 포워딩
		req.setAttribute("mode", "write");
		viewPage(req, resp, "score/write");
	}
	
	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 추가 완료
		// 넘어온 파라미터: hak, name, birth, kor, eng, mat
		ScoreDAO dao = new ScoreDAO();
		
		String msg = null;
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
			
			// 리스트 페이지로 리다이렉트: INSERT, UPDATE, DELETE, 로그인, 로그아웃 후에는 리다이렉트
			viewPage(req, resp, "redirect:/score/list.do");
			return;
			
		} catch (SQLException e) {
			if(e.getErrorCode() == 1) {
				msg = "중복된 학번입니다.";
			} else {
				msg = "제약조건 위반으로 자료 등록이 실패했습니다.";
			}
			
			// 다시 JSP 페이지로 포워딩
			req.setAttribute("message", msg);
			
		} catch (Exception e) {
			msg = "잘못된 데이터로 자료 등록이 실패했습니다.";
			req.setAttribute("message", msg);
		}

		// 에러가 발생하면 등록 JSP로 포워딩
		req.setAttribute("mode", "write");  // 중복된 학번이 발생했을 경우 다시 write로 돌려줘야 데이터를 다시 입력할 수 있다
		viewPage(req, resp, "score/write");
		
		
		
		// 여기서 포워딩하면 안되는 이유 => 데이터가 한 번 더 들어갈 수도 있다..
	}
	
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 화면
		
		// 넘어온 파라미터: 학번, 페이지 번호
		ScoreDAO dao = new ScoreDAO();
		String page = req.getParameter("page");
		
		try {
			String hak = req.getParameter("hak");
			
			ScoreDTO dto = dao.findById(hak);
			if(dto == null) {
				viewPage(req, resp, "redirect:/score/list.do?page=" + page);
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("mode", "update");
			
			viewPage(req, resp, "score/write");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/score/list.do?page=" + page);
	}
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 완료
		
		ScoreDAO dao = new ScoreDAO();
		String page = req.getParameter("page");
		
		try {
			ScoreDTO dto = new ScoreDTO();
			dto.setHak(req.getParameter("hak"));
			dto.setName(req.getParameter("name"));
			dto.setBirth(req.getParameter("birth"));
			dto.setKor(Integer.parseInt(req.getParameter("kor")));
			dto.setEng(Integer.parseInt(req.getParameter("eng")));
			dto.setMat(Integer.parseInt(req.getParameter("mat")));
			
			dao.updateScore(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/score/list.do?page=" + page);
		
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 자료 삭제
		
		ScoreDAO dao = new ScoreDAO();
		String page = req.getParameter("page");
		
		try {
			String hak = req.getParameter("hak");
			
			dao.deleteScore(hak);
		} catch (Exception e) {
			e.printStackTrace();
		}
		viewPage(req, resp, "redirect:/score/list.do?page=" + page);
	}
	
	
	protected void deleteList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 다중 자료 삭제
		
		ScoreDAO dao = new ScoreDAO();
		String page = req.getParameter("page");
		
		try {
			String[] haks = req.getParameterValues("haks");
			
			dao.deleteScore(haks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		viewPage(req, resp, "redirect:/score/list.do?page=" + page);
	}
	
	
	
	
	
	

}
