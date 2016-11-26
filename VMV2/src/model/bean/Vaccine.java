package model.bean;

public class Vaccine {
	private int vaccineId;
	private String vaccineName;
	private String manufacturer;
	private double price;
	private int numberOfDoses;
	private String sideEffects;
	private String indication;
	private String contraindication;
	private String dosageAndUsage;
	private String image;
	
	public Vaccine() {
		
	}
	
	public Vaccine(int vaccineId, String vaccineName, String manufacturer, double price, int numberOfDoses,
			String sideEffects, String indication, String contraindication, String dosageAndUsage, String image) {
		this.vaccineId = vaccineId;
		this.vaccineName = vaccineName;
		this.manufacturer = manufacturer;
		this.price = price;
		this.numberOfDoses = numberOfDoses;
		this.sideEffects = sideEffects;
		this.indication = indication;
		this.contraindication = contraindication;
		this.dosageAndUsage = dosageAndUsage;
		this.image = image;
	}

	public Vaccine(String vaccineName, String manufacturer, double price, int numberOfDoses, String sideEffects,
			String indication, String contraindication, String dosageAndUsage, String image) {
		this.vaccineName = vaccineName;
		this.manufacturer = manufacturer;
		this.price = price;
		this.numberOfDoses = numberOfDoses;
		this.sideEffects = sideEffects;
		this.indication = indication;
		this.contraindication = contraindication;
		this.dosageAndUsage = dosageAndUsage;
		this.image = image;
	}

	public int getVaccineId() {
		return vaccineId;
	}

	public void setVaccineId(int vaccineId) {
		this.vaccineId = vaccineId;
	}

	public String getVaccineName() {
		return vaccineName;
	}

	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getNumberOfDoses() {
		return numberOfDoses;
	}

	public void setNumberOfDoses(int numberOfDoses) {
		this.numberOfDoses = numberOfDoses;
	}

	public String getSideEffects() {
		return sideEffects;
	}

	public void setSideEffects(String sideEffects) {
		this.sideEffects = sideEffects;
	}

	public String getIndication() {
		return indication;
	}

	public void setIndication(String indication) {
		this.indication = indication;
	}

	public String getContraindication() {
		return contraindication;
	}

	public void setContraindication(String contraindication) {
		this.contraindication = contraindication;
	}

	public String getDosageAndUsage() {
		return dosageAndUsage;
	}

	public void setDosageAndUsage(String dosageAndUsage) {
		this.dosageAndUsage = dosageAndUsage;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Vaccine [vaccineId=" + vaccineId + ", vaccineName=" + vaccineName + ", manufacturer=" + manufacturer
				+ ", price=" + price + ", numberOfDoses=" + numberOfDoses + ", sideEffects=" + sideEffects
				+ ", indication=" + indication + ", contraindication=" + contraindication + ", dosageAndUsage="
				+ dosageAndUsage + ", image=" + image + "]";
	}

}
