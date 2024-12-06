
-- Get all inventory details (Filtered by user)
CREATE OR REPLACE FUNCTION GetInventoryDetails(input_user_name VARCHAR DEFAULT NULL)
    RETURNS TABLE (
          house VARCHAR,
          item VARCHAR,
          quantity DECIMAL(10, 2),
          unit VARCHAR,
          owner VARCHAR,
          expiration DATE
    ) AS $$
BEGIN
    -- Check if input_user_name is NULL or matches an existing user
    IF input_user_name IS NOT NULL AND NOT EXISTS (
        SELECT 1 FROM Users WHERE user_name = input_user_name
    ) THEN
        RAISE EXCEPTION 'Invalid user name: %', input_user_name;
    END IF;

    -- Return query based on valid input
    RETURN QUERY
        SELECT
            h.house_name AS house,
            i.item_name AS item,
            inv.quantity,
            inv.unit,
            u.user_name AS owner,
            inv.expiration_date AS expiration
        FROM Inventory AS inv
                 LEFT JOIN House h ON inv.house_id = h.house_id
                 LEFT JOIN Item i ON inv.item_id = i.item_id
                 LEFT JOIN Users u ON inv.user_id = u.user_id
        WHERE input_user_name IS NULL OR u.user_name = input_user_name;

    -- Handle case when no records are found
    IF NOT FOUND THEN
        RAISE NOTICE 'No inventory details found for user: %', input_user_name;
    END IF;

END;
$$ LANGUAGE plpgsql;

-- Total price of a shopping specific list (Filtered by list)
CREATE OR REPLACE FUNCTION GetShoppingListTotal(input_shopping_list_id INT DEFAULT NULL)
    RETURNS DECIMAL(10, 2) AS
$$
DECLARE total DECIMAL(10, 2);
BEGIN
    SELECT SUM(price_per_unit * quantity)
        INTO total
    FROM ShoppingListDetail
        WHERE input_shopping_list_id IS NULL OR shopping_list_id = input_shopping_list_id;
    RETURN COALESCE(total, 0); -- Return 0 if no matching rows are found
END;
$$ LANGUAGE plpgsql;

-- Notify user when stock is low (Filtered by user)
CREATE OR REPLACE FUNCTION NotifyLowStock(input_user_name VARCHAR DEFAULT NULL)
    RETURNS TABLE (
        house VARCHAR,
        item VARCHAR,
        quantity DECIMAL(10, 2),
        threshold DECIMAL(10, 2),
        owner VARCHAR
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            h.house_name,
            i.item_name,
            inv.quantity,
            u.user_name
        FROM Inventory inv
            LEFT JOIN House h ON inv.house_id = h.house_id
            LEFT JOIN Item i ON inv.item_id = i.item_id
            LEFT JOIN Users u ON inv.user_id = u.user_id
        WHERE inv.quantity < inv.restock_threshold
            AND (input_user_name IS NULL OR u.user_name = input_user_name);
END;
$$ LANGUAGE plpgsql;

-- Notify user when item is near expiration (Filtered by days and user)
CREATE OR REPLACE FUNCTION NotifyNearExpiration(
    days INT DEFAULT 7,  input_user_name VARCHAR DEFAULT NULL)
    RETURNS TABLE (
        house VARCHAR,
        item VARCHAR,
        expiration DATE,
        owner VARCHAR
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            h.house_name,
            i.item_name,
            inv.expiration_date,
            u.user_name
        FROM Inventory inv
            LEFT JOIN House h ON inv.house_id = h.house_id
            LEFT JOIN Item i ON inv.item_id = i.item_id
            LEFT JOIN Users u ON inv.user_id = u.user_id
        WHERE inv.expiration_date BETWEEN CURRENT_DATE AND CURRENT_DATE + days
            AND (input_user_name IS NULL OR u.user_name = input_user_name);
END;
$$ LANGUAGE plpgsql;

-- Find the location of an item (Filtered by user)
CREATE OR REPLACE FUNCTION LocateItem( item_name_param VARCHAR, input_user_name VARCHAR DEFAULT NULL )
    RETURNS TABLE (
        house VARCHAR,
        quantity DECIMAL(10, 2),
        unit VARCHAR,
        owner VARCHAR
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            h.house_name AS house,
            inv.quantity,
            inv.unit,
            u.user_name AS owner
        FROM Inventory inv
            LEFT JOIN House h ON inv.house_id = h.house_id
            LEFT JOIN Item i ON inv.item_id = i.item_id
            LEFT JOIN Users u ON inv.user_id = u.user_id
        WHERE i.item_name = item_name_param
            AND inv.quantity > 0
            AND (input_user_name IS NULL OR u.user_name = input_user_name); -- Filters by user name if provided
END;
$$ LANGUAGE plpgsql;

-- Check item by category (Filtered by user)
CREATE OR REPLACE FUNCTION GetItemsByCategory(category_name VARCHAR, input_user_name VARCHAR DEFAULT NULL)
    RETURNS TABLE (
        house VARCHAR,
        item VARCHAR,
        brand VARCHAR,
        quantity DECIMAL(10, 2),
        owner VARCHAR
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            h.house_name,
            i.item_name,
            i.brand,
            inv.quantity,
            u.user_name AS owner
        FROM Inventory inv
            LEFT JOIN House h ON inv.house_id = h.house_id
            LEFT JOIN Item i ON inv.item_id = i.item_id
            LEFT JOIN Users u ON inv.user_id = u.user_id
        WHERE i.category = category_name
            AND (input_user_name IS NULL OR u.user_name = input_user_name);
END;
$$ LANGUAGE plpgsql;

-- Total spend (Filtered by user)
CREATE OR REPLACE FUNCTION GetTotalSpend(input_user_name VARCHAR DEFAULT NULL)
    RETURNS DECIMAL(10, 2) AS $$
DECLARE total_spend DECIMAL(10, 2);
BEGIN
    SELECT SUM(pd.quantity * pd.price)
    INTO total_spend
    FROM PurchaseDetail pd
        LEFT JOIN Purchase p ON pd.purchase_id = p.purchase_id
        LEFT JOIN Users u ON p.user_id = u.user_id
    WHERE input_user_name IS NULL OR u.user_name = input_user_name;
    RETURN COALESCE(total_spend, 0); -- Return 0 if no purchases are found
END;
$$ LANGUAGE plpgsql;

-- Total spend by month (Filtered by user)
CREATE OR REPLACE FUNCTION GetTotalSpendByMonth(input_user_name VARCHAR DEFAULT NULL)
    RETURNS TABLE (
        month_year VARCHAR,
        total DECIMAL(10, 2),
        buyer VARCHAR
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            TO_CHAR(p.purchase_time, 'YYYY-MM')::VARCHAR AS month_year,
            SUM(pd.quantity * pd.price) AS total_spend,
            u.user_name
        FROM PurchaseDetail pd
             LEFT JOIN Purchase p ON pd.purchase_id = p.purchase_id
             LEFT JOIN Users u ON p.user_id = u.user_id
        WHERE input_user_name IS NULL OR u.user_name = input_user_name
        GROUP BY TO_CHAR(p.purchase_time, 'YYYY-MM'), u.user_name
        ORDER BY TO_CHAR(p.purchase_time, 'YYYY-MM');
END;
$$ LANGUAGE plpgsql;

-- Total spend by year (Filtered by user)
CREATE OR REPLACE FUNCTION GetTotalSpendByYear(input_user_name VARCHAR DEFAULT NULL)
    RETURNS TABLE (
        year VARCHAR,
        total DECIMAL(10, 2),
        buyer VARCHAR
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            TO_CHAR(p.purchase_time, 'YYYY')::VARCHAR AS year,
            SUM(pd.quantity * pd.price) AS total_spend,
            u.user_name
        FROM PurchaseDetail pd
             LEFT JOIN Purchase p ON pd.purchase_id = p.purchase_id
             LEFT JOIN Users u ON p.user_id = u.user_id
        WHERE input_user_name IS NULL OR u.user_name = input_user_name
        GROUP BY TO_CHAR(p.purchase_time, 'YYYY'), u.user_name
        ORDER BY TO_CHAR(p.purchase_time, 'YYYY');
END;
$$ LANGUAGE plpgsql;

-- Total spend by year (Filtered by user)
CREATE OR REPLACE FUNCTION GetMostPurchasedItems(input_user_name VARCHAR DEFAULT NULL, top_n INT DEFAULT 5)
    RETURNS TABLE (
        item_name VARCHAR,
        total_quantity DECIMAL(10, 2),
        user_name VARCHAR
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT i.item_name, SUM(pd.quantity) AS total_quantity, u.user_name
        FROM PurchaseDetail pd
             LEFT JOIN Purchase p ON pd.purchase_id = p.purchase_id
             LEFT JOIN Item i ON pd.item_id = i.item_id
             LEFT JOIN Users u ON p.user_id = u.user_id
        WHERE input_user_name IS NULL OR u.user_name = input_user_name
        GROUP BY i.item_name, u.user_name
        ORDER BY total_quantity DESC
        LIMIT top_n;
END;
$$ LANGUAGE plpgsql;

-- Locate item in vendor's aisle
CREATE OR REPLACE FUNCTION LocateItemInVendor(vendor_name_input VARCHAR, item_name_input VARCHAR)
    RETURNS TABLE (
        aisle_name VARCHAR,
        aisle_number INT
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            a.aisle_name,
            a.aisle_number
        FROM Aisle a
            LEFT JOIN Item i ON a.item_id = i.item_id
            LEFT JOIN Vendor v ON a.vendor_id = v.vendor_id
        WHERE v.vendor_name = vendor_name_input
          AND i.item_name = item_name_input;
END;
$$ LANGUAGE plpgsql;

-- Get purchase history for an item
CREATE OR REPLACE FUNCTION GetItemPurchaseHistory(item_name_input VARCHAR)
    RETURNS TABLE (
                      user_name VARCHAR,
                      purchase_date DATE,
                      quantity DECIMAL(10, 2),
                      price DECIMAL(10, 2)
                  ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            u.user_name,
            p.purchase_time,
            pd.quantity,
            pd.price
        FROM PurchaseDetail pd
                 LEFT JOIN Purchase p ON pd.purchase_id = p.purchase_id
                 LEFT JOIN Users u ON p.user_id = u.user_id
                 LEFT JOIN Item i ON pd.item_id = i.item_id
        WHERE i.item_name = item_name_input; -- Qualify 'item_name' with the table alias 'i'
END;
$$ LANGUAGE plpgsql;

-- Total purchase by vendor (Filtered by vendor)
CREATE OR REPLACE FUNCTION GetVendorTotalSpend(vendor_name_input VARCHAR DEFAULT NULL)
    RETURNS TABLE (
        vendor_name VARCHAR,
        total_spent DECIMAL(10, 2)
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            v.vendor_name,
            SUM(pd.quantity * pd.price) AS total_spent
        FROM PurchaseDetail pd
            LEFT JOIN Purchase p ON pd.purchase_id = p.purchase_id
            LEFT JOIN Item i ON pd.item_id = i.item_id
            LEFT JOIN Vendor v ON p.vendor_id = v.vendor_id
        WHERE vendor_name_input IS NULL OR v.vendor_name = vendor_name_input
        GROUP BY v.vendor_name;
END;
$$ LANGUAGE plpgsql;

-- Item bought across all vendors
CREATE OR REPLACE FUNCTION TrackItemAcrossVendors(item_name_param VARCHAR)
    RETURNS TABLE (
        vendor_name VARCHAR,
        total_quantity DECIMAL(10, 2),
        purchase_date DATE
    ) AS $$
BEGIN
    RETURN QUERY
        SELECT v.vendor_name, SUM(pd.quantity) AS total_quantity, p.purchase_time AS purchase_date
        FROM PurchaseDetail pd
            LEFT JOIN Purchase p ON pd.purchase_id = p.purchase_id
            LEFT JOIN Vendor v ON p.vendor_id = v.vendor_id
            LEFT JOIN Item i ON pd.item_id = i.item_id
        WHERE i.item_name = item_name_param
        GROUP BY v.vendor_name, p.purchase_time;
END;
$$ LANGUAGE plpgsql;