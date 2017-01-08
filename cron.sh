#!/bin/bash
crontab -l > currentjobs
echo "50 */3 * * * `pwd`/automate.sh defence" >> currentjobs
echo "*/10 3-5 * * * `pwd`/automate.sh caravan" >> currentjobs
crontab currentjobs
rm currentjobs
