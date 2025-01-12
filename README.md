# Computer Infrastructure
ATU Computer Infrastructure Tasks

## My CI Repository

This Repository contains my ATU computer infrastructure tasks

### Getting Started

Firstly a brief introduction about some important concepts: 

Hardware:
The physical components of a computer system, such as the CPU, memory, storage devices, and input devices like buttons, screens, mice, and keyboards. These are tangible elements essential for computer functionality.

Software:
The intangible part of a computer system that includes programs and instructions, guiding the hardware to perform specific tasks. Examples range from operating systems to applications running on your machine.

Operating System (OS):
A system software that manages computer hardware and software resources, enabling device installation and overall system management. Examples include Windows, Linux, and Android.

Applications:
Software programs designed to carry out specific tasks for the user, such as web browsers (Chrome, Edge), email clients, games, or calculators.

Summary
Hardware: Provides the physical foundation.
Software: Offers instructions for hardware operations.
Operating System: Manages resources and system functions.
Applications: Perform tasks for users.
Operating Systems and Concepts
Desktop Metaphor
The concept treats a computer monitor like the surface of a desk where documents and files can be opened and organized.

Historical Context
During the 1990s, the PC industry sought to simplify computer usage by introducing familiar terms for users. Key concepts emerged, such as:

Windows and Task Management
Files and Folders
Virtual Memory and Processes
Networking Solutions
These innovations helped lay the groundwork for modern computing experiences.

## This document provides an overview of Tasks 1 to 7, detailing each step and command to create a directory structure, handle timestamps, download weather data, and automate the process through scripting.

---

### **Task 1: Create Directory Structure**

To create directories (folders) in the terminal, use the `mkdir` command. Below are examples:

**Create a single folder:**
```bash
mkdir data
```

`mkdir` = it's the shortcut to make a directory, Example: `mkdir data` - it will create a folder called **data**.
And also can be used `mkdir data/weather` - it will create another folder named **weather** inside the **data** folder.
``` bash 
mkdir data/timestamps
```
This creates a folder named **timestamps** inside the **data** folder.

---

### Task 2: Timestamps

Navigate into timestamps folder using cd command:
```bash
cd ./data/timestamps
```
Create a file name **now.txt**
```bash
mkdir now.txt
```
``` bash
date >> now.txt
```
This appends the current date and time (e.g., Sun Nov 17 13:20:26 UTC 2024) to the file.
``` bash
more now.txt
```
**more** command displays the content of the file (now.txt) on the terminal. When using this command, sometimes the content of the file is large, a `%` shows where you are. Press space to scroll and **Q** to quit.

---

## Task 3: Formatting Timestamps

Display a formatted timestamp:
``` bash
date +"%Y%m%d_%H%M%S"
```
This outputs the date and time in the format YYYYmmdd_HHMMSS. Here is how the placeholders work:

The `%Y` is replaced by the four-digit year (e.g 2024).\
The `%m` is replaced by the four-digit month (e.g 11).\
The `%d` is replaced by the four-digit day (e.g 13).\
The `%H` is replaced by the four-digit hour (e.g 21).\
The `%M` is replaced by the four-digit minutes (e.g 43).\
The `%s` is replaced by the four-digit seconds (e.g 55).

Append the formatted timestamp to **formatted.txt**
```bash
date +"%Y%m%d_%H%M%S" >> formatted.txt
```
Learn more about **date** formatting:
```bash
man date
```
 it's the shortcut for manual date, where all the commands related to date will be shown. To quit the **man date**, press the letter **Q**.

---

## Task 4: Create Timestamped Files

Create a file with the current timestamp in its name:
``` bash
touch `date +"%Y%m%d_%H%M%S.txt"`
```
this command will create a file named YYYYmmdd_HHMMSS in the current folder.

**touch**: this command will create another file inside the folder that you are in, example: touch empty.md

---

## Taks 5: Download Today's Weather Data

Navigate to the **weather** folder:
``` bash
cd ./data/weather
``` 
Download weather data and save it with timestamped filename:
```bash
wget -O weather.json https://prodapi.metweb.ie/observations/athenry/today 
```
Aternative usage without specifying a file name:
```bash
wget https://prodapi.metweb.ie/observations/athenry/today 
```
This downloads the data and saves it in the current folder with the default name.\
**Sometimes wget is not installed**
```bash
sudo apt install wget 
```
This installs wget on your system.

---

## Task 6: Timestamp the Data

Download data and save it with a timestamped filename:
```bash
wget -O `date +"%Y%m%d_%H%M%S.json"` https://prodapi.metweb.ie/observations/athenry/today 
```
This command saves the downloaded data with a timestamped filename (`date +"%Y%m%d_%H%M%S.json"`)

---

## Task 7: Write the Script

Create a file called **weather.sh** and add the following cotent:

```bash
#!/bin/bash
date\
echo "Downloading weather data"\
wget -O data/weather/`date +"%Y%m%d_%H%M%S_athenry.json"` https://prodapi.metweb.ie/observations/athenry/today\
echo "Weather data downloaded"\
date
```

Explanation of the script:\
`#!/bin/bash`: Indicates that the script should be executed using the Bash shell.\
`date`: Prints the current date and time.\
`echo`: Displays the given message on the terminal.\
`wget`: Downloads the weather data and saves it to a timestamped file.

Makes the script executable:
```bash
chmod u+x ./weather.sh
```
Run the script:
```bash
./weather.sh
``` 
This executes the script and downloads the weather data into a timestamped file.