package model.bean;

import java.sql.Date;

public class VaccinationRecordHolder {
	private String vaccinationRecordHolderId;
	private int userId;
	private int vaccineId;
	private String userName;
	private String vaccineName;
	private int dose;
	private Date injectionDate;
	private Date nextDoseDate;

	public String getVaccinationRecordHolderId() {
		return vaccinationRecordHolderId;
	}

	public void setVaccinationRecordHolderId(String vaccinationRecordHolderId) {
		this.vaccinationRecordHolderId = vaccinationRecordHolderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getVaccineId() {
		return vaccineId;
	}

	public void setVaccineId(int vaccineId) {
		this.vaccineId = vaccineId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getVaccineName() {
		return vaccineName;
	}

	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}

	public int getDose() {
		return dose;
	}

	public void setDose(int dose) {
		this.dose = dose;
	}

	public Date getInjectionDate() {
		return injectionDate;
	}

	public void setInjectionDate(Date injectionDate) {
		this.injectionDate = injectionDate;
	}

	public Date getNextDoseDate() {
		return nextDoseDate;
	}

	public void setNextDoseDate(Date nextDoseDate) {
		this.nextDoseDate = nextDoseDate;
	}

	public VaccinationRecordHolder(int userId, int vaccineId, String userName,
			String vaccineName, int dose, Date injectionDate, Date nextDoseDate) {
		super();
		this.userId = userId;
		this.vaccineId = vaccineId;
		this.userName = userName;
		this.vaccineName = vaccineName;
		this.dose = dose;
		this.injectionDate = injectionDate;
		this.nextDoseDate = nextDoseDate;
	}

	public VaccinationRecordHolder() {
		super();
	}

	@Override
	public String toString() {
		return "VaccinationRecordHolder [userId=" + userId + ", vaccineId="
				+ vaccineId + ", userName=" + userName + ", vaccineName="
				+ vaccineName + ", dose=" + dose + ", injectionDate="
				+ injectionDate + ", nextDoseDate=" + nextDoseDate + "]";
	}

}
