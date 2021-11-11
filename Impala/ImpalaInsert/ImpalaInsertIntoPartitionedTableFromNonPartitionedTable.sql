-- CASE when both table has exactly same columns, with base table non-partitioned and new_table partitioned

INSERT INTO <new_table> SELECT * FROM <base_table>; -- ERROR
-- Not enough partition columns mentioned in query.

INSERT INTO <new_table> PARTITION(partition_column1, partition_column2, ...) SELECT * FROM <base_table>; -- DOES NOT WROKS!!
-- The above statement is SYNTACTICALL correct but the order of the columns is not correct. 
-- In this case the partition_column1, partition_column2, .. etc are considered from the last columns from the select query.


INSERT INTO <new_table> PARTITION(partition_column1, partition_column2, ...) 
SELECT *
	column_name1,
	column_name2,
	...
	partition_column1,
	partition_column2,
	...
 FROM <base_table>
 WHERE <condition(s)>;
-- Need to specify all the PARTITIONs of the new_table in the PARTITION clause
-- All the partiton columns must be in last and also in same order as defined above in PARTITION clause
-- Additionally all the other non partitioned columns must be in same order as in the target PARTITIONED table. Impala does not understand them internally
