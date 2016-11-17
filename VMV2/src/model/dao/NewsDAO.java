package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.News;

public class NewsDAO {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;
	
	private ArrayList<News> newsList= null;
	private News news = null;
	
	public ArrayList<News> getAllNews() {
		newsList = new ArrayList<>();
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getAllNews()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5));
				newsList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return newsList;
	}
	
	public News getNewsById(int newsId) {	
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getNewsById(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, newsId);
			rs = cstmt.executeQuery();
			
			if (rs.next()) {
				news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return news;
	}
	
	public int insertNews(News news) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_insertNews(?, ?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, news.getTitle());
			cstmt.setString(2, news.getContent());
			cstmt.setString(3, news.getImage());
			cstmt.setTimestamp(4, news.getCreatedDate());
			result = cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return result;
	}
	
	public int updateNews(News news) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_updateNews(?, ?, ?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt = con.prepareCall(query);
			cstmt.setString(1, news.getTitle());
			cstmt.setString(2, news.getContent());
			cstmt.setString(3, news.getImage());
			cstmt.setTimestamp(4, news.getCreatedDate());
			cstmt.setInt(5, news.getNewsId());
			result = cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return result;
	}
	
	public int deleteNews(int newsId) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_deleteNews(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, newsId);
			result = cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return result;
	}

	public ArrayList<News> getNewsLimit(int start, int limit) {
		newsList = new ArrayList<>();
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getNewsLimit(?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, start);
			cstmt.setInt(2, limit);
			rs = cstmt.executeQuery();
			
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5));
				newsList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return newsList;
	}

	public int countNews() {
		int result = 0;
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_countNews()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		return result;
	}

}
