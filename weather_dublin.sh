#! /bin/bash

date
echo "Weather of Dublin"
wget -O data/weather/weather_dublin.sh`date +"%Y%m%d_%H%M%S_dublin.json"` https://prodapi.metweb.ie/observations/dublin/today
echo "Weather of Dublin Downloaded"

