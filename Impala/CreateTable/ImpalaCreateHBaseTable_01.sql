use ${HIVE_SCHEMA};
DROP TABLE IF EXISTS ${HIVE_SCHEMA}.employee;
CREATE EXTERNAL TABLE ${HIVE_SCHEMA}.hbase_table (
    emp_id                  STRING    COMMENT 'Dummy Comment',
    name_prefix             STRING    COMMENT 'Dummy Comment',
    first_name              STRING    COMMENT 'Dummy Comment',
    middle_initial          STRING    COMMENT 'Dummy Comment',
    last_name               STRING    COMMENT 'Dummy Comment',
    gender                  STRING    COMMENT 'Dummy Comment',
    e_mail                  STRING    COMMENT 'Dummy Comment',
    fathers_name            STRING    COMMENT 'Dummy Comment',
    mothers_name            STRING    COMMENT 'Dummy Comment',
    mothers_maiden_name     STRING    COMMENT 'Dummy Comment',
    date_of_birth           STRING    COMMENT 'Dummy Comment',
    time_of_birth           STRING    COMMENT 'Dummy Comment',
    age_in_yrs              STRING    COMMENT 'Dummy Comment',
    weight_in_kgs           STRING    COMMENT 'Dummy Comment',
    date_of_joining         STRING    COMMENT 'Dummy Comment',
    quarter_of_joining      STRING    COMMENT 'Dummy Comment',
    half_of_joining         STRING    COMMENT 'Dummy Comment',
    year_of_joining         STRING    COMMENT 'Dummy Comment',
    month_of_joining        STRING    COMMENT 'Dummy Comment',
    month_name_of_joining   STRING    COMMENT 'Dummy Comment',
    short_month             STRING    COMMENT 'Dummy Comment',
    day_of_joining          STRING    COMMENT 'Dummy Comment',
    dow_of_joining          STRING    COMMENT 'Dummy Comment',
    short_dow               STRING    COMMENT 'Dummy Comment',
    age_in_company_years    STRING    COMMENT 'Dummy Comment',
    salary                  STRING    COMMENT 'Dummy Comment',
    last_percentage_hike    STRING    COMMENT 'Dummy Comment',
    ssn                     STRING    COMMENT 'Dummy Comment',
    phone_no                STRING    COMMENT 'Dummy Comment',
    place_name              STRING    COMMENT 'Dummy Comment',
    county                  STRING    COMMENT 'Dummy Comment',
    city                    STRING    COMMENT 'Dummy Comment',
    state                   STRING    COMMENT 'Dummy Comment',
    zip                     STRING    COMMENT 'Dummy Comment',
    region                  STRING    COMMENT 'Dummy Comment',
    user_name               STRING    COMMENT 'Dummy Comment',
    password                STRING    COMMENT 'Dummy Comment'
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = )
TBLPROPERTIES ('hbase.table.name' = '${HIVE_SCHEMA}.employee');