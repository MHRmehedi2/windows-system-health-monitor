#!/bin/bash

# Thresholds (আপনার পছন্দমতো সীমা নির্ধারণ করুন)
CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=85

echo "--- System Health Check: $(date) ---"

# ১. CPU Usage (PowerShell এর মাধ্যমে)
CPU_USAGE=$(powershell.exe -NoProfile -Command "(Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average" | tr -d '\r')
CPU_USAGE=${CPU_USAGE%.*} # Integer-এ কনভার্ট করা

if [ -n "$CPU_USAGE" ] && [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "ALERT: High CPU Usage Detected! Current: ${CPU_USAGE}%"
else
    echo "CPU Usage: OK (${CPU_USAGE:-0}%)"
fi

# ২. RAM Usage (PowerShell এর মাধ্যমে)
RAM_USAGE=$(powershell.exe -NoProfile -Command "\$os = Get-CimInstance Win32_OperatingSystem; [math]::Round(((\$os.TotalVisibleMemorySize - \$os.FreePhysicalMemory) / \$os.TotalVisibleMemorySize) * 100)" | tr -d '\r')

if [ -n "$RAM_USAGE" ] && [ "$RAM_USAGE" -gt "$RAM_THRESHOLD" ]; then
    echo "ALERT: High RAM Usage Detected! Current: ${RAM_USAGE}%"
else
    echo "RAM Usage: OK (${RAM_USAGE:-0}%)"
fi

# ৩. Disk Usage (C: Drive)
DISK_USAGE=$(df /c | awk 'END{print $5}' | sed 's/%//')

if [ -n "$DISK_USAGE" ] && [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "ALERT: High Disk Usage Detected! Current: ${DISK_USAGE}%"
else
    echo "Disk Usage: OK (${DISK_USAGE}%)"
fi

echo "-------------------------------------"
# ফলাফল D:\projects\CPU_RAM_Disk Monitor\system_monitor.log ফাইলে জমা হবে
