package com;
import java.util.Map;
import java.util.HashMap;

public class Cart {
    private Map<Integer, FoodItem> items =new HashMap<>();
    public void addItem(FoodItem item) {
          items.put(item.getId(), item);
        }

    public void removeItem(int itemId) {
        items.remove(itemId);
    }

    public Map<Integer,FoodItem> getItems() {
        return items;
    }

   public void clear() {
	   items.clear();
   }
}
