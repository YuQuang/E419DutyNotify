# Simple Line Notify
## Introduction
簡單的Shell, 執行時會獲取當前的TimeStamp並計算天數除以排班人數，
去看今天的值日生是誰，並透過Line Notify提醒
## Quick Start
設定CronTab排程每天定時呼叫shell
``` shell
sudo vim /etc/crontab
```
Example:
``` shell
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
10 10   * * *   root    sh dutyShell.sh ## 每天早上 10 點 10 分執行
```
重啟cron服務
``` shell
sudo service cron restart
```