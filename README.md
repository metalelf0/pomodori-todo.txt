## Pomodori-todo.txt

A pomodoro counter implementation for [Todo.txt](http://todotxt.com/).

## What it features

* easily plan, run timers, and show current tasks status via the command line
* allows tmux integration to display the remaining pomodoro timer in your tmux statusbar
* logs the pomodori start time and end time to a log file for an easy history
* uses the terminal-notifier gem to notify you when your pomodoro starts and ends

## Installation

* Make sure you have ruby installed
* run `gem install rainbow terminal-notifier`
* Download this repo somewhere on your filesystem
* symlink the `pom` executable into your TODO_ACTIONS_DIR

## Usage:

	todo.sh pom action [task_number] [args]
	Actions:
	  ls
	     lists tasks with pomodori count and estimates
    log
       displays a log of your pomodori
	  start ITEM#
	     start a pomodoro timer for item ITEM#
	  add ITEM#
	     add one pomodoro to task on line ITEM# without running a timer
	  plan ITEM# PLANNED_POMODORI
	     estimate ITEM# will take PLANNED_POMODORI to complete

## Example:

<img src="https://raw.github.com/metalelf0/pomodori-todo.txt/master/screenshot.png">
