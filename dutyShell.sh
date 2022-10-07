#! /bin/bash

# 取得目前Shell檔案位置
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# 讀取CSV值日生資料
ARR=$( \
while IFS=, read line
do 
    echo $line
done < $SCRIPTPATH/shiftTable.csv )

# 把資料轉成陣列
IFS=',' read -ra DATE <<< "$ARR"

# 計算當前時間基於UnixTimeStamp除以一天86400, 28800是GMT+8台北時間
DAY=$(expr $(( $(date '+%s') + 28800 )) / 86400)

# 連續三天的排班
ORDER1=$(expr $DAY % ${#DATE[@]})
ORDER2=$(expr $(( ${DAY} + 1 )) % ${#DATE[@]})
ORDER3=$(expr $(( ${DAY} + 2 )) % ${#DATE[@]})

# 傳送連續三天的訊息
COUNT=0
for i in {${ORDER1},${ORDER2},${ORDER3}}
do 
   DAYS="+${COUNT} days"
   MSG="　
   =======================
   $(date -d "${DAYS}" '+%Y-%m-%d %A')
   =======================
   --->${DATE[$i]}"
   curl --location --request POST 'https://notify-api.line.me/api/notify' \
   --header 'Authorization: Bearer qm0oix3SyLMnBK6AuitdcvkZI0Wvf7T7qDuQyHgnjWu' \
   --form "message=${MSG}"
   COUNT=$( expr ${COUNT} + 1 )
done