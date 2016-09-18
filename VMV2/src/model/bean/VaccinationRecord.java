package model.bean;

import java.sql.Date;

public class VaccinationRecord {
	private int userId;
	private int vaccineId;
	private int dose;
	private Date injectionDate;
	private Date nextDoseDate;
	
	public VaccinationRecord(int userId, int vaccineId, int dose, Date injectionDate, Date nextDoseDate) {
		this.userId = userId;
		this.vaccineId = vaccineId;
		this.dose = dose;
		this.injectionDate = injectionDate;
		this.nextDoseDate = nextDoseDate;
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

	@Override
	public String toString() {
		return "VaccinationRecord [userId=" + userId + ", vaccineId=" + vaccineId + ", dose=" + dose
				+ ", injectionDate=" + injectionDate + ", nextDoseDate=" + nextDoseDate + "]";
	}
	
	
}
