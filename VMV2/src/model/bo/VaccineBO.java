package model.bo;

import java.util.ArrayList;

import model.bean.Vaccine;
import model.dao.VaccineDAO;

public class VaccineBO {
	VaccineDAO dao = new VaccineDAO();
	
	public ArrayList<Vaccine> getAllVaccines() {
		return dao.getAllVaccines();
	}
	
	public ArrayList<Vaccine> getVaccinesLimit(int start, int limit) {
		return dao.getVaccinesLimit(start, limit);
	}
	
	public Vaccine getVaccineById(int vaccineId) {
		return dao.getVaccineById(vaccineId);
	}
	
	public int insertVaccine(Vaccine vaccine) {
		return dao.insertVaccine(vaccine);
	}
	
	public int updateVaccine(Vaccine vaccine) {
		return dao.updateVaccine(vaccine);
	}
	
	public int deleteVaccine(int vaccineId) {
		return dao.deleteVaccine(vaccineId);
	}
	
	public int countVaccines() {
		return dao.countVaccines();
	}
}
