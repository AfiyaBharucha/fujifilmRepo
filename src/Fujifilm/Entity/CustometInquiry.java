package Fujifilm.Entity;

import java.util.Collection;

public class CustometInquiry {

	int id;
	Collection<Inquiries> inquiries;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Collection<Inquiries> getInquiries() {
		return inquiries;
	}

	public void setInquiries(Collection<Inquiries> inquiries) {
		this.inquiries = inquiries;
	}

	@Override
	public String toString() {
		return "CustometInquiry [id=" + id + ", inquiries=" + inquiries + "]";
	}

}
