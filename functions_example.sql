
SELECT * FROM GetInventoryDetails();
SELECT * FROM GetInventoryDetails('John Doe');
SELECT * FROM GetInventoryDetails('John Do');

SELECT GetShoppingListTotal() total_all_lists;
SELECT GetShoppingListTotal(1) total_1list;
SELECT GetShoppingListTotal(2) total_2list;

SELECT * FROM NotifyLowStock() low_stock_all;
SELECT * FROM NotifyLowStock('John Doe') low_stock_john;

SELECT * FROM NotifyNearExpiration() near_expiration_all;
SELECT * FROM NotifyNearExpiration(14) near_expiration_14days;
SELECT * FROM NotifyNearExpiration(14, 'John Doe') near_expiration_14days_john;

SELECT * FROM LocateItem('Apples')  locate_apples;
SELECT * FROM LocateItem('Apples', 'John Doe')  locate_apples_john;

SELECT * FROM GetItemsByCategory('Seafood') seafood;
SELECT * FROM GetItemsByCategory('Seafood', 'John Doe') seafood_john;

SELECT GetTotalSpend() total_spend_all;
SELECT GetTotalSpend('John Doe') total_spend_john;
SELECT GetTotalSpend('Jane Smith') total_spend_jane;

SELECT * FROM GetTotalSpendByMonth();
SELECT * FROM GetTotalSpendByMonth('John Doe');

SELECT * FROM GetTotalSpendByYear();
SELECT * FROM GetTotalSpendByYear('John Doe');

SELECT * FROM GetMostPurchasedItems();  -- Top 5 items overall
SELECT * FROM GetMostPurchasedItems('John Doe', 10);

SELECT * FROM LocateItemInVendor('Makro', 'Apples') locate_apples_makro;

SELECT * FROM GetItemPurchaseHistory('Toothpaste') purchase_history_toothpaste;

SELECT * FROM GetVendorTotalSpend();
SELECT * FROM GetVendorTotalSpend('Makro');

SELECT * FROM TrackItemAcrossVendors('Toothpaste');

