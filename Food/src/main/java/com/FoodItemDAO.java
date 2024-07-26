package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodItemDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/FoodOrderDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public List<FoodItem> getAllFoodItems() {
        List<FoodItem> items = new ArrayList<>();
        String query = "SELECT * FROM food_items";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(query);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String imageUrl = rs.getString("image_url");

                    FoodItem item = new FoodItem(id, name, price, quantity, imageUrl, false);
                    items.add(item);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return items;
    }

    public FoodItem getFoodItemById(int id) {
        String query = "SELECT * FROM food_items WHERE id = ?";
        FoodItem item = null;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String imageUrl = rs.getString("image_url");

                item = new FoodItem(id, name, price, quantity, imageUrl, false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return item;
    }

    public List<FoodItem> getPopularFoodItems() {
        List<FoodItem> items = new ArrayList<>();
        String query = "SELECT * FROM food_items WHERE is_popular = TRUE LIMIT 4";  // Adjust the query as needed
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String imageUrl = rs.getString("image_url");
                boolean isPopular = rs.getBoolean("is_popular");

                FoodItem item = new FoodItem(id, name, price, quantity, imageUrl, isPopular);
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    // New methods to get Veg, Non-Veg, and Drinks
    public List<FoodItem> getVegFoodItems() {
        List<FoodItem> items = new ArrayList<>();
        String query = "SELECT * FROM food_items WHERE category = 'Veg'";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String imageUrl = rs.getString("image_url");

                FoodItem item = new FoodItem(id, name, price, quantity, imageUrl, false);
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    public List<FoodItem> getNonVegFoodItems() {
        List<FoodItem> items = new ArrayList<>();
        String query = "SELECT * FROM food_items WHERE category = 'Non-Veg'";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String imageUrl = rs.getString("image_url");

                FoodItem item = new FoodItem(id, name, price, quantity, imageUrl, false);
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    public List<FoodItem> getDrinks() {
        List<FoodItem> items = new ArrayList<>();
        String query = "SELECT * FROM food_items WHERE category = 'Drinks'";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String imageUrl = rs.getString("image_url");

                FoodItem item = new FoodItem(id, name, price, quantity, imageUrl, false);
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }
}
