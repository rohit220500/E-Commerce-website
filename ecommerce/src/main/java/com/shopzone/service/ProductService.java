package com.shopzone.service;

import com.shopzone.model.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final List<Product> products = new ArrayList<>();

    public ProductService() {
        loadProducts();
    }

    private void loadProducts() {
        products.add(new Product(1, "Apple iPhone 15 Pro",
                "6.1-inch Super Retina XDR display. Titanium design. A17 Pro chip. 48MP camera system with 3x optical zoom.",
                134900, 149900,
                "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400&h=400&fit=crop",
                "Smartphones", 4.8, 2341, true, "NEW"));

        products.add(new Product(2, "Samsung Galaxy S24 Ultra",
                "6.8-inch QHD+ Dynamic AMOLED. Built-in S Pen. 200MP camera. Snapdragon 8 Gen 3 processor.",
                124999, 139999,
                "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop",
                "Smartphones", 4.7, 1892, true, "HOT"));

        products.add(new Product(3, "Apple MacBook Pro 14\"",
                "Apple M3 Pro chip. 14-inch Liquid Retina XDR display. 18GB unified memory. 512GB SSD storage.",
                199900, 219900,
                "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop",
                "Laptops", 4.9, 876, true, "NEW"));

        products.add(new Product(4, "Dell XPS 15",
                "15.6-inch OLED display. Intel Core i7-13700H. 16GB DDR5 RAM. 512GB NVMe SSD. NVIDIA RTX 4060.",
                169990, 189990,
                "https://images.unsplash.com/photo-1593642702821-c8da6771f0c6?w=400&h=400&fit=crop",
                "Laptops", 4.6, 654, true, "SALE"));

        products.add(new Product(5, "Sony WH-1000XM5",
                "Industry-leading noise cancellation. 30-hour battery life. Crystal-clear hands-free calling. Multipoint connection.",
                29990, 34990,
                "https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=400&h=400&fit=crop",
                "Audio", 4.8, 3210, true, "SALE"));

        products.add(new Product(6, "Apple AirPods Pro (2nd Gen)",
                "Active Noise Cancellation. Adaptive Transparency. Personalized Spatial Audio. USB-C charging case.",
                24900, 26900,
                "https://images.unsplash.com/photo-1606741965509-717d58ff9d31?w=400&h=400&fit=crop",
                "Audio", 4.7, 1456, true, ""));

        products.add(new Product(7, "iPad Pro 12.9\"",
                "M2 chip. 12.9-inch Liquid Retina XDR display. Wi-Fi 6E. 256GB storage. All-day battery life.",
                112900, 119900,
                "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=400&fit=crop",
                "Tablets", 4.8, 987, true, ""));

        products.add(new Product(8, "Samsung 65\" 4K QLED TV",
                "65-inch QLED display. 4K resolution. Neo Quantum Processor. 100% Color Volume. Smart TV with Tizen OS.",
                109990, 139990,
                "https://images.unsplash.com/photo-1593784991095-a205069470b6?w=400&h=400&fit=crop",
                "TVs", 4.6, 543, true, "SALE"));

        products.add(new Product(9, "Logitech MX Master 3S",
                "8K DPI precision tracking. Ultra-fast Mag Speed scrolling. 70-day battery. Works on glass. USB-C charging.",
                9995, 11995,
                "https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400&h=400&fit=crop",
                "Accessories", 4.7, 2109, true, "HOT"));

        products.add(new Product(10, "Apple Watch Series 9",
                "Advanced health features. Blood Oxygen & ECG app. Always-On Retina display. Crash Detection. 18-hr battery.",
                41900, 45900,
                "https://images.unsplash.com/photo-1551816230-ef5deaed4a26?w=400&h=400&fit=crop",
                "Wearables", 4.7, 1765, true, "NEW"));

        products.add(new Product(11, "GoPro HERO12 Black",
                "5.3K video. HyperSmooth 6.0 stabilization. 27MP photos. Waterproof to 10m. Max Lens Mod 2.0 compatible.",
                44990, 49990,
                "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=400&h=400&fit=crop",
                "Cameras", 4.6, 892, true, ""));

        products.add(new Product(12, "ASUS ROG Zephyrus G14",
                "AMD Ryzen 9 7940HS. 14-inch QHD+ 165Hz. 16GB LPDDR5. 1TB SSD. NVIDIA RTX 4060. AniMe Matrix display.",
                139990, 159990,
                "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400&h=400&fit=crop",
                "Laptops", 4.7, 432, true, "HOT"));
    }

    public List<Product> getAllProducts() {
        return products;
    }

    public Product getProductById(int id) {
        return products.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public List<Product> getProductsByCategory(String category) {
        return products.stream()
                .filter(p -> p.getCategory().equalsIgnoreCase(category))
                .collect(Collectors.toList());
    }

    public List<Product> getFeaturedProducts() {
        return products.stream().limit(8).collect(Collectors.toList());
    }

    public List<String> getAllCategories() {
        return products.stream()
                .map(Product::getCategory)
                .distinct()
                .sorted()
                .collect(Collectors.toList());
    }

    public List<Product> searchProducts(String keyword) {
        String lower = keyword.toLowerCase();
        return products.stream()
                .filter(p -> p.getName().toLowerCase().contains(lower)
                        || p.getCategory().toLowerCase().contains(lower)
                        || p.getDescription().toLowerCase().contains(lower))
                .collect(Collectors.toList());
    }

    public List<Product> getRelatedProducts(int productId, String category) {
        return products.stream()
                .filter(p -> p.getCategory().equalsIgnoreCase(category) && p.getId() != productId)
                .limit(4)
                .collect(Collectors.toList());
    }
}
