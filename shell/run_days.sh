#!/bin/sh

if [ $# -lt 2 ];then
    echo "./*** <begin_date> <end_date> <retry>"
    exit 1
fi

begin_date=`date -d "$1" +'%Y%m%d'`
end_date=`date -d "$2" +'%Y%m%d'`

retry=0
if [ -n "$3" ];then
    retry=$3
fi

while [ $begin_date -le $end_date ];do
    echo $begin_date

    aRetry=$retry
    while [ $aRetry -ge 0 ];do

        ## --------------------- call your command here ----------------------------


        ## -------------------------------------------------------------------------

        if [ $? -eq 0 ];then
            break
        fi

        echo "try again! date: $begin_date"
        aRetry=$((aRetry - 1))
        
        wait
        sleep 10
    done

    if [ $aRetry -lt 0 ]; then
        echo "超过最大重试次数，date: $begin_date"
        exit 1
    fi

    begin_date=`date -d "$begin_date 1 days" +'%Y%m%d'`

    wait
    sleep 3
done
