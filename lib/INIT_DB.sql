DROP DATABASE ecommerce;

CREATE TABLE PRODUCTS (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    variant_name varchar(255),
    description varchar(255),
    image varchar(255),
    price FLOAT(6, 2),
    PRIMARY KEY (ID)
);
CREATE TABLE CATEGORIES (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE PRODUCT_CATEGORIES (
    product_id int NOT NULL,
    category_id int NOT NULL,
    PRIMARY KEY (product_id, category_id)
);

