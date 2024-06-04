#!/usr/bin/env bash
# List all tmux sessions and select one using fzf
SELECTED_SESSION=$(tmux list-sessions -F '#S' | fzf-tmux -p 60%,40%)

# Check if a session was selected
if [ -n "$SELECTED_SESSION" ]; then
  echo "You selected the tmux session: $SELECTED_SESSION"
  # You can add additional commands here if needed, for example:
  tmux switch-client -t "$SELECTED_SESSION"
else
  echo "No session selected"
fi

# if [ -z "$TMUX" ]; then 
#     echo "is not in a tmux session"
#
#     ZOXIDE_RESULT=$(zoxide query -l | fzf --reverse)
#
#
#     if [ -z "$ZOXIDE_RESULT" ]; then
#         exit 0 
#     fi
#
#     FOLDER=$(basename "$ZOXIDE_RESULT")
#
#     SESSION=$(tmux list-sessions 2>/dev/null | grep "$FOLDER" | awk 'BEGIN {FS=":"} {print $1}')
#     
#     if [ -z "$SESSION" ]; then
#         echo "Session does not exist"
#
#         cd "$ZOXIDE_RESULT" || exit
#
#         tmux new-session -s "$FOLDER"
#     else
#         echo "Session exists"
#
#         tmux attach -t "$SESSION"
#     fi
# else
#     echo "is in a tmux session"
#
#     ZOXIDE_RESULT=$(zoxide query -l | fzf --reverse)
#
#     if [ -z "$ZOXIDE_RESULT" ]; then
#         exit 0 
#     fi
#
#     FOLDER=$(basename "$ZOXIDE_RESULT")
#
#     SESSION=$(tmux list-sessions 2>/dev/null | grep "$FOLDER" | awk 'BEGIN {FS=":"} {print $1}')
#     
#     if [ -z "$SESSION" ]; then
#         echo "Session does not exist"
#
#         cd "$ZOXIDE_RESULT" || exit
#
#         tmux new-session -d -s "$FOLDER"
#         tmux switch-client -t "$FOLDER"
#     else
#         echo "Session exists"
#
#         tmux switch-client -t "$FOLDER"
#     fi
# fi
