##This is Add_dutyShell
MSG="jiaren SB"

curl --location --request POST 'https://notify-api.line.me/api/notify' \
--header 'Authorization: Bearer qm0oix3SyLMnBK6AuitdcvkZI0Wvf7T7qDuQyHgnjWu' \
--form "message=${MSG}"

echo Hello