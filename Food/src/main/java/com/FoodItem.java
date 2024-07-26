package com;

public class FoodItem {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private String imageUrl;// Add imageUrl attribute
    private boolean isPopular;

    public FoodItem(int id, String name, double price, int quantity, String imageUrl,boolean isPopular) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.isPopular=isPopular;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    public boolean isPopular() {
        return isPopular;
    }

    public void setPopular(boolean isPopular) {
        this.isPopular = isPopular;
    }
}
