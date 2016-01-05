#!/bin/bash
rm -f /automation/report.txt
cd /var/www/MISP/app/Console/
./cake CakeResque.CakeResque stats > /automation/report.txt
cd /automation
mutt -s "MISP Cake Job Report" email@email.com < report.txt
