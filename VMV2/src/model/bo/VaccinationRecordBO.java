package model.bo;

import java.util.ArrayList;

import model.bean.VaccinationRecord;
import model.bean.VaccinationRecordHolder;
import model.dao.VaccinationRecordDAO;

public class VaccinationRecordBO {
	VaccinationRecordDAO dao = new VaccinationRecordDAO();

	public ArrayList<VaccinationRecord> getAllVaccinationRecords() {
		return dao.getAllVaccinationRecords();
	}

	public ArrayList<VaccinationRecordHolder> getAllVaccinationRecordsHolder() {
		return dao.getAllVaccinationRecordsHolder();
	}

	public ArrayList<VaccinationRecord> getVaccinationRecordsByUser(int userId) {
		return dao.getVaccinationRecordsByUser(userId);
	}

	public ArrayList<VaccinationRecord> getVaccinationRecordsByVaccine(
			int vaccineId) {
		return dao.getVaccinationRecordsByVaccine(vaccineId);
	}

	public VaccinationRecord getVaccinationRecord(int userId, int vaccineId,
			int dose) {
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
	
	public int getCurrentDose(int userId, int vaccineId) {
		return dao.getCurrentDose(userId, vaccineId);
	}
	public VaccinationRecordHolder getVaccinationRecordHolderById(int idUser,
			int idVaccine, int dose) {
		return dao.getVaccinationRecordHolderById(idUser,idVaccine,dose);
	}
}
