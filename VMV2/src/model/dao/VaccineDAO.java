package model.dao;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Vaccine;

public class VaccineDAO {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;
	
	private ArrayList<Vaccine> vaccines= null;
	private Vaccine vaccine = null;
	
	public ArrayList<Vaccine> getAllVaccines() {
		vaccines = new ArrayList<>();
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getAllVaccines()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			
			while (rs.next()) {
				Vaccine vaccine = new Vaccine(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getDouble(4), rs.getInt(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), 
						rs.getString(10));
				
				vaccines.add(vaccine);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return vaccines;
	}
	
	public Vaccine getVaccineById(int vaccineId) {
		
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getVaccineById(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, vaccineId);
			rs = cstmt.executeQuery();
			
			if (rs.next()) {
				vaccine = new Vaccine(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getDouble(4), rs.getInt(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), 
						rs.getString(10));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}
		
		return vaccine;
	}
	
	public int insertVaccine(Vaccine vaccine) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_insertVaccine(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, vaccine.getVaccineName());
			cstmt.setString(2, vaccine.getManufacturer());
			cstmt.setDouble(3, vaccine.getPrice());
			cstmt.setInt(4, vaccine.getNumberOfDoses());
			cstmt.setString(5, vaccine.getSideEffects());
			cstmt.setString(6, vaccine.getIndication());
			cstmt.setString(7, vaccine.getContraindication());
			cstmt.setString(8, vaccine.getDosageAndUsage());
			cstmt.setString(9, vaccine.getImage());
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
	
	public int updateVaccine(Vaccine vaccine) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_updateVaccine(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, vaccine.getVaccineName());
			cstmt.setString(2, vaccine.getManufacturer());
			cstmt.setDouble(3, vaccine.getPrice());
			cstmt.setInt(4, vaccine.getNumberOfDoses());
			cstmt.setString(5, vaccine.getSideEffects());
			cstmt.setString(6, vaccine.getIndication());
			cstmt.setString(7, vaccine.getContraindication());
			cstmt.setString(8, vaccine.getDosageAndUsage());
			cstmt.setString(9, vaccine.getImage());
			cstmt.setInt(10, vaccine.getVaccineId());
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
	
	public int deleteVaccine(int vaccineId) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_deleteVaccine(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, vaccineId);
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
