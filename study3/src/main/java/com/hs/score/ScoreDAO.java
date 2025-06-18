package com.hs.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	
	// 전체 데이터 개수
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT COUNT(*) FROM score";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return result;
		
	}
	
	
	// 페이지에 해당하는 리스트
	public List<ScoreDTO> listScore(int offset, int size) {
		List<ScoreDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT hak, name, TO_CHAR(birth, 'YYYY-MM-DD') birth, kor, eng, mat, "
					+ " (kor+eng+mat) tot, (kor+eng+mat)/3 ave FROM score"
					+ " ORDER BY hak ASC"
					+ " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
			// OFFSET: 건너뛰어서 몇 개를 가져와라
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ScoreDTO dto = new ScoreDTO();
				
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		
		return list;
	}
	
	
	// 학번(기본키)에 대한 레코드 검색
	public ScoreDTO findById(String hak) {
		ScoreDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT hak, name, TO_CHAR(birth, 'YYYY-MM-DD') birth, kor, eng, mat"
					+ " FROM score"
					+ " WHERE hak = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ScoreDTO();
				
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
	public void updateScore(ScoreDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "UPDATE  score SET name = ?, birth = TO_DATE(?, 'YYYY-MM-DD'), kor = ?, eng = ?, mat = ? WHERE hak = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBirth());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			pstmt.setString(6, dto.getHak());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
		
		
	}
	
	public void deleteScore(String hak) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "DELETE FROM score WHERE hak = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
	}
	
	public void deleteScore(String[] haks) throws SQLException {
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			/*
			sql = "DELETE FROM score WHERE hak = ?";
			pstmt = conn.prepareStatement(sql);
			
			for(String hak : haks) {
				pstmt.setString(1, hak);
				pstmt.executeUpdate();
			}
			*/
			
			sql = "DELETE FROM score WHERE hak IN (";
			for(int i = 0; i < haks.length; i++) {
				sql += "?,";
			}
			sql = sql.substring(0, sql.lastIndexOf(",")) + ")"; // 마지막 ,를 )로 바꾸기
			
			pstmt = conn.prepareStatement(sql);
			
			for(int i = 0; i < haks.length; i++) {
				pstmt.setString(i+1, haks[i]); // 오라클에서는 1번부터 넣어야 하니까 +1를 해줘야 한다
			}
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	
	
	
	
	

}
