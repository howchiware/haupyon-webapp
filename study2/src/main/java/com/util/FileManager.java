package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import jakarta.servlet.http.HttpServletResponse;

public class FileManager {
	
	private static final int BUFFER_SIZE = 8192;
	
	public boolean doFiledownload(String saveFilename, String originalFilename, String pathname, HttpServletResponse resp	) {
		boolean flag = false;
		
		BufferedInputStream bis = null;
		OutputStream os = null;
		
		try {
			
			// originalFilename = new String(originalFilename.getBytes("euc-kr"), "8859_1");
			originalFilename = new String(originalFilename.getBytes("utf-8"), "8859_1");
			
			pathname = pathname + File.separator + saveFilename;
			
			File f = new File(pathname);
			if(! f.exists()) {
				return flag;
			}
			
			// 클라이언트에게 전송할 문서의 타입
			resp.setContentType("application/octet-stream"); // 전송할 타입이 파일이다
			
			// 파일명을 헤더에 실어서 보냄
			resp.setHeader("Content-disposition", "attachment;filename=" + originalFilename);
			
			// 서버의 파일을 읽어서 클라이언트에게 전송
			byte[] b = new byte[BUFFER_SIZE];
			bis = new BufferedInputStream(new FileInputStream(f));
			
			// 클라이언트에게 파일을 전송할 출력 스트림
			os = resp.getOutputStream(); // Response 가 출력 스트림을 가지고 있으니
			
			int n;
			while((n = bis.read(b)) != -1) { // n 은 읽은 바이트
				os.write(b, 0, n);
			}
			os.flush(); // 버퍼 내용 비우기
			
			flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(bis != null) {
				try {
					bis.close();
				} catch (Exception e2) {
				}
			}
			
			if(os != null) {
				try {
					os.close();
				} catch (Exception e2) {
				}
			}
		}
		
		return flag;
	}

}
