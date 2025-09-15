#!/bin/bash
echo "==============================="
echo "Server Performance Stats Report"
echo "==============================="

# Get the current date and time
current_date=$(date +"%Y-%m-%d %H:%M:%S")
echo "Report generated on: $current_date"
echo ""

# Get the total number of CPU Usage
total_cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')
echo "Total CPU usage: $total_cpu_usage"
echo ""
#Get the Total memory usage (Free vs Used including percentage)
echo "Total memory usage (Free vs Used including percentage)"

free -m|awk 'NR==2{printf "Used: %s MB / %s MB (%.2f%%)\n",$3 ,$2, $3*100/$2}'
echo ""
#Get the Total disk usage (Free vs Used including percentage)

echo "Total disk usage (Free vs Used including percentage)"
df -h /|awk 'NR==2{printf "FileSystem: %s | Disk Used: %s | Available: %s | Total: %s | Use: %s",$1,$3,$4,$2,$5}'
echo ""

echo ""
# Get the top 5 processes by CPU usage

echo "Top 5 processes by CPU usage"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""
#Get the top 5 processes by memory usage


echo "Top 5 processes by memory usage" 
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo ""
# Get the total number of processes running
total_processes=$(ps -e | wc -l)
echo "Total number of processes running : $total_processes" 
echo ""
