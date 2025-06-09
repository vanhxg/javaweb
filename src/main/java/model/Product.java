package model;

import java.util.Objects;

public class Product {
	private String productId;
	private String productName;
	private String productImage;
	private int productQuantity;
	private int productCost;
	private Category category;
	private Brand brand;
	private String productDescription;
	
	public Product() {
		super();
	}
	
	public Product(String productId) {
	    this.productId = productId;
	}
	
	public Product(String productId, String productName, String productImage, int productQuantity, int productCost,
			Category category, Brand brand, String productDescription) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImage = productImage;
		this.productQuantity = productQuantity;
		this.productCost = productCost;
		this.category = category;
		this.brand = brand;
		this.productDescription = productDescription;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public int getProductCost() {
		return productCost;
	}

	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	@Override
	public int hashCode() {
		return Objects.hash(productId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return Objects.equals(productId, other.productId);
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productImage=" + productImage
				+ ", productQuantity=" + productQuantity + ", productCost=" + productCost + ", category=" + category
				+ ", brand=" + brand + ", productDescription=" + productDescription + "]";
	}
	
	
	
	
	
}
