package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerException;

public class SqlConnection {
	private static Connection con = null;

	public static Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager
					.getConnection("jdbc:sqlserver://localhost:1433; database=vmv2db; username=sa; password=123456");
		} catch (ClassNotFoundException e) {
			System.err.println("Can not get SQLServerDriver class !");
			e.printStackTrace();
		} catch (SQLServerException e) {
			// TODO Auto-generated catch block
			System.out.println("Khong ket noi voi database");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Khong the mo duoc ket noi");
			e.printStackTrace();
		}
		return con;
	}
	
	public static void closeConnection(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.err.println("Can not close connection !");
			e.printStackTrace();
		}
	}

	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			System.err.println("Can not close ResultSet !");
			e.printStackTrace();
		}
	}

	public static void closePrepareStatement(PreparedStatement pstmt) {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {
			System.err.println("Can not close PreparedStatement  !");
			e.printStackTrace();
		}
	}
	
	public static void closeCallableStatement(CallableStatement cstmt) {
		try {
			if (cstmt != null) {
				cstmt.close();
			}
		} catch (SQLException e) {
			System.err.println("Can not close CallableStatement  !");
			e.printStackTrace();
		}
	}
}
