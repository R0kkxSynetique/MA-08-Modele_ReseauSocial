-- -------------------------- --
-- Project : Reseau Social    --
-- Author  : Augsburger Kenan --
-- Version : 1.0              --
-- Date    : 08/01/2021       --
-- -------------------------- --

USE master;

IF (EXISTS (SELECT name
FROM master.dbo.sysdatabases
WHERE name = 'RS'))
BEGIN
    USE master;
    ALTER DATABASE RS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RS;
END

CREATE DATABASE RS;

-- TABLES --

GO

IF (EXISTS (SELECT name
FROM master.dbo.sysdatabases
WHERE name = 'RS'))
BEGIN
    USE RS;

    CREATE TABLE users
    (
        id INT NOT NULL IDENTITY(1,1),
        "number" VARCHAR(64) NOT NULL,
        accountName VARCHAR(45) NOT NULL,
        username VARCHAR(45),
        email VARCHAR(128),
        phoneNumber VARCHAR(13),
        birthDate DATE NOT NULL,
        PRIMARY KEY(id)
    )

    CREATE TABLE stories
    (
        id INT NOT NULL IDENTITY(1,1),
        "number" VARCHAR(64) NOT NULL,
        "timeout" DATETIME,
        "path" VARCHAR(64),
        PRIMARY KEY(id)
    )

    CREATE TABLE discussions
    (
        id INT NOT NULL IDENTITY(1,1),
        "number" VARCHAR(64) NOT NULL,
        creationDate DATE DEFAULT GETDATE(),
        PRIMARY KEY(id)
    )

    CREATE TABLE messages
    (
        id INT NOT NULL IDENTITY(1,1),
        "number" VARCHAR(64) NOT NULL,
        creationDate DATE DEFAULT GETDATE(),
        modificationDate DATE DEFAULT GETDATE(),
        PRIMARY KEY(id)
    )

    CREATE TABLE users_maintain_discussions
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE states
    (
        id INT NOT NULL IDENTITY(1,1),
        "name" VARCHAR(45) NOT NULL,
        PRIMARY KEY(id)
    )

    CREATE TABLE orders
    (
        id INT NOT NULL IDENTITY(1,1),
        "number" VARCHAR(64) NOT NULL,
        "date" DATE DEFAULT GETDATE(),
        clientNumber VARCHAR(64),
        totalPrice DECIMAL(5,2),
        PRIMARY KEY(id)
    )

    CREATE TABLE stores
    (
        id INT NOT NULL IDENTITY(1,1),
        "name" VARCHAR(45) NOT NULL,
        "description" VARCHAR(128),
        webSite VARCHAR(128),
        email VARCHAR(128),
        phoneNumber VARCHAR(13),
        PRIMARY KEY(id)
    )

    CREATE TABLE users_follow_stores
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE products
    (
        id INT NOT NULL IDENTITY(1,1),
        productNumber VARCHAR(64),
        model VARCHAR(64),
        brand VARCHAR(128),
        price DECIMAL(5,2),
        "description" VARCHAR(128),
        pictureLink VARCHAR(64),
        PRIMARY KEY(id)
    )

    CREATE TABLE stores_possess_products
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE orders_contain_products
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE users_follow_users
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE "sessions"
    (
        id INT NOT NULL IDENTITY(1,1),
        token VARCHAR(128) NOT NULL,
        PRIMARY KEY(id)
    )

    CREATE TABLE pages
    (
        id INT NOT NULL IDENTITY(1,1),
        "name" VARCHAR(45) NOT NULL,
        "description" VARCHAR(128),
        webSite VARCHAR(128),
        email VARCHAR(128),
        phoneNumber VARCHAR(13),
        PRIMARY KEY(id)
    )

    CREATE TABLE users_follow_pages
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE users_manage_pages
    (
        id INT NOT NULL IDENTITY(1,1),
        "type" VARCHAR(45),
        PRIMARY KEY(id)
    )

    CREATE TABLE types
    (
        id INT NOT NULL IDENTITY(1,1),
        "name" VARCHAR(45) NOT NULL,
        PRIMARY KEY(id)
    )

    CREATE TABLE users_possess_types
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE posts
    (
        id INT NOT NULL IDENTITY(1,1),
        "number" VARCHAR(64) NOT NULL,
        pictureLink VARCHAR(64),
        title VARCHAR(64),
        "description" VARCHAR(128),
        PRIMARY KEY(id)
    )

    CREATE TABLE users_like_posts
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE posts_possess_types
    (
        id INT NOT NULL IDENTITY(1,1),
        PRIMARY KEY(id)
    )

    CREATE TABLE comments
    (
        id INT NOT NULL IDENTITY(1,1),
        "number" VARCHAR(64) NOT NULL,
        "text" VARCHAR(254),
        PRIMARY KEY(id)
    )

    -- CONSTRAINTS --
    -- TODO:Check on update/delete actions
    -- ! USED NO ACTION TO AVOID MULTIPLE CASCADING PATHS ERROR
    -- ! FIX NEEDED

    -- Foreign keys

    ALTER TABLE stories
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE messages
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        discussion_id INT NOT NULL,
        FOREIGN KEY(discussion_id) REFERENCES discussions(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE users_maintain_discussions
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        discussion_id INT NOT NULL,
        FOREIGN KEY(discussion_id) REFERENCES discussions(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE orders
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        state_id INT NOT NULL,
        FOREIGN KEY(state_id) REFERENCES states(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE stores
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE users_follow_stores
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        store_id INT NOT NULL,
        FOREIGN KEY(store_id) REFERENCES stores(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE stores_possess_products
        ADD store_id INT NOT NULL,
        FOREIGN KEY(store_id) REFERENCES stores(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        product_id INT NOT NULL,
        FOREIGN KEY(product_id) REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE orders_contain_products
        ADD product_id INT NOT NULL,
        FOREIGN KEY(product_id) REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        order_id INT NOT NULL,
        FOREIGN KEY(order_id) REFERENCES orders(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE users_follow_users
        ADD user_id0 INT NOT NULL,
        FOREIGN KEY(user_id0) REFERENCES users(id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        user_id1 INT NOT NULL,
        FOREIGN KEY(user_id1) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE "sessions"
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE pages
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE users_follow_pages
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        page_id INT NOT NULL,
        FOREIGN KEY(page_id) REFERENCES pages(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE users_manage_pages
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        page_id INT NOT NULL,
        FOREIGN KEY(page_id) REFERENCES pages(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE users_possess_types
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        type_id INT NOT NULL,
        FOREIGN KEY(type_id) REFERENCES types(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE posts
        ADD user_id INT,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        page_id INT,
        FOREIGN KEY(page_id) REFERENCES pages(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE users_like_posts
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        post_id INT NOT NULL,
        FOREIGN KEY(post_id) REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE posts_possess_types
        ADD post_id INT NOT NULL,
        FOREIGN KEY(post_id) REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        type_id INT NOT NULL,
        FOREIGN KEY(type_id) REFERENCES types(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    ALTER TABLE comments
        ADD user_id INT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        post_id INT NOT NULL,
        FOREIGN KEY(post_id) REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        ;

    -- Unique

    ALTER TABLE comments
        ADD CONSTRAINT uniqueComment UNIQUE (number)
    ;

    ALTER TABLE discussions
        ADD CONSTRAINT uniqueDiscussion UNIQUE (number)
    ;

    ALTER TABLE messages
        ADD CONSTRAINT uniqueMessage UNIQUE (number)
    ;

    ALTER TABLE orders
        ADD CONSTRAINT uniqueOrder UNIQUE (number)
    ;

    ALTER TABLE pages
        ADD CONSTRAINT uniquePage UNIQUE (name)
    ;

    ALTER TABLE posts
        ADD CONSTRAINT uniquePost UNIQUE (number)
    ;

    ALTER TABLE products
        ADD CONSTRAINT uniqueProduct UNIQUE (productNumber)
    ;

    ALTER TABLE sessions
        ADD CONSTRAINT uniqueSession UNIQUE (token)
    ;

    ALTER TABLE states
        ADD CONSTRAINT uniqueState UNIQUE (name)
    ;

    ALTER TABLE stores
        ADD CONSTRAINT uniqueStore UNIQUE (name)
    ;

    ALTER TABLE stories
        ADD CONSTRAINT uniqueStorie UNIQUE (number)
    ;

    ALTER TABLE types
        ADD CONSTRAINT uniqueType UNIQUE (name)
    ;

    ALTER TABLE users
        ADD CONSTRAINT uniqueNumber UNIQUE (number),
        CONSTRAINT uniqueAccountName UNIQUE (accountName)
    ;

    -- Checks

    ALTER TABLE posts
        ADD CONSTRAINT CHK_OneOfEither CHECK (user_id IS NULL OR page_id IS NULL)
    ;

END