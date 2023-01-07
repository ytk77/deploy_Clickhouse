#!/bin/bash

clickhouse-client < create_ontime_table.sql
wget --no-check-certificate --continue https://transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_{2010..2022}_{1..12}.zip
ls -1 *.zip | xargs -I{} -P $(nproc) bash -c "echo {}; unzip -cq {} '*.csv' | sed 's/\.00//g' | clickhouse-client --input_format_csv_empty_as_default 1 --query='INSERT INTO ontime FORMAT CSVWithNames'"



https://transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_{1987..2022}_{1..12}.zip