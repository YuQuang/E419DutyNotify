ARR=$( \
while IFS=, read line
do 
    echo $line
done < shiftTable.csv )

echo "ARR=${ARR}"

IFS=',' read -ra DATE <<< "$ARR"
for i in "${DATE[@]}"; do
  echo "Line ${i}"
done

DAY=$(expr $(expr $(date '+%s') + 28800) / 86400)
ORDER=$(expr $DAY % ${#DATE[@]})

curl --location --request POST 'https://notify-api.line.me/api/notify' \
--header 'Authorization: Bearer qm0oix3SyLMnBK6AuitdcvkZI0Wvf7T7qDuQyHgnjWu' \
--form "message=${DATE[$ORDER]}"