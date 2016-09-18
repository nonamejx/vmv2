package model.bean;

public class VaccineDisease {
	private int vaccineId;
	private int diseaseId;
	private String note;
	
	public VaccineDisease(int vaccineId, int diseaseId, String note) {
		super();
		this.vaccineId = vaccineId;
		this.diseaseId = diseaseId;
		this.note = note;
	}

	public int getVaccineId() {
		return vaccineId;
	}

	public void setVaccineId(int vaccineId) {
		this.vaccineId = vaccineId;
	}

	public int getDiseaseId() {
		return diseaseId;
	}

	public void setDiseaseId(int diseaseId) {
		this.diseaseId = diseaseId;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public String toString() {
		return "VaccineDisease [vaccineId=" + vaccineId + ", diseaseId=" + diseaseId + ", note=" + note + "]";
	}
	
	
}
