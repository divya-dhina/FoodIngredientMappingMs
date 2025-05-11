package com.cloudkitchen.foodingredientmapping_ms.external;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

// Replace with the correct service name registered in Eureka
@FeignClient(name = "inventoryitem-ms",url = "https://inventoryitemms.onrender.com")
public interface InventoryItemClient {

    @GetMapping("/api/food-items/{id}")
    com.cloudkitchen.foodingredientmapping_ms.external.InventoryItemDto getFoodItemById(@PathVariable("id") Long id);
}
