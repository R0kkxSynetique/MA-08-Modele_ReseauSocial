USE RS;

GO

IF (EXISTS (SELECT name
FROM sys.views
WHERE name = 'registry'))
BEGIN
    DROP VIEW registry;
END

GO

CREATE VIEW registry AS SELECT * FROM (SELECT COUNT(*) AS "comments" FROM comments) as comments,
    (SELECT COUNT(*) AS "discussions" FROM discussions) as discussions,
    (SELECT COUNT(*) AS "messages" FROM messages) as messages,
    (SELECT COUNT(*) AS "orders" FROM orders) as orders,
    (SELECT COUNT(*) AS "orders_contain_products" FROM orders_contain_products) as orders_contain_products,
    (SELECT COUNT(*) AS "pages" FROM pages) as pages,
    (SELECT COUNT(*) AS "posts" FROM posts) as posts,
    (SELECT COUNT(*) AS "posts_possess_types" FROM posts_possess_types) as posts_possess_types,
    (SELECT COUNT(*) AS "products" FROM products) as products,
    (SELECT COUNT(*) AS "sessions" FROM sessions) as sessions,
    (SELECT COUNT(*) AS "states" FROM states) as states,
    (SELECT COUNT(*) AS "stores" FROM stores) as stores,
    (SELECT COUNT(*) AS "stores_possess_products" FROM stores_possess_products) as stores_possess_products,
    (SELECT COUNT(*) AS "stories" FROM stories) as stories,
    (SELECT COUNT(*) AS "types" FROM types) as types,
    (SELECT COUNT(*) AS "users" FROM users) as users,
    (SELECT COUNT(*) AS "users_follow_pages" FROM users_follow_pages) as users_follow_pages,
    (SELECT COUNT(*) AS "users_follow_stores" FROM users_follow_stores) as users_follow_stores,
    (SELECT COUNT(*) AS "users_follow_users" FROM users_follow_users) as users_follow_users,
    (SELECT COUNT(*) AS "users_like_posts" FROM users_like_posts) as users_like_posts,
    (SELECT COUNT(*) AS "users_maintain_discussions" FROM users_maintain_discussions) as users_maintain_discussions,
    (SELECT COUNT(*) AS "users_manage_pages" FROM users_manage_pages) as users_manage_pages,
    (SELECT COUNT(*) AS "users_possess_types" FROM users_possess_types) as users_possess_types
;

GO

SELECT *
FROM registry;

USE master;