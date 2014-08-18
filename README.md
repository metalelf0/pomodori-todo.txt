## Pomodori-todo.txt

A pomodoro counter implementation for [Todo.txt](http://todotxt.com/).

## Installation

* Make sure you have ruby installed
* run `gem install rainbow`
* Download this repo somewhere on your filesystem
* symlink the `pom` executable into your TODO_ACTIONS_DIR

## Usage:

	todo.sh pomo action [task_number] [args]
	Actions:
	  ls
	     lists tasks with pomodori count and estimates
	  start ITEM#
	     start a pomodoro timer for item ITEM#
	  add ITEM#
	     add one pomodoro to task on line ITEM# without running a timer
	  plan ITEM# PLANNED_POMODORI
	     estimate ITEM# will take PLANNED_POMODORI to complete

## Example:

<img src="https://raw.github.com/metalelf0/pomodori-todo.txt/master/screenshot.png">
