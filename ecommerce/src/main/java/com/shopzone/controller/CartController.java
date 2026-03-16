package com.shopzone.controller;

import com.shopzone.model.Product;
import com.shopzone.service.CartService;
import com.shopzone.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @GetMapping
    public String viewCart(Model model) {
        model.addAttribute("cart", cartService.getCart());
        model.addAttribute("cartCount", cartService.getCartCount());
        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam int productId,
                            @RequestParam(defaultValue = "1") int quantity,
                            RedirectAttributes redirectAttributes) {
        Product product = productService.getProductById(productId);
        if (product != null && product.isInStock()) {
            cartService.addToCart(product, quantity);
            redirectAttributes.addFlashAttribute("successMsg",
                    product.getName() + " added to cart!");
        }
        return "redirect:/products/" + productId;
    }

    @PostMapping("/update")
    public String updateQuantity(@RequestParam int productId,
                                  @RequestParam int quantity) {
        cartService.updateQuantity(productId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam int productId) {
        cartService.removeFromCart(productId);
        return "redirect:/cart";
    }

    @PostMapping("/clear")
    public String clearCart() {
        cartService.clearCart();
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String checkout(Model model) {
        model.addAttribute("cart", cartService.getCart());
        model.addAttribute("cartCount", cartService.getCartCount());
        return "checkout";
    }

    @PostMapping("/place-order")
    public String placeOrder(RedirectAttributes redirectAttributes) {
        cartService.clearCart();
        redirectAttributes.addFlashAttribute("orderSuccess", true);
        return "redirect:/order-success";
    }

    @GetMapping("/order-success")
    public String orderSuccess(Model model) {
        model.addAttribute("cartCount", 0);
        return "order-success";
    }
}
