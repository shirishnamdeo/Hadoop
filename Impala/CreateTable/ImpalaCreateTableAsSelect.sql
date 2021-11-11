CREATE [EXTERNAL] TABLE [IF NOT EXISTS] db_name.]table_name
  [PARTITIONED BY (col_name[, ...])]
  [SORT BY ([column [, column ...]])]
  [COMMENT 'table_comment']
  [ROW FORMAT row_format]
  [WITH SERDEPROPERTIES ('key1'='value1', 'key2'='value2', ...)]
  [STORED AS ctas_file_format]
  [LOCATION 'hdfs_path']
    [CACHED IN 'pool_name' [WITH REPLICATION = integer] | UNCACHED]
  [TBLPROPERTIES ('key1'='value1', 'key2'='value2', ...)]
AS
  select_statement

---------------------------------------------------------------------------------------------------

CREATE EXTERNAL TABLE IF NOT EXISTS <new_table> AS
SELECT * FROM <base_table>;
-- Creates a table with same structure as base table, and also copy/insert the data into the new table using SELECT * statement.

CREATE EXTERNAL TABLE IF NOT EXISTS <new_table> AS
SELECT column1, column2, ... FROM <base_table>;
-- To create new table with selected columns

CREATE TABLE <new_table> AS 
(SELECT * FROM old_table WHERE 1=0);
-- To create a new_table but not copying any data


CREATE TABLE <new_table> AS
(SELECT companies.id, companies.address, categories.cat_type
    FROM companies, categories
    WHERE companies.id = categories.id
    AND companies.id > 1000);
-- To Create a new_table based on colums from both the base tables.


-- Clone the columns and data, and convert the data to a different file format.
CREATE TABLE parquet_version_of_base_table STORED AS PARQUET AS SELECT * FROM <base_table>;


-- Reorder and rename columns and transform the data.
CREATE TABLE t5 AS SELECT upper(y) AS s, x+1 AS a, 'Entirely new column' AS n FROM t1;


CREATE TABLE partitions_no (year smallint, month tinyint, s string);
CREATE TABLE partitions_yes partitioned by (year, month) AS SELECT s, year, month from partitions_no;
-- Creating a Partition table from a Not-Partition table.
-- The CTAS operation forced us to put the partition key columns in the last of the select statememt.
CREATE TABLE partitions_maybe partitioned by (year, month) AS SELECT year, month, s from partitions_no; -- ERROR

