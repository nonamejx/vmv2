package model.bo;

import java.util.ArrayList;

import model.bean.VaccineDisease;
import model.dao.VaccineDiseaseDAO;

public class VaccineDiseaseBO {
	VaccineDiseaseDAO dao = new VaccineDiseaseDAO();
	
	public ArrayList<VaccineDisease> getAllVaccineDiseases() {
		return dao.getAllVaccineDiseases();
	}
	
	public VaccineDisease getVaccineDiseaseById(int vaccineId, int diseaseId) {
		return dao.getVaccineDiseaseById(vaccineId, diseaseId);
	}
	
	public int insertVaccineDisease(VaccineDisease vaccineDisease) {
		return dao.insertVaccineDisease(vaccineDisease);
	}
	
	public int updateVaccineDisease(VaccineDisease vaccineDisease) {
		return dao.updateVaccineDisease(vaccineDisease);
	}
	
	public int deleteVaccineDisease(int vaccineId, int diseaseId) {
		return dao.deleteVaccineDisease(vaccineId, diseaseId);
	}
	
	public ArrayList<VaccineDisease> getVaccineDiseasesByVaccineId(int vaccineId) {
		return dao.getVaccineDiseasesByVaccineId(vaccineId);
	}
	
	public int deleteVaccineDiseaseByVaccineId(int vaccineId) {
		return dao.deleteVaccineDiseaseByVaccineId(vaccineId);
	}
}
