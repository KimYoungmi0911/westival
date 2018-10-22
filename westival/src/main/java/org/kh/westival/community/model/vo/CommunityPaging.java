package org.kh.westival.community.model.vo;

public class CommunityPaging implements java.io.Serializable{
	   private final static long serialVersionUID = 11L;
	    
	   private int currentPage;
	   private int limit = 10;
	   private int listCount;
	   private int startPage;
	   private int endPage;
	   private int maxPage;
	   private int startRow;
	   private int endRow;
	   
	   public CommunityPaging (){}

	public CommunityPaging(int currentPage, int limit, int listCount, int startPage, int endPage, int maxPage,
			int startRow, int endRow) {
		super();
		this.currentPage = currentPage;
		this.limit = limit;
		this.listCount = listCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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
		return "CommunityPaging [currentPage=" + currentPage + ", limit=" + limit + ", listCount=" + listCount
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage + ", startRow="
				+ startRow + ", endRow=" + endRow + "]";
	}      
	   
}
