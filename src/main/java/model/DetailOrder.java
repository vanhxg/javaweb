package model;

import java.util.Objects;

public class DetailOrder {
	private String detailOrderId;
	private Order order;
	private Product product;
	private int quantityOrder;
	private int totalPrice;
	
	public DetailOrder() {
		super();
	}

	public DetailOrder(String detailOrderId, Order order, Product product, int quantityOrder, int totalPrice) {
		super();
		this.detailOrderId = detailOrderId;
		this.order = order;
		this.product = product;
		this.quantityOrder = quantityOrder;
		this.totalPrice = totalPrice;
	}

	public String getDetailOrderId() {
		return detailOrderId;
	}

	public void setDetailOrderId(String detailOrderId) {
		this.detailOrderId = detailOrderId;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantityOrder() {
		return quantityOrder;
	}

	public void setQuantityOrder(int quantityOrder) {
		this.quantityOrder = quantityOrder;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public int hashCode() {
		return Objects.hash(detailOrderId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DetailOrder other = (DetailOrder) obj;
		return Objects.equals(detailOrderId, other.detailOrderId);
	}

	@Override
	public String toString() {
		return "DetailOrder [detailOrderId=" + detailOrderId + ", order=" + order + ", product=" + product
				+ ", quantityOrder=" + quantityOrder + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
}
