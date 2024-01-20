-- 実行方法
-- mysql -hlocalhost -uroot -proot isuconp < usr/src/scripts/ddl/add_partition_part_id.sql

-- INDEXが使用されているか確認する方法
-- EXPLAIN SELECT * FROM comments WHERE post_id = 9995 ORDER BY created_at DESC LIMIT 3;
-- EXPLAIN ANALYZE SELECT * FROM comments WHERE post_id = 9995 ORDER BY created_at DESC LIMIT 3;

ALTER TABLE comments ADD INDEX post_id_idx(post_id);