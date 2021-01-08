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
SELECT COUNT(com.id) as 'comments', COUNT(disc.id) as 'discussions'
FROM comments as com
CROSS JOIN discussions as disc;

GO

SELECT * FROM registry;