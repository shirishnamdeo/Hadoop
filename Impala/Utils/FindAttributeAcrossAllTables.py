${IMPALA_SHELL} -B -q "SHOW TABLES;" -o show_tables.txt '--output_delimiter=,'



with open('show_tables.txt', 'r') as show_tables_file:
    import os
    show_tables_file.readline()
    os.system("${IMPALA_SHELL} -B -q 'DESCRIBE ' -o show_tables.txt '--output_delimiter=,'")