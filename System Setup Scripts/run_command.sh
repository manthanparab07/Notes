#!/bin/bash

#command='go run program_demo.go;read -n 1'
command='go run $HOME/Program/exercise/test/quiz.go;read -n 1'
#command='bash'

setsid gnome-terminal -e "bash -c \"$command\""
