-- Insert data into Users table
INSERT INTO Users (user_id, user_name, role, email, phone_number) VALUES
    (1, 'John Doe', 'Admin', 'john.doe@example.com', '123-456-7890'),
    (2, 'Jane Smith', 'User', 'jane.smith@example.com', '234-567-8901'),
    (3, 'Michael Johnson', 'User', 'michael.johnson@example.com', '345-678-9012'),
    (4, 'Emily Davis', 'User', 'emily.davis@example.com', '456-789-0123');

-- Insert data into Vendor table
INSERT INTO Vendor (vendor_id, vendor_name, contact_info, location) VALUES
    (1, 'Makro', 'contact@makro.com', '87/18 Moo 3 Sala Ya Phutthamonthon Nakhon Pathom 73170'),
    (2, 'Tops Salaya', 'info@central.com', '99/19, 99/20 Moo 2 Borommaratchachonnani Rd. Sam Phran Nakhon Pathom 73170'),
    (3, 'HomePro', 'support@homepro.com', 'Sam Phran Nakhon Pathom 73210');

-- Insert data into Item table
INSERT INTO Item (item_id, item_name, brand, category) VALUES
    (1, 'Apples', 'Makro', 'Fruit'),
    (2, 'Hot dog', 'TGM', 'Meat'),
    (3, 'Multipurpose lubricant spray', 'WD40', 'Chemical'),
    (4, 'Milk', 'Meji', 'Dairy'),
    (5, 'Bread', 'Farmhouse', 'Bakery'),
    (6, 'Toilet paper', 'Scott', 'Household'),
    (7, 'Cereal', 'Kokokrunch', 'Breakfast'),
    (8, 'Pasta', 'Agnesi', 'Pantry'),
    (9, 'Soap', 'Lux', 'Personal care'),
    (10, 'Toothpaste', 'Colgate', 'Personal care'),
    (11, 'Shampoo', 'Head and shoulders', 'Personal care'),
    (12, 'Conditioner', 'Head and shoulders', 'Personal care'),
    (13, 'Rice', 'Aro', 'Pantry'),
    (14, 'Chicken', 'CP', 'Meat'),
    (15, 'Beef', 'CP', 'Meat'),
    (16, 'Pork', 'CP', 'Meat'),
    (17, 'Fish', 'Aro', 'Seafood'),
    (18, 'Shrimp', 'Aro', 'Seafood'),
    (19, 'Salmon', 'Aro', 'Seafood'),
    (20, 'Tuna', 'Sealect', 'Seafood'),
    (21, 'Soy sauce', 'Deksomboon', 'Condiment'),
    (22, 'Ketchup', 'Heinz', 'Condiment'),
    (23, 'Mustard', 'Heinz', 'Condiment'),
    (24, 'Mayonnaise', 'QP', 'Condiment'),
    (25, 'Salsa', 'Heinz', 'Condiment'),
    (26, 'Peanut butter', 'Aro', 'Condiment'),
    (27, 'Jelly', 'Haribo', 'Condiment'),
    (28, 'Honey', 'Doikham', 'Condiment'),
    (29, 'Maple syrup', 'Doikham', 'Condiment'),
    (30, 'BBQ sauce', 'Heinz', 'Condiment'),
    (31, 'Soy milk', 'Meji', 'Dairy'),
    (32, 'Almond milk', 'Meji', 'Dairy'),
    (33, 'Coconut milk', 'Meji', 'Dairy'),
    (34, 'Oat milk', 'Meji', 'Dairy'),
    (37, 'Yogurt', 'Meji', 'Dairy'),
    (38, 'Cheese', 'Allowrie', 'Dairy'),
    (39, 'Butter', 'Allowrie', 'Dairy'),
    (40, 'Eggs', 'CP', 'Dairy'),
    (41, 'Ice cream', 'Swensen', 'Dairy'),
    (42, 'Frozen vegetables', 'Aro', 'Frozen'),
    (43, 'Frozen fruits', 'Aro', 'Frozen'),
    (44, 'Frozen meals', 'CP', 'Frozen'),
    (45, 'Frozen pizza', 'Aro', 'Frozen'),
    (46, 'Frozen seafood', 'Aro', 'Frozen'),
    (47, 'Frozen meat', 'Aro', 'Frozen'),
    (48, 'Frozen dessert', 'Aro', 'Frozen'),
    (49, 'Frozen appetizers', 'CP', 'Frozen'),
    (50, 'Fertilizer', 'Bison', 'Garden'),
    (51, 'Pesticide', 'Bison', 'Garden'),
    (52, 'Cherry tomato seeds', 'Chiatai', 'Garden'),
    (53, 'Plant food', 'Bison', 'Garden');


-- Insert data into House table
INSERT INTO House (house_id, user_id, house_name, address) VALUES
    (1, 1, 'House', '222 Thawi Watthana Rd. Thawi Watthana Bangkok 10170'),
    (2, 2, 'Apartment', '123 Borommaratchachonnani Rd. Sam Phran Nakhon Pathom 73170');

-- Insert data into Inventory table
INSERT INTO Inventory (house_id, user_id, item_id, quantity, unit, expiration_date, restock_threshold) VALUES
    (1, 1, 1, 10, 'kg', '2024-12-31', 2),
    (1, 1, 5, 2, 'loaves', '2024-10-15', 1),
    (1, 1, 6, 15, 'rolls', '2024-11-01', 3),                                                                                   (1, 1, 7, 3, 'boxes', '2024-12-10', 1),
    (1, 1, 8, 5, 'kg', '2024-12-20', 1),
    (1, 1, 9, 10, 'bars', '2024-12-30', 2),
    (1, 1, 10, 4, 'pieces', '2024-11-15', 1),
    (1, 1, 11, 3, 'bottles', '2024-12-01', 1),
    (1, 1, 12, 3, 'bottles', '2024-12-01', 1),
    (1, 1, 13, 20, 'kg', '2025-01-01', 5),
    (1, 1, 14, 6, 'kg', '2024-11-20', 2),
    (1, 1, 15, 4, 'kg', '2024-11-25', 1),
    (1, 1, 16, 5, 'kg', '2024-11-25', 2),
    (1, 1, 17, 3, 'kg', '2024-12-05', 1),
    (1, 1, 18, 2, 'kg', '2024-12-05', 1),
    (1, 1, 19, 2, 'kg', '2024-12-10', 1),
    (1, 1, 20, 5, 'cans', '2024-12-15', 2),
    (1, 1, 21, 3, 'bottles', '2025-01-01', 1),
    (1, 1, 22, 2, 'bottles', '2025-01-01', 1),
    (2, 2, 4, 5, 'liters', '2024-11-15', 1),
    (2, 2, 10, 3, 'pieces', '2024-10-20', 2),
    (2, 2, 31, 4, 'liters', '2024-11-01', 1),
    (2, 2, 32, 3, 'liters', '2024-11-01', 1),
    (2, 2, 33, 2, 'liters', '2024-12-01', 1),
    (2, 2, 34, 3, 'liters', '2024-12-01', 1),
    (2, 2, 37, 10, 'cups', '2024-11-10', 2),
    (2, 2, 38, 5, 'blocks', '2024-12-10', 1),
    (2, 2, 39, 2, 'kg', '2024-12-05', 1),
    (2, 2, 40, 30, 'pieces', '2024-11-15', 5),
    (2, 2, 41, 6, 'tubs', '2024-11-20', 1),
    (2, 2, 42, 8, 'bags', '2024-12-15', 2),
    (2, 2, 43, 4, 'bags', '2024-12-15', 1),
    (2, 2, 44, 5, 'packs', '2024-11-25', 2),
    (2, 2, 45, 3, 'pieces', '2024-12-01', 1),
    (2, 2, 46, 4, 'kg', '2024-12-05', 1),
    (2, 2, 47, 3, 'kg', '2024-12-10', 1);

-- Insert data into Purchase table
INSERT INTO Purchase (purchase_id, user_id, vendor_id, purchase_time, note) VALUES
    (1, 1, 1, '2024-10-01', 'Weekly groceries'),
    (2, 2, 2, '2024-10-05', 'Essentials from Tops Salaya'),
    (3, 1, 3, '2024-10-10', NULL);

-- Insert data into PurchaseDetail table
INSERT INTO PurchaseDetail (purchase_id, item_id, unit, quantity, price) VALUES
    (3, 3, 'piece', 1, 350.00),
    (3, 50, 'bag', 2, 700.00),
    (3, 51, 'bottle', 3, 500.00),
    (3, 52, 'packet', 1, 150.00),
    (3, 53, 'bottle', 4, 900.00),
    (1, 1, 'kg', 10, 120.0),
    (1, 5, 'loaf', 2, 65.0),
    (2, 10, 'piece', 3, 150.0),
    (1, 10, 'piece', 3, 150.0),
    (1, 7, 'box', 3, 140.0),
    (2, 11, 'bottle', 2, 220.0),
    (1, 13, 'kg', 10, 80.0),
    (2, 14, 'kg', 4, 190.0),
    (1, 16, 'kg', 3, 150.0),
    (2, 17, 'kg', 2, 270.0),
    (1, 19, 'kg', 3, 320.0),
    (2, 20, 'can', 4, 105.0),
    (1, 22, 'bottle', 1, 200.0),
    (2, 23, 'bottle', 3, 220.0),
    (1, 25, 'jar', 1, 260.0),
    (2, 26, 'jar', 2, 185.0),
    (1, 28, 'bottle', 1, 350.0);


-- Insert data into Aisle table
INSERT INTO Aisle (vendor_id, item_id, aisle_name, aisle_number) VALUES
    (1, 1, 'Fruits', 3),
    (1, 5, 'Bakery', 7),
    (2, 10, 'Personal Care', 2),
    (3, 3, 'Furniture', 5);

-- Insert data into ShoppingList table
INSERT INTO ShoppingList (shopping_list_id, vendor_id) VALUES
    (1, 1),
    (2, 2);

-- Insert data into ShoppingListDetail table
INSERT INTO ShoppingListDetail (shopping_list_id, item_id, user_id, price_per_unit, quantity, note) VALUES
    (1, 1, 1, 120.0, 5, 'Get fresh apples'),
    (1, 5, 1, 65.0, 2, 'Buy bread for breakfast'),
    (2, 11, 2, 220.0, 1, 'Buy shampoo'),
    (2, 12, 2, 220.0, 1, 'Buy conditioner'),
    (2, 7, 2, 140.0, 2, 'Get cereal for breakfast'),
    (1, 8, 1, 80.0, 4, 'Pasta for dinner'),
    (1, 21, 1, 105.0, 1, 'Soy sauce for cooking'),
    (1, 22, 1, 200.0, 1, 'Ketchup for sandwiches'),
    (2, 32, 2, 220.0, 2, 'Almond milk for smoothies'),
    (2, 34, 2, 220.0, 1, 'Oat milk for coffee'),
    (2, 39, 4, 150.0, 1, 'Butter for baking'),
    (1, 40, 1, 150.0, 12, 'Eggs for breakfast'),
    (1, 44, 1, 270.0, 3, 'Frozen meals for quick lunch'),
    (1, 47, 1, 320.0, 2, 'Frozen meat for dinner'),
    (2, 50, 4, 700.0, 1, 'Fertilizer for garden'),
    (2, 51, 4, 500.0, 1, 'Pesticide for garden'),
    (2, 52, 4, 150.0, 1, 'Cherry tomato seeds'),
    (2, 53, 4, 900.0, 1, 'Plant food for garden'),
    (2, 10, 2, 150, 1, 'Jane toothpaste'),
    (2, 10, 4, 150, 1, 'Emily toothpaste');

-- Insert data into ItemHashtag table
INSERT INTO ItemHashtag (item_id, hashtag) VALUES
    (1, '#fruit'),
    (5, '#bakery'),
    (3, '#chemical'),
    (10, '#personalcare');

-- Insert data into ItemBarcode table
INSERT INTO ItemBarcode (item_id, barcode) VALUES
    (1, '1234567890123'),
    (1, '1234567890987'),
    (5, '5678901234567'),
    (5, '5678909876543'),
    (3, '3456789012345'),
    (3, '3456789098765'),
    (10, '4567890123456'),
    (10, '4567890987654'),
    (7, '7890123456789'),
    (7, '7890123498765'),
    (13, '2345678901234'),
    (13, '2345678909876');