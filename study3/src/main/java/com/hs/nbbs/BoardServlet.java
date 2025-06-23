package com.hs.nbbs;

import java.io.IOException;
import java.util.List;

import com.hs.util.MyUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// @WebServlet : 서블릿과 url 매핑
@WebServlet("/nbbs/*")
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

	protected void viewPage(HttpServletRequest req, HttpServletResponse resp, String viewName)
			throws ServletException, IOException {
		final String REDIRECT_PREFIX = "redirect:";
		final String FORWARD_PREFIX = "/WEB-INF/views/";
		final String FORWARD_SUFFIX = ".jsp";

		// 리다이렉트
		if (viewName.startsWith(REDIRECT_PREFIX)) {
			String cp = req.getContextPath();
			String uri = cp + viewName.substring(REDIRECT_PREFIX.length());
			resp.sendRedirect(uri);
			return;
		}

		// 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(FORWARD_PREFIX + viewName + FORWARD_SUFFIX);
		rd.forward(req, resp);
	}

	protected void handleRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// POST 방식 인코딩 설정
		req.setCharacterEncoding("utf-8");

		String method = req.getMethod(); // 메소드 : GET, POST 등
		String uri = req.getRequestURI();
		// cp 부터 끝까지 주소(QueryString은 제외)

		if (method.equals("GET")) {
			// GET 방식으로 요청한 경우
			if (uri.contains("/list.do")) {
				// 글리스트
				list(req, resp);
			} else if (uri.contains("/write.do")) {
				// 글쓰기 폼
				writeForm(req, resp);
			} else if (uri.contains("/article.do")) {
				// 글보기
				article(req, resp);
			} 
		} else if (method.equals("POST")) {
			// POST 방식으로 요청한 경우
			if (uri.contains("/write.do")) {
				// 게시글 등록
				writeSubmit(req, resp);
			} else if (uri.contains("/pwd.do")) {
				// 패스워드 확인
				pwdSubmit(req, resp);
			} else if (uri.contains("/update.do")) {
				// 게시글 수정 완료
				updateSubmit(req, resp);
			}
		}
	}

	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시글 리스트
		BoardDAO dao = new BoardDAO();
		MyUtil util = new MyUtil();
		
		// 넘어오는 파라미터 : [page] [, schType, kwd]
		try {
			String page = req.getParameter("page");
			int current_page = 1;
			if(page != null) {
				current_page = Integer.parseInt(page);
			}
			
			// 검색 파라미터
			String schType = req.getParameter("schType");
			String kwd = req.getParameter("kwd");
			if(schType == null) {
				schType = "all";
				kwd = "";
			}
			
			// kwd = URLDecoder.decode(kwd, "utf-8"); // %를 검색하면 에러가 발생할수 있음
			kwd = util.decodeUrl(kwd);
			
			// 전체 데이터 개수
			int dataCount;
			if(kwd.length() == 0) { // 검색이 아닌경우
				dataCount = dao.dataCount();
			} else { // 검색인 경우
				dataCount = dao.dataCount(schType, kwd);
			}
			
			// 전체 페이지 수
			int size = 10; // 한페이지의 데이터 개수
			int total_page = util.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			// 게시글 리스트 가져오기
			int offset = (current_page - 1) * size; // 건너뛸 개수
			if(offset < 0) offset = 0;
			
			List<BoardDTO> list = null;
			if(kwd.length() == 0) {
				list = dao.listBoard(offset, size);
			} else {
				list = dao.listBoard(offset, size, schType, kwd);
			}
			
			// 포워딩할 JSP에 전달할 속성
			req.setAttribute("list", list);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("size", size);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("schType", schType);
			req.setAttribute("kwd", kwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		viewPage(req, resp, "nbbs/list");
	}

	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글쓰기 폼
		req.setAttribute("mode", "write");
		viewPage(req, resp, "nbbs/write");
	}

	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글등록
		// 넘어온 파라미터(폼) : name, subject, content, pwd
		BoardDAO dao = new BoardDAO();
		
		try {
			// 폼데이터 : 이름, 제목, 내용, 패스워드
			// 번호 : 시퀀스
			// 등록이르 조회수 : 기본값
			// ip : 클라이언트IP
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
		viewPage(req, resp, "redirect:/nbbs/list.do");
		
	}

	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글보기
		// 넘어온 파라미터 : num, page [, schType, kwd]
		BoardDAO dao = new BoardDAO();
		MyUtil util = new MyUtil();
		
		String page = req.getParameter("page");
		String query = "page=" + page;
		
		try {
			long num = Long.parseLong(req.getParameter("num"));
			String schType = req.getParameter("schType");
			String kwd = req.getParameter("kwd");
			
			if(schType == null) {
				schType = "all";
				kwd = "";
			}
			kwd = util.decodeUrl(kwd);
			
			if(kwd.length() != 0) {
				query += "&schType=" + schType + "&kwd=" 
						+ util.encodeUrl(kwd);
			}
			
			// 조회수 증가
			dao.updateHitCount(num);
			
			// 게시글 가져오기
			BoardDTO dto = dao.findById(num);
			
			// 게시글이 없으면 다시 글리스트로
			if(dto == null) {
				viewPage(req, resp, "redirect:/nbbs/list.do?" + query);
				return;
			}
			
			// content의 엔터를 <br>로
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			// 이전글, 다음글
			BoardDTO prevDto = dao.findByPrev(num, schType, kwd);
			BoardDTO nextDto = dao.findByNext(num, schType, kwd);
			
			// 포워딩할 JSP에 전달할 속성
			req.setAttribute("dto", dto);
			req.setAttribute("prevDto", prevDto);
			req.setAttribute("nextDto", nextDto);
			
			req.setAttribute("page", page);
			req.setAttribute("schType", schType);
			req.setAttribute("kwd", kwd);
			req.setAttribute("query", query);
			
			// 포워딩
			viewPage(req, resp, "nbbs/article");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/nbbs/list.do?" + query);
	}

	protected void pwdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 대화 상자로 작성하는 경우에는 AJAX를 이용해서 작성해야 한다. (안배움)
		
		// 패스워드 확인
		// 넘어오는 파라미터(폼) : num, pwd, page, mode, schType, kwd
		BoardDAO dao = new BoardDAO();
		MyUtil util = new MyUtil();
		
		String page = req.getParameter("page");
		String query = "page=" + page;
		
		try {
			String schType = req.getParameter("schType");
			String kwd = req.getParameter("kwd");
			if(kwd.length() != 0) {
				query += "&schType=" + schType + "&kwd=" 
						+ util.encodeUrl(kwd);
			}
			
			long num = Long.parseLong(req.getParameter("num"));
			String pwd = req.getParameter("pwd");
			String mode = req.getParameter("mode"); // "update" 또는 "delete" 

			BoardDTO dto = dao.findById(num);
			if(dto == null) {
				viewPage(req, resp, "redirect:/nbbs/list.do?" + query);
				return;
			}
			
			if(! dto.getPwd().equals(pwd)) {
				// 패스워드가 일치하지 않으면
				
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				
				BoardDTO prevDto = dao.findByPrev(num, schType, kwd);
				BoardDTO nextDto = dao.findByNext(num, schType, kwd);
				
				req.setAttribute("dto", dto);
				req.setAttribute("prevDto", prevDto);
				req.setAttribute("nextDto", nextDto);
				
				req.setAttribute("page", page);
				req.setAttribute("schType", schType);
				req.setAttribute("kwd", kwd);
				req.setAttribute("query", query);
				
				req.setAttribute("mode", mode);
				req.setAttribute("auth", "fail");
				
				viewPage(req, resp, "nbbs/article");
				
				return;
			}
			
			if(mode.equals("update")) {
				// 수정할 때는 포워딩해서 넘어가야 한다
				req.setAttribute("dto", dto);
				req.setAttribute("mode", "update");
				req.setAttribute("page", page);
				req.setAttribute("schType", schType);
				req.setAttribute("kwd", kwd);
				
				viewPage(req, resp, "nbbs/write");
				return;
			} else if (mode.equals("delete")) {
				dao.deleteBoard(num);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "redirect:/nbbs/list.do?" + query);
		
	}

	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글수정완료
		// 넘어오는 파라미터(폼)
		//   : name, subject, content, pwd, num, page, schType, kwd
		BoardDAO dao = new BoardDAO();
		MyUtil util = new MyUtil();
		
		String page = req.getParameter("page");
		String query = "page=" + page;
		try {
			String schType = req.getParameter("schType");
			String kwd = req.getParameter("kwd");
			if(kwd.length() != 0) {
				query += "&schType=" + schType + "&kwd=" 
						+ util.encodeUrl(kwd);
			}
			
			BoardDTO dto = new BoardDTO();
			
			dto.setNum(Long.parseLong(req.getParameter("num")));
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			
			dao.updateBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 수정 완료후 리스트로 리다이렉트
		viewPage(req, resp, "redirect:/nbbs/list.do?" + query);
	}
}
