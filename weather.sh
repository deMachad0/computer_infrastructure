#! /bin/bash

echo "The automated Date process"
wget -O data/weather/weather.sh`date +"%Y%m%d_%H%M%S_athenry.json"` https://prodapi.metweb.ie/observations/athenry/today
echo "Date Downloaded"
date