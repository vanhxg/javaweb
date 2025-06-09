package model;

import java.util.Objects;

public class Brand {
	private String brandId;
	private String brandName;
	private String brandAddress;
	private String brandMobiphone;
	
	public Brand() {
		
	}
	// test commit
	// test commit 2
	public Brand(String brandId, String brandName, String brandAddress, String brandMobiphone) {
		super();
		this.brandId = brandId;
		this.brandName = brandName;
		this.brandAddress = brandAddress;
		this.brandMobiphone = brandMobiphone;
	}

	public String getBrandId() {
		return brandId;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getBrandAddress() {
		return brandAddress;
	}

	public void setBrandAddress(String brandAddress) {
		this.brandAddress = brandAddress;
	}

	public String getBrandMobiphone() {
		return brandMobiphone;
	}

	public void setBrandMobiphone(String brandMobiphone) {
		this.brandMobiphone = brandMobiphone;
	}

	@Override
	public int hashCode() {
		return Objects.hash(brandAddress, brandId, brandMobiphone, brandName);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Brand other = (Brand) obj;
		return Objects.equals(brandId, other.brandId);
	}

	@Override
	public String toString() {
		return "Brand [brandId=" + brandId + ", brandName=" + brandName + ", brandAddress=" + brandAddress
				+ ", brandMobiphone=" + brandMobiphone + "]";
	}
	
	
	
	
	
}
