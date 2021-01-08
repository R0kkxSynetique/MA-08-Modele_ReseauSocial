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
AS
    SELECT
        COUNT(comments.id) AS comments,
        COUNT(discussions.id) AS discussions,
        COUNT(messages.id) AS messages,
        COUNT(orders.id) AS orders,
        COUNT(orders_contain_products.id) AS orders_contain_products,
        COUNT(pages.id) AS pages,
        COUNT(posts.id) AS posts,
        COUNT(posts_possess_types.id) AS posts_possess_types,
        COUNT(products.id) AS products,
        COUNT(sessions.id) AS sessions,
        COUNT(states.id) AS states,
        COUNT(stores.id) AS stores,
        COUNT(stores_possess_products.id) AS stores_possess_products,
        COUNT(stories.id) AS stories,
        COUNT(types.id) AS types,
        COUNT(users.id) AS users,
        COUNT(users_follow_pages.id) AS users_follow_pages,
        COUNT(users_follow_stores.id) AS users_follow_stores,
        COUNT(users_follow_users.id) AS users_follow_users,
        COUNT(users_like_posts.id) AS users_like_posts,
        COUNT(users_maintain_discussions.id) AS users_maintain_discussions,
        COUNT(users_manage_pages.id) AS users_manage_pages,
        COUNT(users_possess_types.id) AS users_possess_types
    FROM comments
CROSS JOIN discussions
CROSS JOIN messages
CROSS JOIN orders
CROSS JOIN orders_contain_products
CROSS JOIN pages
CROSS JOIN posts
CROSS JOIN posts_possess_types
CROSS JOIN products
CROSS JOIN sessions
CROSS JOIN states
CROSS JOIN stores
CROSS JOIN stores_possess_products
CROSS JOIN stories
CROSS JOIN types
CROSS JOIN users
CROSS JOIN users_follow_pages
CROSS JOIN users_follow_stores
CROSS JOIN users_follow_users
CROSS JOIN users_like_posts
CROSS JOIN users_maintain_discussions
CROSS JOIN users_manage_pages
CROSS JOIN users_possess_types
;

GO

SELECT *
FROM registry;