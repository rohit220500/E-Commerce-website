package com.shopzone.service;

import com.shopzone.model.Cart;
import com.shopzone.model.Product;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

@Service
@SessionScope
public class CartService {

    private final Cart cart = new Cart();

    public void addToCart(Product product, int quantity) {
        cart.addItem(product, quantity);
    }

    public void removeFromCart(int productId) {
        cart.removeItem(productId);
    }

    public void updateQuantity(int productId, int quantity) {
        cart.updateQuantity(productId, quantity);
    }

    public void clearCart() {
        cart.clear();
    }

    public Cart getCart() {
        return cart;
    }

    public int getCartCount() {
        return cart.getTotalItems();
    }
}
