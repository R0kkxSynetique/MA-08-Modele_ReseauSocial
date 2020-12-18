USE master;

IF (EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'RS'))
BEGIN
       USE master;
       ALTER DATABASE RS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
       DROP DATABASE RS;
END

CREATE DATABASE RS;

USE RS;

CREATE TABLE users (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(64) NOT NULL,
    accountName VARCHAR(45) NOT NULL,
    username VARCHAR(45),
    email VARCHAR(128),
    phoneNumber VARCHAR(13),
    birthDate DATE,
    PRIMARY KEY(id)
)

CREATE TABLE stories (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(64) NOT NULL,
    "timeout" DATETIME,
    "path" VARCHAR(64),
    PRIMARY KEY(id)
)

CREATE TABLE discussions (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(64) NOT NULL,
    creationDate DATE DEFAULT GETDATE(),
    PRIMARY KEY(id)
)

CREATE TABLE messages (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(64) NOT NULL,
    creationDate DATE DEFAULT GETDATE(),
    modificationDate DATE DEFAULT GETDATE(),
    PRIMARY KEY(id)
)

CREATE TABLE users_maintain_discussions (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE states (
    id INT NOT NULL IDENTITY(1,1),
    "name" VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
)

CREATE TABLE orders (
    id INT NOT NULL IDENTITY(1,1),
    "number" VARCHAR(64) NOT NULL,
    "date" DATE,
    clientNumber VARCHAR(64),
    totalPrice DECIMAL(5,2),
    PRIMARY KEY(id)
)

CREATE TABLE stores (
    id INT NOT NULL IDENTITY(1,1),
    "name" VARCHAR(45) NOT NULL,
    "description" VARCHAR(128),
    webSite VARCHAR(128),
    email VARCHAR(128),
    phoneNumber VARCHAR(13),
    PRIMARY KEY(id)
)

CREATE TABLE users_follow_stores (
    id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(id)
)

CREATE TABLE products (
    id INT NOT NULL IDENTITY(1,1),
    productNumer VARCHAR(64),
    model VARCHAR(64),
    brand VARCHAR(64),
    price DECIMAL(5,2),
    "description" VARCHAR(128),
    pictureLink VARCHAR(64),
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
    token VARCHAR(128) NOT NULL,
    PRIMARY KEY(id)
)

-- todo:FINISH HERE

CREATE TABLE pages (
    id INT NOT NULL IDENTITY(1,1),
    "name" VARCHAR(45),
    "description" VARCHAR(80),
    webSite VARCHAR(45),
    email VARCHAR(45),
    phoneNumber VARCHAR(13),
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
