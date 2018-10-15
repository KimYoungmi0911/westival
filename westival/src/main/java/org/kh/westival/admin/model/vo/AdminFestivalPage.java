package org.kh.westival.admin.model.vo;

public class AdminFestivalPage {
	private int startRow;
	private int endRow;
	
	public AdminFestivalPage(){}

	public AdminFestivalPage(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "AdminFestivalPage [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	

}
