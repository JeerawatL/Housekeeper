CREATE TABLE Users (
    user_id      INT PRIMARY KEY,
    user_name    VARCHAR(100),
    role         VARCHAR(50),
    email        VARCHAR(100),
    phone_number VARCHAR(15)
);

CREATE TABLE Vendor (
    vendor_id    INT PRIMARY KEY,
    vendor_name  VARCHAR(100),
    contact_info VARCHAR(255),
    location     VARCHAR(255)
);

CREATE TABLE Item (
    item_id   INT PRIMARY KEY,
    item_name VARCHAR(100),
    brand     VARCHAR(100),
    category  VARCHAR(100)
);

CREATE TABLE House (
    house_id   INT PRIMARY KEY,
    user_id    INT,
    house_name VARCHAR(100),
    address    VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

CREATE TABLE Inventory (
    house_id          INT,
    user_id           INT,
    item_id           INT,
    quantity          DECIMAL(10, 2),
    unit              VARCHAR(50),
    expiration_date   DATE,
    restock_threshold DECIMAL(10, 2),
    PRIMARY KEY (house_id, item_id, user_id),
    FOREIGN KEY (house_id) REFERENCES House (house_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id),
    FOREIGN KEY (item_id) REFERENCES Item (item_id)
);


CREATE TABLE Purchase (
    purchase_id   INT PRIMARY KEY,
    user_id       INT,
    vendor_id     INT,
    purchase_time DATE,
    note          VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users (user_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendor (vendor_id)
);

CREATE TABLE PurchaseDetail (
    purchase_id INT,
    item_id     INT,
    unit        VARCHAR(50),
    quantity    DECIMAL(10, 2),
    price       DECIMAL(10, 2),
    PRIMARY KEY (purchase_id, item_id),
    FOREIGN KEY (purchase_id) REFERENCES Purchase (purchase_id),
    FOREIGN KEY (item_id) REFERENCES Item (item_id)
);

CREATE TABLE Aisle (
    vendor_id    INT,
    item_id      INT,
    aisle_name   VARCHAR(100),
    aisle_number INT,
    PRIMARY KEY (vendor_id, item_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendor (vendor_id),
    FOREIGN KEY (item_id) REFERENCES Item (item_id)
);

CREATE TABLE ShoppingList (
    shopping_list_id INT PRIMARY KEY,
    vendor_id        INT,
    FOREIGN KEY (vendor_id) REFERENCES Vendor (vendor_id)
);

CREATE TABLE ShoppingListDetail (
    shopping_list_id INT,
    item_id          INT,
    user_id          INT,
    price_per_unit   DECIMAL(10, 2),
    quantity         DECIMAL(10, 2),
    note             VARCHAR(255),
    PRIMARY KEY (shopping_list_id, item_id, user_id),
    FOREIGN KEY (shopping_list_id) REFERENCES ShoppingList (shopping_list_id),
    FOREIGN KEY (item_id) REFERENCES Item (item_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

CREATE TABLE ItemHashtag (
    item_id INT,
    hashtag VARCHAR(50),
    PRIMARY KEY (item_id, hashtag),
    FOREIGN KEY (item_id) REFERENCES Item (item_id)
);

CREATE TABLE ItemBarcode (
    item_id INT,
    barcode VARCHAR(50),
    PRIMARY KEY (item_id, barcode),
    FOREIGN KEY (item_id) REFERENCES Item (item_id)
);
