# Computer Infrastructure

## Project (40%)

### In this project, I will automate my weather.sh script to run daily and push the new data to my repository

## Steps:
---
1. Create a GitHub Actions Workflow - it's a folder called `.github/workflows/`
---
2. Inside the folder above (.github/workflows/) create a file called `weather-data.yml`. In this file is inserted: 

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
The data can be found at this URL: `https://prodapi.metweb.ie/observations/athenry/today.`

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

`https://dev.to/thatanjan/learn-cron-jobs-in-10-minutes-1p77?utm_source=chatgpt.com` This link is very helpful to understand how cron pattern works

---
4. Use a Linux Virtual Machine In the workflow file, specify that a Ubuntu virtual machine should be used to run the action

```bash
jobs:
    check:
        runs-on: ubuntu-latest
        steps:
            - name: Checkout repository
              uses: actions/checkout@v3
```
Explanation of the script:\
`jobs`: Includes one or more tasks that need to be completed as part of the workflow.\
`runs-on`: The latest virtual machine environment for Ubuntu is being used for this job.\
`steps`: includes a set of actions that must be taken in order to complete the task.\
`name: Checkout Repository`: checkouts the repository's code using the actions/checkout@v3 action. This stage makes ensuring that the code is usable in the steps that follow.

---
5. Clone the Repository

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

`https://graphite.dev/guides/how-to-clone-a-git-repository-with-git-clone` Very useful link to learn how to create a bash to clone a repository in few steps

---
6. Execute the `weather.sh` script

```bash
- name: Run weather.sh script
  run: ./weather.sh
```
`name: Run weather.sh script` it's the name of the step.\
`run: ./weather.sh` executes the script file located in the root of the repository. `./` indicates the script is being run from the current directory./
To the script be executable, another step must be included using the command:
```bash
run: chmod +x weather.sh
```
`https://www.geeksforgeeks.org/run-bash-script-in-github-actions/` The link provided shows how Bash scripts are required for the running of GitHub Actions processes because they enable a variety of job automation. 

---