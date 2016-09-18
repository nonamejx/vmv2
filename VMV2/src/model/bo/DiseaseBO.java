package model.bo;

import java.util.ArrayList;

import model.bean.Disease;
import model.dao.DiseaseDAO;

public class DiseaseBO {
	DiseaseDAO dao = new DiseaseDAO();
	
	public ArrayList<Disease> getAllDiseases() {
		return dao.getAllDiseases();
	}
	
	public Disease getDiseaseById(int diseaseId) {
		return dao.getDiseaseById(diseaseId);
	}
	
	public int insertDisease(Disease disease) {
		return dao.insertDisease(disease);
	}
	
	public int updateDisease(Disease disease) {
		return dao.updateDisease(disease);
	}
	
	public int deleteDisease(int diseaseId) {
		return dao.deleteDisease(diseaseId);
	}
}
