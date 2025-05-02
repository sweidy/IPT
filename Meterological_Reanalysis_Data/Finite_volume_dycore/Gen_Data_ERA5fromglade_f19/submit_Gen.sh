#!/bin/bash -f

mons=(01 02 03 04 05 06 07 08 09 10 11 12)
day_per_mon=(31 28 31 30 31 30 31 31 30 31 30 31)
day_start=(1 1 1 1 1 1 1 1 1 1 1 1)

#mons_needed=(0 6 7 8 10 11) # 0-indexed

for i in {0..11}; do
#for i in ${mons_needed[@]}; do
    month=${mons[$i]}
    startday=${day_start[$i]}
    startday_no=$(printf "%02d" $startday)
    lenrun=$(( ${day_per_mon[$i]} - $startday + 1 ))

    echo "Month = $month: Start Day = $startday_no, Days Remaining = $lenrun"

    sed -e "s/__MONTH__/${month}/g" \
        -e "s/__STARTDAY__/${startday_no}/g" \
        -e "s/__LENRUN__/${lenrun}/g" \
        Gen_ERAI_fv09_001.01.csh > Gen_ERA5_${month}.csh

    qsub Gen_ERA5_${month}.csh

done
