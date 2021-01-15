USE RS;

GO

-- users
SELECT * FROM users;

-- types
SELECT * FROM types;

-- stories
SELECT * FROM stories;

-- stores
SELECT * FROM stores;

-- states
SELECT * FROM states;

-- sessions
SELECT * FROM sessions;

-- products
SELECT * FROM products;

-- pages
SELECT * FROM pages;

-- posts
SELECT * FROM posts;

-- orders
SELECT * FROM orders;

-- discussions
SELECT * FROM discussions;

-- messages
SELECT * FROM messages;

-- comments
SELECT * FROM comments;

-- orders_contain_products
SELECT * FROM orders_contain_products;

-- posts_possess_types
SELECT * FROM posts_possess_types;

-- stores_possess_products
SELECT * FROM stores_possess_products;

-- users_follow_pages
SELECT * FROM users_follow_pages;

-- users_follow_stores
SELECT * FROM users_follow_stores;

-- users_follow_users
SELECT * FROM users_follow_users;

-- users_like_posts
SELECT * FROM users_like_posts;

-- users_maintain_discussions
SELECT * FROM users_maintain_discussions;

-- users_manage_pages
SELECT * FROM users_manage_pages;

-- users_possess_types
SELECT * FROM users_possess_types;

USE master;