#!/usr/bin/env bash

SESSION="lab2"

# Kill existing session if it exists to guarantee a fresh start
tmux kill-session -t "$SESSION" 2>/dev/null

# Create a new session (detached), naming the first window 'vpn'
tmux new-session -d -s "$SESSION" -n "vpn" -c "$HOME/Documents/vpn"
tmux set-option -t "$SESSION" status on
tmux send-keys -t "$SESSION:vpn" "clear" C-m

# Window: scan
tmux new-window -t "$SESSION" -n "scan" 
tmux send-keys -t "$SESSION:scan" "oscptoml " 

# Window: http 
tmux new-window -t "$SESSION" -n "http" -c "$HOME"
tmux send-keys -t "$SESSION:http" "updog " 

# Window: rev 
tmux new-window -t "$SESSION" -n "rev"
tmux send-keys -t "$SESSION:rev" "penelope "

# Window: nc 
tmux new-window -t "$SESSION" -n "nc"
tmux send-keys -t "$SESSION:nc" "rlwrap nc -lvnp "

# Window: tools
tmux new-window -t "$SESSION" -n "tool" -c "$HOME/tools"

# Focus on the 'vpn' window and attach
tmux select-window -t "$SESSION:vpn"
tmux attach-session -t "$SESSION"

# Bottom bar bugging
# Add sleep 0.25 before send keys if bar is bugging
# Check VM running processes, docker, host RAM 