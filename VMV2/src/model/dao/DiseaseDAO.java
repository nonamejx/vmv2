package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Disease;

public class DiseaseDAO {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;
	
	private ArrayList<Disease> diseases= null;
	private Disease disease = null;
	
	public ArrayList<Disease> getAllDiseases() {
		diseases = new ArrayList<>();
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getAllDiseases()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			
			while (rs.next()) {
				Disease disease = new Disease(rs.getInt(1), rs.getString(2), rs.getString(3));
				diseases.add(disease);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return diseases;
	}
	
	public Disease getDiseaseById(int diseaseId) {
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getDiseaseById(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, diseaseId);
			rs = cstmt.executeQuery();
			
			if (rs.next()) {
				disease = new Disease(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return disease;
	}
	
	public int insertDisease(Disease disease) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_insertDisease(?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, disease.getDiseaseName());
			cstmt.setString(2, disease.getDescription());
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
	
	public int updateDisease(Disease disease) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_updateDisease(?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, disease.getDiseaseName());
			cstmt.setString(2, disease.getDescription());
			cstmt.setInt(3, disease.getDiseaseId());
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
	
	public int deleteDisease(int diseaseId) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_deleteDisease(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, diseaseId);
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
}
