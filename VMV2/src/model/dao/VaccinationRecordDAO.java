package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.VaccinationRecord;
import model.bean.VaccinationRecordHolder;

public class VaccinationRecordDAO {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;

	private ArrayList<VaccinationRecord> vaccinationRecords = null;
	private VaccinationRecord vaccinationRecord = null;

	private ArrayList<VaccinationRecordHolder> vaccinationRecordsHolder = null;

	public ArrayList<VaccinationRecord> getAllVaccinationRecords() {
		vaccinationRecords = new ArrayList<>();

		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getAllVaccinationRecords()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();

			while (rs.next()) {
				VaccinationRecord vaccinationRecord = new VaccinationRecord(
						rs.getInt(1), rs.getInt(2), rs.getInt(3),
						rs.getDate(4), rs.getDate(5));
				vaccinationRecords.add(vaccinationRecord);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}

		return vaccinationRecords;
	}

	public ArrayList<VaccinationRecord> getVaccinationRecordsByUser(int userId) {
		vaccinationRecords = new ArrayList<>();

		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getVaccinationRecordsByUser(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, userId);
			rs = cstmt.executeQuery();

			while (rs.next()) {
				VaccinationRecord vaccinationRecord = new VaccinationRecord(
						rs.getInt(1), rs.getInt(2), rs.getInt(3),
						rs.getDate(4), rs.getDate(5));
				vaccinationRecords.add(vaccinationRecord);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}

		return vaccinationRecords;
	}

	public ArrayList<VaccinationRecord> getVaccinationRecordsByVaccine(
			int vaccineId) {
		vaccinationRecords = new ArrayList<>();

		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getVaccinationRecordsByVaccine(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, vaccineId);
			rs = cstmt.executeQuery();

			while (rs.next()) {
				VaccinationRecord vaccinationRecord = new VaccinationRecord(
						rs.getInt(1), rs.getInt(2), rs.getInt(3),
						rs.getDate(4), rs.getDate(5));
				vaccinationRecords.add(vaccinationRecord);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}

		return vaccinationRecords;
	}

	public VaccinationRecord getVaccinationRecord(int userId, int vaccineId,
			int dose) {
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getVaccinationRecord(?,?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, userId);
			cstmt.setInt(2, vaccineId);
			cstmt.setInt(3, dose);
			rs = cstmt.executeQuery();

			if (rs.next()) {
				vaccinationRecord = new VaccinationRecord(rs.getInt(1),
						rs.getInt(2), rs.getInt(3), rs.getDate(4),
						rs.getDate(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}

		return vaccinationRecord;
	}

	public int insertVaccinationRecord(VaccinationRecord vaccinationRecord) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_insertVaccinationRecord(?,?,?,?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, vaccinationRecord.getUserId());
			cstmt.setInt(2, vaccinationRecord.getVaccineId());
			cstmt.setInt(3, vaccinationRecord.getDose());
			cstmt.setDate(4, vaccinationRecord.getInjectionDate());
			cstmt.setDate(5, vaccinationRecord.getNextDoseDate());
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

	public int updateVaccinationRecord(VaccinationRecord vaccinationRecord) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_updateVaccinationRecord(?,?,?,?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setDate(1, vaccinationRecord.getInjectionDate());
			cstmt.setDate(2, vaccinationRecord.getNextDoseDate());
			cstmt.setInt(3, vaccinationRecord.getUserId());
			cstmt.setInt(4, vaccinationRecord.getVaccineId());
			cstmt.setInt(5, vaccinationRecord.getDose());
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

	public int deleteVaccinationRecord(int userId, int vaccineId, int dose) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_deleteVaccinationRecord(?,?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, userId);
			cstmt.setInt(2, vaccineId);
			cstmt.setInt(3, dose);
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

	public ArrayList<VaccinationRecordHolder> getAllVaccinationRecordsHolder() {
		vaccinationRecordsHolder = new ArrayList<>();

		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getAllVaccinationRecordHolder()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();

			while (rs.next()) {
				VaccinationRecordHolder vaccinationRecordHolder = new VaccinationRecordHolder(
						rs.getInt(2), rs.getInt(1), rs.getString(6),
						rs.getString(7), rs.getInt(3), rs.getDate(4),
						rs.getDate(5));
				vaccinationRecordsHolder.add(vaccinationRecordHolder);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlConnection.closeConnection(this.con);
			SqlConnection.closePrepareStatement(cstmt);
			SqlConnection.closeResultSet(rs);
		}

		return vaccinationRecordsHolder;
	}
	
	public int getCurrentDose(int userId, int vaccineId) {
		int result = 0;
		try {
			con = SqlConnection.getConnection();
			String query = "{CALL p_getCurrentDose(?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, userId);
			cstmt.setInt(2, vaccineId);
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
