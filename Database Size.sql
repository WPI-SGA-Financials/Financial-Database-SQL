SELECT table_schema AS "Database",
ROUND(SUM(data_length + index_length) / 1024 / 1024, 3) AS "Size (MB)"
FROM information_schema.TABLES
GROUP BY table_schema;

SELECT table_name AS "Table",
ROUND(((data_length + index_length) / 1024 / 1024), 3) AS "Size (MB)"
FROM information_schema.TABLES
WHERE table_schema = 'sgadb'
ORDER BY (data_length + index_length) DESC;