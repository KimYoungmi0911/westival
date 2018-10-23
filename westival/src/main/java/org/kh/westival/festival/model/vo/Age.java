package org.kh.westival.festival.model.vo;

public class Age implements java.io.Serializable{
	private final static long serialVersionUID = 567L;
	
	private double age10;
	private double age20;
	private double age30;
	private double age40;
	private double age50;
	private double totalAge;
	
	public Age(){}

	public Age(double age10, double age20, double age30, double age40, double age50, double totalAge) {
		super();
		this.age10 = age10;
		this.age20 = age20;
		this.age30 = age30;
		this.age40 = age40;
		this.age50 = age50;
		this.totalAge = totalAge;
	}

	public double getAge10() {
		return age10;
	}

	public void setAge10(double age10) {
		this.age10 = age10;
	}

	public double getAge20() {
		return age20;
	}

	public void setAge20(double age20) {
		this.age20 = age20;
	}

	public double getAge30() {
		return age30;
	}

	public void setAge30(double age30) {
		this.age30 = age30;
	}

	public double getAge40() {
		return age40;
	}

	public void setAge40(double age40) {
		this.age40 = age40;
	}

	public double getAge50() {
		return age50;
	}

	public void setAge50(double age50) {
		this.age50 = age50;
	}

	public double getTotalAge() {
		return totalAge;
	}

	public void setTotalAge(double totalAge) {
		this.totalAge = totalAge;
	}

	@Override
	public String toString() {
		return "Age [age10=" + age10 + ", age20=" + age20 + ", age30=" + age30 + ", age40=" + age40 + ", age50=" + age50
				+ ", totalAge=" + totalAge + "]";
	}
	
	
}
