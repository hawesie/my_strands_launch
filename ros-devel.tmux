#!/bin/bash

SESSION=ros

tmux -2 new-session -d -s $SESSION
# Setup a window for tailing log files
tmux new-window -t $SESSION:0 -n 'roscore'
tmux new-window -t $SESSION:1 -n 'datacentre'
tmux new-window -t $SESSION:2 -n 'scheduling'
tmux new-window -t $SESSION:3 -n 'bash'

tmux select-window -t $SESSION:0
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "source ~/bin/ros-setup.bash" C-m
tmux send-keys "roscore" C-m
tmux resize-pane -U 30
tmux select-pane -t 1
tmux send-keys "htop" C-m

tmux select-window -t $SESSION:1
tmux send-keys "source ~/bin/ros-setup.bash" C-m
tmux send-keys "roslaunch ros_datacentre datacentre.launch" C-m

tmux select-window -t $SESSION:2
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "source ~/bin/ros-setup.bash" C-m
tmux send-keys "rosrun task_executor schedule_status.py" C-m
# tmux resize-pane -U 30
tmux select-pane -t 1
tmux send-keys "source ~/bin/ros-setup.bash" C-m
tmux send-keys "roslaunch task_executor task-scheduler.launch  topological_map:=cs_lg_sim_topological"

tmux select-window -t $SESSION:3
tmux send-keys "source ~/bin/ros-setup.bash" C-m

# Set default window
tmux select-window -t $SESSION:0

# Attach to session
tmux -2 attach-session -t $SESSION

tmux setw -g mode-mouse on
