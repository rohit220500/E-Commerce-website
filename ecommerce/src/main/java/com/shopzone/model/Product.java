package com.shopzone.model;

public class Product {

    private int id;
    private String name;
    private String description;
    private double price;
    private double originalPrice;
    private String imageUrl;
    private String category;
    private double rating;
    private int reviewCount;
    private boolean inStock;
    private String badge; // "NEW", "SALE", "HOT", etc.

    public Product() {}

    public Product(int id, String name, String description, double price, double originalPrice,
                   String imageUrl, String category, double rating, int reviewCount,
                   boolean inStock, String badge) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.originalPrice = originalPrice;
        this.imageUrl = imageUrl;
        this.category = category;
        this.rating = rating;
        this.reviewCount = reviewCount;
        this.inStock = inStock;
        this.badge = badge;
    }

    public int getDiscountPercent() {
        if (originalPrice > price) {
            return (int) Math.round((1 - price / originalPrice) * 100);
        }
        return 0;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getOriginalPrice() { return originalPrice; }
    public void setOriginalPrice(double originalPrice) { this.originalPrice = originalPrice; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public int getReviewCount() { return reviewCount; }
    public void setReviewCount(int reviewCount) { this.reviewCount = reviewCount; }

    public boolean isInStock() { return inStock; }
    public void setInStock(boolean inStock) { this.inStock = inStock; }

    public String getBadge() { return badge; }
    public void setBadge(String badge) { this.badge = badge; }
}
