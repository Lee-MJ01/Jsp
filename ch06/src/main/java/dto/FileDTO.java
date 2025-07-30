package dto;

public class FileDTO {
	private int no;
	private String title;
	private String name;
	private String oname;
	private String sname;
	private String rdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	@Override
	public String toString() {
		return "FileDTO [no=" + no + ", title=" + title + ", name=" + name + ", oname=" + oname + ", sname=" + sname
				+ ", rdate=" + rdate + "]";
	}
}
