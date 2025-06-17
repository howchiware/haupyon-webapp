package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

/*
 	- 오라클 서버에 접속하기 위해 필요한 사항
 	  1) 호스트 이름: 오라클 서버가 설치된 IP 주소 또는 도메인
 	     localhost 또는 127.0.0.1: 자기 자신의 컴퓨터에 오라클이 설치된 경우
 	  2) 포트 번호: 기본값으로 설치한 경우 1521
 	  3) SID(데이터베이스의 고유 식별자)
 	  	 Express Edition 기본: XE
 	  	 Enterprise Edition 기본: ORCL
 	  4) 사용자 이름과 패스워드
 */

public class DBConn {
	private static Connection conn;
	
	private static final String URL = "jdbc:oracle:thin:@//127.0.0.1:1521/XE";
	private static final String USER = "sky";
	private static final String PASSWORD = "java$!";
	

	private DBConn() {
	}

	public static Connection getConnection() {
		if(conn == null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return conn;
	}

	public static void close() { // static을 붙이지 않으면 web 접속이 되지 않는다
		if (conn != null) {
			try {
				if (!conn.isClosed()) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}

		conn = null;
	}

}
