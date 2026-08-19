# 📊 Windows System Health Monitor (Bash + PowerShell)

An automated lightweight system monitoring tool built for Windows environments using **Git Bash** and **PowerShell**. It monitors CPU, RAM, and Disk space usage in real-time, logs historical data, and triggers native **Windows Toast Notifications** when resource thresholds are exceeded.

---

## 🌟 Features
- 🚀 **Real-Time Monitoring:** Tracks CPU Usage, RAM Usage, and C: Drive Disk Space.
- 🔔 **Native Windows Alerts:** Displays pop-up Toast Notifications on threshold breach.
- 📝 **Automated Logging:** Logs performance data with timestamps for audit trails.
- ⏰ **Task Scheduler Ready:** Designed to run silently in the background via Windows Task Scheduler.

---

## 🛠️ Prerequisites
- Windows 10/11
- Git Bash installed
- PowerShell 5.1+

---

## ⚙️ Installation & Usage

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/YOUR_USERNAME/windows-system-health-monitor.git](https://github.com/YOUR_USERNAME/windows-system-health-monitor.git)
   cd windows-system-health-monitor

## 🕒 Automation via Windows Task Scheduler
To run this script automatically every 10 minutes:

1. Open Task Scheduler and click Create Basic Task.

2. Set Trigger to Daily and configure it to repeat every 10 minutes.

3. Set Action to Start a program:

- Program/script: C:\Program Files\Git\bin\bash.exe

- Add arguments: --login -i -c '"/d/projects/CPU_RAM_Disk Monitor/system_monitor.sh" >> "/d/projects/CPU_RAM_Disk Monitor/system_monitor.log" 2>&1'

## 💻 Tech Stack
- Shell: Bash (Git Bash)

- Scripting: PowerShell (Win32 CIM Instance APIs)

- OS Platform: Windows
