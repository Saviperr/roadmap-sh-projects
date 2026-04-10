#!/bin/bash

echo "---Server Performance Status ---"
date
echo "-------------------------------"

echo "===== CPU Usage ====="
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

echo "===== Memory Usage ====="
free -m | awk 'NR==2{printf "Used: %sMB | Free: %sMB | Usage: %.2f%%\n", $3, $4, $3*100/$2 }'

echo "===== Disk Usage ====="
df -h | awk '$NF=="/" {printf "Used: %s | Free: %s | Usage: %s\n", $3, $4, $5}'

echo "===== Top 5 Processes by CPU ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo "===== Top 5 Processes by Memory ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

