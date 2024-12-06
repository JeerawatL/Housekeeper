
# **Household Inventory Management System**

## **Overview**
The Household Inventory Management System is a database project designed to help users efficiently manage household items across multiple properties. Whether managing a primary home, vacation house, or rental property, this system provides an organized solution for tracking inventory, preventing redundancy, and ensuring essential supplies are always stocked.

---

## **Features**
1. **Inventory Management**: Track item quantities, expiration dates, and thresholds.
2. **Purchase History**: View detailed historical purchases.
3. **Vendor Management**: Track vendor details, including aisle information.
4. **Shopping Lists**: Create and manage detailed shopping lists.
5. **Notifications**: Identify low stock or expiring items.

---

## **Functions Overview**
This section explains 14 functions with descriptions, use cases, SQL examples, and sample outputs when no username is specified (queries all user data).

### **1. GetInventoryDetails**
**Description**: Retrieves inventory details for all houses. Filter by username or view all users' inventory if no username is provided.

**Usage**:
```sql
SELECT * FROM GetInventoryDetails(NULL);
```

**Sample Output**:
| House         | Item      | Quantity | Unit | Owner       | Expiration  |
|---------------|-----------|----------|------|-------------|-------------|
| Main House    | Apples    | 10.00    | pcs  | John Doe    | 2024-12-31  |
| Vacation Home | WD40      | 5.00     | can  | Jane Smith  | NULL        |

---

### **2. GetShoppingListTotal**
**Description**: Calculates the total cost of a shopping list. If no list ID is provided, it calculates for all lists.

**Usage**:
```sql
SELECT GetShoppingListTotal(NULL);
```

**Sample Output**:
| Total Price |
|-------------|
| 450.75      |

---

### **3. NotifyLowStock**
**Description**: Identifies items below the restock threshold. Filter by username or view all users' data.

**Usage**:
```sql
SELECT * FROM NotifyLowStock(NULL);
```

**Sample Output**:
| House         | Item      | Quantity | Threshold | Owner       |
|---------------|-----------|----------|-----------|-------------|
| Main House    | Apples    | 2.00     | 5.00      | John Doe    |
| Vacation Home | Batteries | 1.00     | 3.00      | Jane Smith  |

---

### **4. NotifyNearExpiration**
**Description**: Retrieves items expiring soon. Filter by username and specify the number of days.

**Usage**:
```sql
SELECT * FROM NotifyNearExpiration(7, NULL);
```

**Sample Output**:
| House         | Item      | Expiration Date | Owner       |
|---------------|-----------|-----------------|-------------|
| Main House    | Milk      | 2024-12-08      | John Doe    |
| Vacation Home | Cheese    | 2024-12-10      | Jane Smith  |

---

### **5. LocateItem**
**Description**: Locates a specific item across houses. Specify the item name and filter by username if required.

**Usage**:
```sql
SELECT * FROM LocateItem('Apples', NULL);
```

**Sample Output**:
| House         | Quantity | Unit | Owner       |
|---------------|----------|------|-------------|
| Main House    | 10.00    | pcs  | John Doe    |

---

### **6. GetItemsByCategory**
**Description**: Fetches items by category. Filter results by username if needed.

**Usage**:
```sql
SELECT * FROM GetItemsByCategory('Fruit', NULL);
```

**Sample Output**:
| House         | Item      | Brand        | Quantity | Owner       |
|---------------|-----------|--------------|----------|-------------|
| Main House    | Apples    | Fresh Farms  | 10.00    | John Doe    |

---

### **7. GetTotalSpend**
**Description**: Calculates the total spend across all purchases. Filter by username if required.

**Usage**:
```sql
SELECT GetTotalSpend(NULL);
```

**Sample Output**:
| Total Spend |
|-------------|
| 2000.00     |

---

### **8. GetTotalSpendByMonth**
**Description**: Returns the total spend for each month, grouped by user.

**Usage**:
```sql
SELECT * FROM GetTotalSpendByMonth(NULL);
```

**Sample Output**:
| Month-Year | Total   | Buyer       |
|------------|---------|-------------|
| 2024-01    | 500.00  | John Doe    |
| 2024-02    | 800.00  | Jane Smith  |

---

### **9. GetTotalSpendByYear**
**Description**: Summarizes total spend for each year, grouped by user.

**Usage**:
```sql
SELECT * FROM GetTotalSpendByYear(NULL);
```

**Sample Output**:
| Year | Total   | Buyer       |
|------|---------|-------------|
| 2024 | 3000.00 | John Doe    |
| 2023 | 1500.00 | Jane Smith  |

---

### **10. GetMostPurchasedItems**
**Description**: Identifies the most frequently purchased items, grouped by user.

**Usage**:
```sql
SELECT * FROM GetMostPurchasedItems(NULL, 5);
```

**Sample Output**:
| Item         | Total Quantity | User        |
|--------------|----------------|-------------|
| Apples       | 100.00         | John Doe    |

---

### **11. LocateItemInVendor**
**Description**: Locates an item in a vendor's aisle.

**Usage**:
```sql
SELECT * FROM LocateItemInVendor('Makro', 'Apples');
```

**Sample Output**:
| Aisle Name | Aisle Number |
|------------|--------------|
| Fruits     | 3            |

---

### **12. GetItemPurchaseHistory**
**Description**: Provides the purchase history for a specific item.

**Usage**:
```sql
SELECT * FROM GetItemPurchaseHistory('Apples');
```

**Sample Output**:
| User       | Purchase Date | Quantity | Price |
|------------|---------------|----------|-------|
| John Doe   | 2024-01-01    | 5.00     | 10.00 |

---

### **13. GetVendorTotalSpend**
**Description**: Summarizes total spending for each vendor.

**Usage**:
```sql
SELECT * FROM GetVendorTotalSpend(NULL);
```

**Sample Output**:
| Vendor Name | Total Spend |
|-------------|-------------|
| Makro       | 500.00      |

---

### **14. TrackItemAcrossVendors**
**Description**: Tracks item purchases across all vendors.

**Usage**:
```sql
SELECT * FROM TrackItemAcrossVendors('Apples');
```

**Sample Output**:
| Vendor Name | Total Quantity | Purchase Date |
|-------------|----------------|---------------|
| Makro       | 20.00          | 2024-01-15    |
