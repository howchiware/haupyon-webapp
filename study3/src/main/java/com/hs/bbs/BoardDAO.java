package com.hs.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hs.util.DBConn;
import com.hs.util.DBUtil;

public class BoardDAO {
	private Connection conn = DBConn.getConnection();
	
	public void insertBoard(BoardDTO dto) throws SQLException {
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO bbs(num, name, pwd, subject, content, ipAddr, reg_date, hitCount) VALUES(bbs_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE, 0)";
			
			pstmt = conn.prepareCall(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getIpAddr());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}

}
