package com.kosa.hrsystem.utils;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionHelper {
	public static Connection getConnection() {
		//Oracle , Mysql 두개를 사용한다는 전제하에
			try {
					Context context = new InitialContext();
					DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
					Connection conn = ds.getConnection();
					return conn;
			} catch (Exception e) {
				System.out.println("connection : " + e.getMessage());
				return null;
			}

	}

	public static void main(String[] args) {
		ConnectionHelper.getConnection();
		System.out.println("왜됨");
	}

	 public static void close(Connection conn) {

			if(conn != null) {
				try {
					conn.close();
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}

		public static void close(Statement stmt) {
			if(stmt != null) {
				try {
					stmt.close();
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}

		public static void close(ResultSet rs) {
			if(rs != null) {
				try {
					rs.close();
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}

		public static void close(PreparedStatement pstmt) {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	
}
