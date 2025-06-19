package com.hs.nbbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hs.util.DBConn;
import com.hs.util.DBUtil;

public class BoardDAO {
	private Connection conn = DBConn.getConnection();
	
	public void insertBoard(BoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		// INSERT INTO 테이블명 (컬럼,컬럼) VALUES(값,값)
		try {
			sql = "INSERT INTO bbs(num, name, subject, content, "
					+ "    pwd, ipAddr, reg_date, hitCount) "
					+ " VALUES(bbs_seq.NEXTVAL, ?, ?, ?, "
					+ "    ?, ?, SYSDATE, 0)";  
			pstmt = conn.prepareStatement(sql);
			
			// setter
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPwd());
			pstmt.setString(5, dto.getIpAddr());
			
			// 쿼리실행
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
			sql = "SELECT COUNT(*) cnt FROM bbs";
			
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

	// 검색에서 데이터 개수
	public int dataCount(String schType, String kwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT COUNT(*) cnt FROM bbs ";
			if(schType.equals("all")) {
				sql += " WHERE ( INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1 ) ";
			} else if(schType.equals("reg_date")) {
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sql += " WHERE TO_CHAR(reg_date, 'YYYYMMDD') = ? ";
			} else { // name, subject, content
				sql += " WHERE INSTR(" + schType + ", ?) >= 1 ";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, kwd);
			if(schType.equals("all")) {
				pstmt.setString(2, kwd);
			}
			
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
	
	// 게시물 리스트
	public List<BoardDTO> listBoard(int offset, int size) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append(" SELECT num, name, subject, hitCount, ");
			sb.append("    TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append(" FROM bbs ");
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setReg_date(rs.getString("reg_date"));
				
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
	
	// 검색에서 리스트
	public List<BoardDTO> listBoard(int offset, int size, String schType, String kwd) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append(" SELECT num, name, subject, hitCount, ");
			sb.append("    TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append(" FROM bbs ");
			if(schType.equals("all")) {
				sb.append(" WHERE ( INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1 ) ");
			} else if(schType.equals("reg_date")) {
				kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
				sb.append(" WHERE TO_CHAR(reg_date, 'YYYYMMDD') = ? ");
			} else {
				sb.append(" WHERE INSTR(" + schType + ", ?) >= 1 ");
			}
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			if(schType.equals("all")) {
				pstmt.setString(1, kwd);
				pstmt.setString(2, kwd);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, size);
			} else {
				pstmt.setString(1, kwd);
				pstmt.setInt(2, offset);
				pstmt.setInt(3, size);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setReg_date(rs.getString("reg_date"));
				
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
	
	// 기본키에 해당하는 게시글 가져오기
	public BoardDTO findById(long num) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT num, name, subject, content, pwd, "
					+ "  reg_date, ipAddr, hitCount "
					+ " FROM bbs "
					+ " WHERE num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getLong("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setIpAddr(rs.getString("ipAddr"));
				dto.setHitCount(rs.getInt("hitCount"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
	// 조회수 증가하기
	public void updateHitCount(long num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "UPDATE bbs SET hitCount = hitCount + 1 "
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
		
	}
	
	// 이전글 가져오기
	public BoardDTO findByPrev(long num, String schType, String kwd) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			if(kwd != null && kwd.length() != 0) {
				// 검색 상태인 경우
				sb.append(" SELECT num, subject ");
				sb.append(" FROM bbs ");
				sb.append(" WHERE num > ? AND ");
				if(schType.equals("all")) {
					sb.append(" (INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1) ");
				} else if(schType.equals("reg_date")) {
					kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
					sb.append(" TO_CHAR(reg_date, 'YYYYMMDD') = ? ");
				} else {
					sb.append(" INSTR(" + schType + ", ?) >= 1 ");
				}
				sb.append(" ORDER BY NUM ASC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");
				
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setLong(1, num);
				pstmt.setString(2, kwd);
				if(schType.equals("all")) {
					pstmt.setString(3, kwd);
				}
			} else {
				// 검색이 아닌경우
				sb.append(" SELECT num, subject ");
				sb.append(" FROM bbs ");
				sb.append(" WHERE num > ? ");
				sb.append(" ORDER BY NUM ASC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");
				
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setLong(1, num);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getLong("num"));
				dto.setSubject(rs.getString("subject"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
	// 다음글 가져오기
	public BoardDTO findByNext(long num, String schType, String kwd) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			if(kwd != null && kwd.length() != 0) {
				// 검색 상태인 경우
				sb.append(" SELECT num, subject ");
				sb.append(" FROM bbs ");
				sb.append(" WHERE num < ? AND ");
				if(schType.equals("all")) {
					sb.append(" (INSTR(subject, ?) >= 1 OR INSTR(content, ?) >= 1) ");
				} else if(schType.equals("reg_date")) {
					kwd = kwd.replaceAll("(\\-|\\/|\\.)", "");
					sb.append(" TO_CHAR(reg_date, 'YYYYMMDD') = ? ");
				} else {
					sb.append(" INSTR(" + schType + ", ?) >= 1 ");
				}
				sb.append(" ORDER BY NUM DESC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");
				
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setLong(1, num);
				pstmt.setString(2, kwd);
				if(schType.equals("all")) {
					pstmt.setString(3, kwd);
				}
			} else {
				// 검색이 아닌경우
				sb.append(" SELECT num, subject ");
				sb.append(" FROM bbs ");
				sb.append(" WHERE num < ? ");
				sb.append(" ORDER BY NUM DESC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");
				
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setLong(1, num);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getLong("num"));
				dto.setSubject(rs.getString("subject"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		
		return dto;
	}
	
	public void updateBoard(BoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			// UPDATE 테이블명 SET 컬럼명=값, 컬럼명=값 WHERE 조건
			sql = "UPDATE bbs SET name = ?, subject = ?, "
					+ " content = ?, pwd = ? "
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPwd());
			pstmt.setLong(5, dto.getNum());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	public void deleteBoard(long num) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			// DELETE FROM 테이블명 WHERE 조건
			sql = "DELETE FROM bbs WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
	}
	
	
}
