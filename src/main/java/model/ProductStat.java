package model;

public class ProductStat {
	private String productName;
    private int quantitySold;
    
	public ProductStat() {
		
	}

	public ProductStat(String productName, int quantitySold) {
		
		this.productName = productName;
		this.quantitySold = quantitySold;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantitySold() {
		return quantitySold;
	}

	public void setQuantitySold(int quantitySold) {
		this.quantitySold = quantitySold;
	}

	@Override
	public String toString() {
		return "ProductStat [productName=" + productName + ", quantitySold=" + quantitySold + "]";
	}
	
	
    
	
    
}
