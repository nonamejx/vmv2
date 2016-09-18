package model.bo;

import java.util.ArrayList;

import model.bean.VaccinationRecord;
import model.dao.VaccinationRecordDAO;

public class VaccinationRecordBO {
	VaccinationRecordDAO dao = new VaccinationRecordDAO();
	
	public ArrayList<VaccinationRecord> getAllVaccinationRecord() {
		return dao.getAllVaccinationRecord();
	}
	
	public ArrayList<VaccinationRecord> getVaccinationRecordsByUser(int userId) {
		return dao.getVaccinationRecordsByUser(userId);
	}
	
	public ArrayList<VaccinationRecord> getVaccinationRecordsByVaccine(int vaccineId) {
		return dao.getVaccinationRecordsByVaccine(vaccineId);
	}
	
	public VaccinationRecord getVaccinationRecords(int userId, int vaccineId, int dose) {
		return dao.getVaccinationRecord(userId, vaccineId, dose);
	}
	
	public int insertVaccinationRecord(VaccinationRecord vaccinationRecord) {
		return dao.insertVaccinationRecord(vaccinationRecord);
	}
	
	public int updateVaccinationRecord(VaccinationRecord vaccinationRecord) {
		return dao.updateVaccinationRecord(vaccinationRecord);
	}
	
	public int deleteVaccinationRecord(int userId, int vaccineId, int dose) {
		return dao.deleteVaccinationRecord(userId, vaccineId, dose);
	}
}
