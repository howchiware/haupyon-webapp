package com.memo;

import java.io.IOException;
import java.util.List;

import com.hs.util.MyUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/memo/*")
public class MemoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handleRequest(req, resp);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handleRequest(req, resp);
	}

	
	protected void handleRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String method = req.getMethod();
		String uri = req.getRequestURI();
		
		if(method.equals("GET")) {
			if(uri.contains("/list.do")) { // 메모 리스트
				list(req, resp);
			} else if(uri.contains("/write.do")) { // 메모 쓰기 폼
				writeForm(req, resp);
			} else if(uri.contains("/article.do")) { // 메모 보기
				article(req, resp);
			} else if(uri.contains("/update.do")) { // 메모 수정 폼
				updateForm(req, resp);
			} else if(uri.contains("/delete.do")) { // 글 삭제
				delete(req, resp);
			}
			
		} else if(method.equals("POST")) {
			if(uri.contains("/write.do")) { // 메모 등록
				writeSubmit(req, resp);
			} else if(uri.contains("/update.do")) { // 게시글 수정
				updateSubmit(req, resp);
			}
			
		}
	}
	
	protected void viewPage(HttpServletRequest req, HttpServletResponse resp,  String viewName) throws ServletException, IOException {
		final String REDIRECT_PREFIX = "redirect:";
		final String FORWARD_PREFIX = "/WEB-INF/views/";
		final String FORWARD_SUFFIX = ".jsp";
		
		// 리다이렉트
		if(viewName.startsWith(REDIRECT_PREFIX)) {
			String cp = req.getContextPath();
			String uri = cp + viewName.substring(REDIRECT_PREFIX.length());
			resp.sendRedirect(uri);
			return;
		}
		
		// 포워드
		RequestDispatcher rd = req.getRequestDispatcher(FORWARD_PREFIX + viewName + FORWARD_SUFFIX);
		rd.forward(req, resp);
	}
	
	
	// 리스트
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemoDAO dao = new MemoDAO();
		MyUtil util = new MyUtil();
		
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if(page != null) {
				current_page = Integer.parseInt(page);
			}
			
			int dataCount;
			dataCount = dao.dataCount();
			

			int size = 7; // 한 페이지 데이터 개수
			int total_page = util.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			// 게시글 리스트 가져오기
			int start = (current_page - 1) * size;
			if(start < 0) {
				start = 0;
			}
			
			List<MemoDTO> list = null;
			list = dao.listMemo(start, size);
			
			
			// 페이징 처리
			String cp = req.getContextPath();
			String listUrl = cp + "/memo/list.do";
			String articleUrl = cp + "/memo/article.do?page=" + current_page;
			
			String paging = util.paging(current_page, total_page, listUrl);
			
			// JSP에 전달할 속성
			req.setAttribute("list", list);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("page", page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("paging", paging);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "memo/list");
		
	}
	
	// 메모 작성 폼
	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", "write");
		viewPage(req, resp, "memo/write");
	}
	
	// 메모 등록
	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemoDAO dao = new MemoDAO();
		
		try {
			
			MemoDTO dto = new MemoDTO();
			
			dto.setMemo_date(req.getParameter("memo_date"));
			dto.setContent(req.getParameter("content"));
			dto.setReg_date(req.getParameter("reg_date"));
			
			dao.insertMemo(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/memo/list.do");
		
	}
	
	// 메모 보기
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemoDAO dao = new MemoDAO();
		
		String page = req.getParameter("page");
		String query = "page=" + page;
		
		try {
			long num = Long.parseLong(req.getParameter("num"));
			
			MemoDTO dto = dao.findById(num);
			
			if(dto == null) {
				viewPage(req, resp, "redirect:/memo.list.do?" + query);
				return;
			}
			
			dto.setContent(dto.getContent().replace("\n", "<br>"));
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("query", query);
			
			viewPage(req, resp, "memo/article");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 메모 수정 폼
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemoDAO dao = new MemoDAO();
		String page = req.getParameter("page");
		
		try {
			long num = Long.parseLong(req.getParameter("num"));
			
			MemoDTO dto = dao.findById(num);
			
			if(dto == null) {
				viewPage(req, resp, "redirect:/memo/list.do?page=" + page);
				return;
			}
			
			req.setAttribute("mode", "update");
			req.setAttribute("page", page);
			req.setAttribute("dto", dto);
			
			viewPage(req, resp, "memo/write");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/memo/list.do?page=" + page);
	}
	
	// 메모 수정 완료
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemoDAO dao = new MemoDAO();
		String page = req.getParameter("page");
		
		try {
			MemoDTO dto = new MemoDTO();
			
			dto.setNum(Long.parseLong(req.getParameter("num")));
			dto.setMemo_date(req.getParameter("memo_date"));
			dto.setContent(req.getParameter("content"));
			dto.setReg_date(req.getParameter("reg_date"));
			
			dao.updateMemo(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/memo/list.do?page=" + page);
		
	}
	
	// 메모 삭제
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemoDAO dao = new MemoDAO();
		
		String page = req.getParameter("page");
		String query = "page=" + page;
		
		try {
			long num = Long.parseLong(req.getParameter("num"));
			
			dao.deleteMemo(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/memo/list.do?" + query);
		
	}

	
	
	
}
