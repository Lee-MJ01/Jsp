package dto.college;

public class CourseDTO {
	private String stdNo;
	private String name;
	private String brith;
	private String major;
	private String enr_date;
	public String getStdNo() {
		return stdNo;
	}
	public void setStdNo(String stdNo) {
		this.stdNo = stdNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrith() {
		return brith;
	}
	public void setBrith(String brith) {
		this.brith = brith;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEnr_date() {
		return enr_date;
	}
	public void setEnr_date(String enr_date) {
		this.enr_date = enr_date;
	}
	@Override
	public String toString() {
		return "StudentDTO [stdNo=" + stdNo + ", name=" + name + ", brith=" + brith + ", major=" + major + ", enr_date="
				+ enr_date + "]";
	}
}
