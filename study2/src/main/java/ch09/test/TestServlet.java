package ch09.test;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import com.util.FileManager;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/*
	- @MultipartConfig
	  : 서블릿 3.0에서 파일 업로드를 지원하는 애노테이션
	  : @MultipartConfig 애노테이션을 붙이면 일반 파라미터는 req.getParameter("이름")으로 받을 수 있다
	  : 하나의 파라미터당 하나의 Part 객체가 생성된다
	  : 모든 Part를 받환 받을 경우 Collection<Part> pp = req.getParts();
*/


@WebServlet("/testFile/*") // 서버의 주소
@MultipartConfig // 파일을 받을 수 있다
public class TestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handelRequest(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handelRequest(req, resp);
	}
	
	protected void viewPage(HttpServletRequest req, HttpServletResponse resp, String viewName) throws ServletException, IOException {
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
	
	protected void handelRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String method = req.getMethod();
		String uri = req.getRequestURI();
		
		if(method.equals("GET")) {
			if(uri.contains("/write.do")) {
				form(req, resp);
			} else if(uri.contains("/download.do")) {
				download(req, resp);
			}
			
		} else if(method.equals("POST")) {
			if(uri.contains("/write.do")) {
				submit(req, resp);
			}
		}
		
		
	}
	
	protected void form(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		viewPage(req, resp, "test/write");
	}
	
	protected void submit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		// System.out.println(root); // /(슬래시)에 대한 진짜 경로
		// ServletContext: 웹 애플리케이션의 설정 정보를 가지고 있는 객체
		String pathname = root + "uploads" + File.separator + "test";
		
		try {
			File f = new File(pathname);
			
			if(! f.exists()) { // 폴더가 없으면 폴더 생성하기
				f.mkdirs(); // 부모 폴더가 없으면 부모 폴더도 생성한다
			}
			
			// 제목 받기
			String subject = req.getParameter("subject");
			
			// 파일 받기
			Part p = req.getPart("selectFile");
			String originalFilename = getOriginalFilename(p);
			long fileSize = 0;
			String saveFilename = null;
			if(originalFilename != null && originalFilename.length() != 0) {
				// 확장자
				String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
				
				saveFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance()); // 년월일시분초 로 파일명 지정
				saveFilename += System.nanoTime() + ext;
				
				// 서버에 파일 저장
				String path = pathname + File.separator + saveFilename;
				p.write(path);
				
				fileSize = p.getSize();
				
			}
			
			// 포워딩 // 리다이렉트로 하게 되면 새로고침 할 때마다 데이터 계속 들어간다
			req.setAttribute("subject", subject);
			req.setAttribute("saveFilename", saveFilename);
			req.setAttribute("originalFilename", originalFilename);
			req.setAttribute("fileSize", fileSize);
			req.setAttribute("pathname", pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		viewPage(req, resp, "test/result");
	}
	
	protected void download(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "test";
		
		try {
			String saveFilename = req.getParameter("saveFilename");
			String originalFilename = req.getParameter("originalFilename");
			
			FileManager fm = new FileManager();
			boolean b = fm.doFiledownload(saveFilename, originalFilename, pathname, resp);
			
			if(! b) {
				// 다운로드가 실패한 경우
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.print("<script>alert('다운로드가 불가능합니다.'); history.back(); </script>");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private String getOriginalFilename(Part p) {
		String [] ss = p.getHeader("Content-Disposition").split(";");
		for(String s : ss) {
			if(s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 1).trim().replaceAll("\"", "");
			}
		}
				
		return null;
	}
	
	
	
}
