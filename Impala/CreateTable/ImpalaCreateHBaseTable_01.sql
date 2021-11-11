DROP TABLE IF EXISTS <table_name>;
CREATE EXTERNAL TABLE <table_name> (
    column_name1     DATATYPE,
    column_name2     DATATYPE,
    column_name3     DATATYPE,
    ...
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = )
TBLPROPERTIES ('hbase.table.name' = '${HIVE_SCHEMA}.table_name');