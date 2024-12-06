
# **Household Inventory Management System**

## **Overview**
The Household Inventory Management System is a database project designed to help users efficiently manage household items across multiple properties. Whether managing a primary home, vacation house, or rental property, this system provides an organized solution for tracking inventory, preventing redundancy, and ensuring essential supplies are always stocked.

This project includes:
- Database schema and ER diagrams for a structured design.
- SQL scripts for table creation, functions, and sample data.
- Documentation for better understanding and usage.

---

## **Features**
1. **Inventory Management:**
   - Track quantities, expiration dates, and restock thresholds for household items.
   - Manage inventory for multiple properties with detailed information.

2. **Purchase History:**
   - View historical purchases, including item details, quantity, price, and vendor.

3. **Shopping List:**
   - Create shopping lists with item quantities, prices, and notes.

4. **Vendor Management:**
   - Maintain vendor details such as contact information and location.

5. **Notifications:**
   - Identify items nearing expiration or low in stock.

---

## **Project Files**
1. **SQL Scripts**:
   - **`create_table.sql`**: SQL script for creating database tables.
   - **`functions.sql`**: Contains PL/pgSQL functions for business logic.
   - **`sample_data.sql`**: Provides initial sample data for testing.

2. **Documentation**:
   - **`Housekeeper.docx`**: Detailed project description.
   - **`Presentation.pdf`**: Overview of the project for presentations.
   - **`Database schema.pdf`**: PDF version of the database schema.
   - **`ER diagram.pdf`**: ER diagram illustrating relationships.

---

## **Functions Overview**

This project includes several functions to simplify and automate database operations. Below are the functions with examples and brief explanations:

### **1. `GetInventoryDetails`**
**Description**: Retrieves the details of inventory items stored in various houses. You can filter results by the owner's name or fetch details for all users if no filter is applied.
**Usage**:
```sql
SELECT * FROM GetInventoryDetails('John Doe');
```
**Example Output**:
| House         | Item          | Quantity | Unit | Owner     | Expiration  |
|---------------|---------------|----------|------|-----------|-------------|
| Main House    | Apples        | 10.00    | pcs  | John Doe  | 2024-12-31  |
| Vacation Home | WD40          | 5.00     | can  | John Doe  | NULL        |

### **2. `GetShoppingListTotal`**
**Description**: Calculates the total cost of a specific shopping list based on item quantities and their price per unit.
**Usage**:
```sql
SELECT GetShoppingListTotal(1);
```
**Example Output**:
| Total Price |
|-------------|
| 150.75      |

---

### **3. `GetLowStockItems`**
**Description**: Returns items that have fallen below their restock threshold, grouped by house.
**Usage**:
```sql
SELECT * FROM GetLowStockItems();
```
**Example Output**:
| House         | Item    | Quantity | Restock Threshold |
|---------------|---------|----------|-------------------|
| Main House    | Apples  | 2.00     | 5.00             |
| Vacation Home | WD40    | 1.00     | 3.00             |

---

### **4. `GetItemsByExpiration`**
**Description**: Fetches items nearing expiration within a specified number of days.
**Usage**:
```sql
SELECT * FROM GetItemsByExpiration(7);
```
**Example Output**:
| House         | Item          | Expiration Date |
|---------------|---------------|-----------------|
| Main House    | Milk          | 2024-12-08      |

---

### **5. `GetVendorItems`**
**Description**: Lists items sold by a specific vendor.
**Usage**:
```sql
SELECT * FROM GetVendorItems(1);
```
**Example Output**:
| Vendor Name | Item          | Brand      | Category |
|-------------|---------------|------------|----------|
| Makro       | Apples        | Makro Brand| Fruit    |

---

### **6. `AddNewItem`**
**Description**: Adds a new item to the inventory.
**Usage**:
```sql
SELECT AddNewItem('Bananas', 'Chiquita', 'Fruit');
```

---

### **7. `GenerateRestockList`**
**Description**: Creates a restock list for items below the threshold, grouped by house.
**Usage**:
```sql
SELECT * FROM GenerateRestockList();
```
**Example Output**:
| House         | Item          | Quantity Needed |
|---------------|---------------|-----------------|
| Main House    | Apples        | 5.00            |

---

## **Setup Instructions**
1. Install PostgreSQL (or your preferred database management system).
2. Execute `create_table.sql` to create the database structure.
3. Populate the database with sample data using `sample_data.sql`.
4. Use the functions in `functions.sql` to interact with the database.

---
