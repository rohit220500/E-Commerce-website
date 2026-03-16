package com.shopzone.controller;

import com.shopzone.service.CartService;
import com.shopzone.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("featuredProducts", productService.getFeaturedProducts());
        model.addAttribute("categories", productService.getAllCategories());
        model.addAttribute("cartCount", cartService.getCartCount());
        return "home";
    }

    @GetMapping("/search")
    public String search(@RequestParam(required = false) String q, Model model) {
        if (q != null && !q.trim().isEmpty()) {
            model.addAttribute("products", productService.searchProducts(q));
            model.addAttribute("searchQuery", q);
        } else {
            model.addAttribute("products", productService.getAllProducts());
        }
        model.addAttribute("categories", productService.getAllCategories());
        model.addAttribute("cartCount", cartService.getCartCount());
        return "products";
    }
}
