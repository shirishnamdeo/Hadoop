DROP TABLE IF EXISTS <table_name>;
CREATE EXTERNAL TABLE <table_name> (
    column_name1     DATATYPE,
    column_name2     DATATYPE,
    column_name3     DATATYPE,
    ...
)
COMMENT 'COMMENT'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE
TBLPROPERTIES("skip.header.line.count"="1");


