package model;

import java.sql.Date;
import java.util.Objects;

public class Customer {
	private String customerId;
	private String username;
	private String password;
	private String customerName;
	private String customerGender;
	private Date customerDate;
	private String customerAddress;
	private String customerMobiphone;
	private String customerEmail;
	private String isAdmin;
	
	public Customer() {
		super();
	}

	public Customer(String customerId, String username, String password, String customerName, String customerGender,
			Date customerDate, String customerAddress, String customerMobiphone, String customerEmail,String isAdmin) {
		super();
		this.customerId = customerId;
		this.username = username;
		this.password = password;
		this.customerName = customerName;
		this.customerGender = customerGender;
		this.customerDate = customerDate;
		this.customerAddress = customerAddress;
		this.customerMobiphone = customerMobiphone;
		this.customerEmail = customerEmail;
		this.isAdmin = isAdmin;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerGender() {
		return customerGender;
	}

	public void setCustomerGender(String customerGender) {
		this.customerGender = customerGender;
	}

	public Date getCustomerDate() {
		return customerDate;
	}

	public void setCustomerDate(Date customerDate) {
		this.customerDate = customerDate;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerMobiphone() {
		return customerMobiphone;
	}

	public void setCustomerMobiphone(String customerMobiphone) {
		this.customerMobiphone = customerMobiphone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	 public String getIsAdmin() {
	        return isAdmin;
	    }

	    public void setIsAdmin(String isAdmin) {
	        this.isAdmin = isAdmin;
	    }
	@Override
	public int hashCode() {
		return Objects.hash(customerId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		return Objects.equals(customerId, other.customerId);
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", username=" + username + ", password=" + password
				+ ", customerName=" + customerName + ", customerGender=" + customerGender + ", customerDate="
				+ customerDate + ", customerAddress=" + customerAddress + ", customerMobiphone=" + customerMobiphone
				+ ", customerEmail=" + customerEmail + ", isAdmin=" + isAdmin + "]";
	}
	
	
	
	
}