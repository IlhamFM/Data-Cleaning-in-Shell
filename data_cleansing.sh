#!/bin/bash

csvstack 2019-Nov-sample.csv 2019-Oct-sample.csv > 2019-Oct-Nov-1.csv
csvgrep -c "event_type" -m "purchase" 2019-Oct-Nov-1.csv > 2019-Oct-Nov-2.csv
csvcut -c 2,3,4,5,7,8 2019-Oct-Nov-2.csv > 2019-Oct-Nov-3.csv
csvcut -c "category_code" 2019-Oct-Nov-2.csv | awk -F "." '{print $1}' > kategori-1.csv
csvcut -c "category_code" 2019-Oct-Nov-2.csv | awk -F "." '{print $NF}' > kategori-2.csv
csvjoin 2019-Oct-Nov-3.csv kategori-1.csv kategori-2.csv > 2019-Oct-Nov-Final.csv
csvlook 2019-Oct-Nov-Final.csv | head -20
