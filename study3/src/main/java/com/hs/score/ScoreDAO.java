package com.hs.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hs.util.DBConn;
import com.hs.util.DBUtil;

public class ScoreDAO {
	
	private Connection conn = DBConn.getConnection();
	
	public void insertScore(ScoreDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		// INSERT INTO 테이블명(컬럼명, 컬럼명) VALUES(값, 값)
		try {
			sql = "INSERT INTO score(hak, name, birth, kor, eng, mat) VALUES(?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat());
			
			pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}

}
