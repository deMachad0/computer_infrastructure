# Computer Infrastructure

## Project (40%)

### In this project, I will automate my weather.sh script to run daily and push the new data to my repository

## Steps:
---
1. Create a GitHub Actions Workflow - it's a folder called `.github/workflows/`
---
2. Inside the folder above (.github/workflows/) create a file called `weather-data.yml`. In this file there will be: 

```bash
#!/bin/bash

echo "The automated Date process"
wget -O data/weather/weather.sh`date +"%Y%m%d_%H%M%S_athenry.json"` https://prodapi.metweb.ie/observations/athenry/today
echo "Date Downloaded"
date
```

Explanation of the script:\
`#!/bin/bash`: Indicates that the script should be executed using the Bash shell.\
`date`: Prints the current date and time.\
`echo`: Displays the given message on the terminal.\
`wget`: Downloads the weather data and saves it to a timestamped file.

---
3. Run Daily at 10am: Using `schedule` event with `cron` to set the script. 

```bash
on: 
    schedule: 
      - cron: "0 10 * * *"
    workflow_dispatch:
```
Explanation of the script:\
`schedule` runs the workflow at specific times according to a cron schedule.\
The `cron` syntax specifies when the workflow should run. In this case at 10am.\
`cron: "0 10 * * *"`\
`0`: Run at the 0th minute of the hour.\
`10`: Run at 10AM.\
`*`: Every day of the month.\
`*`: Every month.\
`*`: Every day of the week.\
`workflow_dispatch` allows manual execution of the workflow.

`https://dev.to/thatanjan/learn-cron-jobs-in-10-minutes-1p77?utm_source=chatgpt.com` This link is very helpful to understand cron pattern work

---
4. Clone the Repository

```bash
- name: Clone Repository
  run: |
    git clone https://github.com/deMachad0/computer_infrastructure.git
```
Using `git` Command allows manually clone a repository.\
Explanation of the Script:\
`-name: Clone Repository` it's the name of the step.\
`run: |` The run keyword sets a command to be executed. The | indicates the following lines are a multi-line script.
`git clone https://github.com/deMachad0/computer_infrastructure.git` a Git command to copy a repository from a remote URL.

---
5. Execute the `weather.sh` script

```bash
- name: Run weather.sh script
  run: ./weather.sh
```
`name: Run weather.sh script` it's the name of the step.\
`run: ./weather.sh` executes the script file located in the root of the repository. `./` indicates the script is bein run from the current directory./
To the script be executable, another step must be included using the command:
```bash
run: chmod +x weather.sh
```
