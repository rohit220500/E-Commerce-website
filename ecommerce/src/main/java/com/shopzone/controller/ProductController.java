package com.shopzone.controller;

import com.shopzone.model.Product;
import com.shopzone.service.CartService;
import com.shopzone.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    @GetMapping
    public String listProducts(@RequestParam(required = false) String category, Model model) {
        List<Product> products;
        if (category != null && !category.isEmpty()) {
            products = productService.getProductsByCategory(category);
            model.addAttribute("selectedCategory", category);
        } else {
            products = productService.getAllProducts();
        }
        model.addAttribute("products", products);
        model.addAttribute("categories", productService.getAllCategories());
        model.addAttribute("cartCount", cartService.getCartCount());
        return "products";
    }

    @GetMapping("/{id}")
    public String productDetail(@PathVariable int id, Model model) {
        Product product = productService.getProductById(id);
        if (product == null) {
            return "redirect:/products";
        }
        model.addAttribute("product", product);
        model.addAttribute("relatedProducts",
                productService.getRelatedProducts(id, product.getCategory()));
        model.addAttribute("categories", productService.getAllCategories());
        model.addAttribute("cartCount", cartService.getCartCount());
        return "product-detail";
    }
}
