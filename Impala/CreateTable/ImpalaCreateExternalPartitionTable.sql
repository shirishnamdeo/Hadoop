DROP TABLE IF EXISTS <table_name>;
CREATE EXTERNAL TABLE <table_name> (
    column_name1     DATATYPE,
    column_name2     DATATYPE,
    column_name3     DATATYPE,
    ...
)
PARTITIONED BY (
    partition_column_name1   DATATYPE,
    partition_column_name2   DATATYPE,
    ...
)
STORED AS PARQUET;