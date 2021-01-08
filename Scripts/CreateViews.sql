USE RS;

GO

IF (EXISTS (SELECT name
FROM sys.views
WHERE name = 'registry'))
BEGIN
    DROP VIEW registry;
END

GO

CREATE VIEW registry
AS SELECT COUNT(id) AS comments FROM comments
    UNION
        SELECT COUNT(id) AS discussions
        FROM discussions
    UNION
        SELECT COUNT(id) AS messages
        FROM messages
    UNION
        SELECT COUNT(orders.id) AS orders
        FROM orders
    UNION
        SELECT COUNT(id) AS orders_contain_products
        FROM orders_contain_products
    UNION
        SELECT COUNT(id) AS pages
        FROM pages
    UNION
        SELECT COUNT(id) AS posts
        FROM posts
    UNION
        SELECT COUNT(id) AS posts_possess_types
        FROM posts_possess_types
    UNION
        SELECT COUNT(id) AS products
        FROM products
    UNION
        SELECT COUNT(id) AS sessions
        FROM sessions
    UNION
        SELECT COUNT(id) AS states FROM states
    UNION
        SELECT COUNT(id) AS stores
        FROM stores
    UNION
        SELECT COUNT(id) AS stores_possess_products
        FROM stores_possess_products
    UNION
        SELECT COUNT(id) AS stories
        FROM stories
    UNION
        SELECT COUNT(id) AS types
        FROM types
    UNION
        SELECT COUNT(id) AS users
        FROM users
    UNION
        SELECT COUNT(id) AS users_follow_pages
        FROM users_follow_pages
        UNION
    SELECT COUNT(id) AS users_follow_stores
    FROM users_follow_stores
UNION
SELECT COUNT(id) AS users_follow_users
FROM users_follow_users
UNION
SELECT COUNT(id) AS users_like_posts
FROM users_like_posts
UNION
SELECT COUNT(id) AS users_maintain_discussions FROM users_maintain_discussions
UNION
SELECT COUNT(id) AS users_manage_pages FROM users_manage_pages
UNION
SELECT COUNT(id) AS users_possess_types FROM users_possess_types
;

GO

SELECT *
FROM registry;