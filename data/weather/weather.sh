#! /bin/bash

echo "The automated Date process"
wget -O data/weather/`date +"%Y%m%d_%H%M%S.json"` https://prodapi.metweb.ie/observations/athenry/today
echo "Date Downloaded"
date
