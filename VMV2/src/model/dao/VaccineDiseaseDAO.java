package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.VaccineDisease;

public class VaccineDiseaseDAO {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;
	
	private ArrayList<VaccineDisease> vaccineDiseases= null;
	private VaccineDisease vaccineDisease = null;
	
	public ArrayList<VaccineDisease> getAllVaccineDiseases() {
		vaccineDiseases = new ArrayList<>();
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getAllVaccineDiseases()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			
			while (rs.next()) {
				VaccineDisease vaccineDisease = new VaccineDisease(rs.getInt(1), 
						rs.getInt(2), rs.getString(3));
				vaccineDiseases.add(vaccineDisease);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return vaccineDiseases;
	}
	
	public ArrayList<VaccineDisease> getVaccineDiseasesByVaccineId(int vaccineId) {
		vaccineDiseases = new ArrayList<>();
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getVaccineDiseaseByVaccineId(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1,vaccineId);
			rs = cstmt.executeQuery();
			
			while (rs.next()) {
				VaccineDisease vaccineDisease = new VaccineDisease(rs.getInt(1), 
						rs.getInt(2), rs.getString(3));
				vaccineDiseases.add(vaccineDisease);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return vaccineDiseases;
	}
	
	public VaccineDisease getVaccineDiseaseById(int vaccineId, int diseaseId) {
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getVaccineDiseaseById(?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, vaccineId);
			cstmt.setInt(2, diseaseId);
			rs = cstmt.executeQuery();
			
			if (rs.next()) {
				vaccineDisease = new VaccineDisease(rs.getInt(1), rs.getInt(2), rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return vaccineDisease;
	}
	
	public int insertVaccineDisease(VaccineDisease vaccineDisease) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_insertVaccineDisease(?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, vaccineDisease.getVaccineId());
			cstmt.setInt(2, vaccineDisease.getDiseaseId());
			cstmt.setString(3, vaccineDisease.getNote());
			
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
	
	public int updateVaccineDisease(VaccineDisease vaccineDisease) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_updateVaccineDisease(?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, vaccineDisease.getNote());
			cstmt.setInt(2, vaccineDisease.getVaccineId());
			cstmt.setInt(3, vaccineDisease.getDiseaseId());
			
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
	
	public int deleteVaccineDisease(int vaccineId, int diseaseId) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_deleteVaccinedisease(?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, vaccineId);
			cstmt.setInt(2, diseaseId);
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
