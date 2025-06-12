package model;

import java.util.ArrayList;
import java.util.Iterator;

public class Cart {
	private ArrayList<CartItem> items = new ArrayList<>();
    

    public void addItem(Product product) {
        for (CartItem item : items) {
            if (item.getProduct().getProductId() == product.getProductId()) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }
        items.add(new CartItem(product, 1));
    }

    public void removeItem(String productId) {
        items.removeIf(item -> item.getProduct().getProductId() == productId);
    }

    public ArrayList<CartItem> getItems() {
        return items;
    }

    public double getTotal() {
        return items.stream()
                .mapToDouble(i -> i.getProduct().getProductCost() * i.getQuantity())
                .sum();
    }
}
