# SSH Failed-Login Reporter
Bash script that counts failed SSH login attempts per IP from /var/log/auth.log (falls back to journalctl).

## Usage
```bash
chmod +x ssh_fail_report.sh
sudo ./ssh_fail_report.sh            # default log
sudo ./ssh_fail_report.sh /path/log  # custom log
```
## Tested
Ubuntu Server 26.04 VM; failed logins generated from Kali (10.0.2.15) in my LabNet home lab.

![output](ssh_report_output.png)
