package com.memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hs.util.DBConn;
import com.hs.util.DBUtil;

public class MemoDAO {
	
	private Connection conn = DBConn.getConnection();
	
    public void insertMemo(MemoDTO dto) throws SQLException {
    	
    	PreparedStatement pstmt = null;
    	String sql;
    	
    	try {
			
    		sql = "INSERT INTO memo(num, memo_date, content, reg_date) VALUES(memo_seq.NEXTVAL, TO_DATE(?, 'YYYY-MM-DD'), ?, SYSDATE)";
    		
    		pstmt = conn.prepareStatement(sql);
    		
    		pstmt.setString(1, dto.getMemo_date());
    		pstmt.setString(2, dto.getContent());
    		
    		pstmt.executeUpdate();
    		
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
    	
    }
    
    
    public int dataCount() {
    	int result = 0;
    	
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql;
    	
    	try {
			
    		sql = "SELECT COUNT(*) cnt FROM memo";
    		
    		pstmt = conn.prepareStatement(sql);
    		
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			result = rs.getInt(1);
    		}
    		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(rs);
		}
    	
    	return result;
    	
    }
    
    
    public List<MemoDTO> listMemo(int start, int end) {
    	List<MemoDTO> list = new ArrayList<MemoDTO>();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	StringBuilder sb = new StringBuilder();
    	
    	try {
			sb.append(" SELECT num, TO_CHAR(memo_date, 'YYYY-MM-DD') memo_date, content, reg_date ");
			sb.append(" FROM memo ");
			sb.append(" ORDER BY num DESC" );
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setNum(rs.getLong("num"));
				dto.setMemo_date(rs.getString("memo_date"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				
				list.add(dto);
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(rs);
		}
    	
    	return list;
    }
    
    
    public MemoDTO findById(long num) {
    	
    	MemoDTO dto = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql;
    	
    	try {
			sql = " SELECT num, TO_CHAR(memo_date, 'YYYY-MM-DD') memo_date, content, reg_date FROM memo WHERE num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemoDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setMemo_date(rs.getString("memo_date"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
			}
    		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(rs);
		}
    	
    	return dto;
    	
    }
    
    
    public void updateMemo(MemoDTO dto) throws SQLException {
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql;
    	
    	try {
			sql = "UPDATE memo SET memo_date = ?, content = ? WHERE num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMemo_date());
			pstmt.setString(2, dto.getContent());
			pstmt.setLong(3, dto.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
    	
    }
    
    
    public void deleteMemo(long num) throws SQLException {
    	PreparedStatement pstmt = null;
    	String sql;
    	
    	try {
			sql = "DELETE FROM memo WHERE num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			DBUtil.close(pstmt);
		}
    }

    

}
