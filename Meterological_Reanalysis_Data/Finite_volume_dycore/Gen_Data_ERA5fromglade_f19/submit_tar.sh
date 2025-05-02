#!/bin/bash -f

mons=(01 02 03 04 05 06 07 08 09 10 11 12)
day_per_mon=(31 28 31 30 31 30 31 31 30 31 30 31)

for i in {0..11}; do
    month=${mons[$i]}
    startday=01
    endday=${day_per_mon[$i]}

    echo "Month = $month: Start Day = $startday, Last day = $endday"

    sed -e "s/__MONTH__/${month}/g" \
        -e "s/__STARTDAY__/${startday}/g" \
        -e "s/__ENDDAY__/${endday}/g" \
        tar_regridded.sh > tar_regridded_${month}.sh

    qsub tar_regridded_${month}.sh

done
