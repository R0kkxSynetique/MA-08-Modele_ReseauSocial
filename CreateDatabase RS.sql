USE master;
DROP DATABASE IF EXISTS RS;
CREATE DATABASE RS;
USE RS;

CREATE TABLE users (
    id INT NOT NULL IDENTITY(1,1),
    accountName VARCHAR(45),
    pseudonym VARCHAR(45),
    email VARCHAR(45),
    phoneNumber VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE stories (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(45),
    "timeout" VARCHAR(45),
    "path" VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE discussions (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(45),
    creationDate VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE messages (
    id INT NOT NULL IDENTITY(1,1),
    "number" INT,
    creationDate VARCHAR(45),
    modificationDate VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE users_maintain_discussions (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE states (
    id INT NOT NULL IDENTITY(1,1),
    "name" VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE orders (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(45),
    "date" VARCHAR(45),
    clientNumber VARCHAR(45),
    totalPrice VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE stores (
    id INT NOT NULL IDENTITY(1,1),
    "name" VARCHAR(45),
    "description" VARCHAR(80),
    webSite VARCHAR(45),
    email VARCHAR(45),
    phoneNumber VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE users_follow_stores (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE products (
    id INT NOT NULL IDENTITY(1,1),
    productNumer VARCHAR(45),
    model VARCHAR(45),
    brand VARCHAR(45),
    price VARCHAR(45),
    "description" VARCHAR(80),
    pictureLink VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE stores_possess_products (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE orders_contain_products (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE users_follow_users (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE "sessions" (
    id INT NOT NULL IDENTITY(1,1),
    token VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE pages (
    id INT NOT NULL IDENTITY(1,1),
    "name" VARCHAR(45),
    "description" VARCHAR(80),
    webSite VARCHAR(45),
    email VARCHAR(45),
    phoneNumber VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE users_follow_pages (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE users_manage_pages (
    id INT NOT NULL IDENTITY(1,1),
    "type" VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE types (
    id INT NOT NULL IDENTITY(1,1),
    "name" VARCHAR(45),
    PRIMARY KEY(id)
)

CREATE TABLE users_possess_types (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE posts (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(45),
    pictureLink VARCHAR(45),
    title VARCHAR(45),
    "description" VARCHAR(80),
    PRIMARY KEY(id)
)

CREATE TABLE users_like_posts (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE posts_possess_types (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE comments (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(45),
    texte VARCHAR(45),
    PRIMARY KEY(id)
)