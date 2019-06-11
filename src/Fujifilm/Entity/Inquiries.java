package Fujifilm.Entity;

public class Inquiries {

	private int sNo;
	private String pName;
	private int pNo;
	private int qty;

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "Inquiries [sNo=" + sNo + ", pName=" + pName + ", pNo=" + pNo + ", qty=" + qty + "]";
	}

}
