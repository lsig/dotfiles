#!/usr/bin/env bash

if [ -z "$TMUX" ]; then 
    echo "is not tmux"

    ZOXIDE_RESULT=$(zoxide -query -l | fzf --reverse)

    if [-z "$ZOXIDE_RESULT" ]; then
        exit 0 
    fi

    FOLDER=$(basename $ZOXIDE_RESULT)

    SESSION=$(tmux list-sessions | grep $FOLDER | awk '{print $1}')
    SESSION=${SESSION//:/}

    if [-z "$SESSION" ]; then
        echo "session does not exists"

        cd $ZOXIDE_RESULT

        tmux new-session -s $FOLDER
    else
        echo "session exists"

        tmux attach -t $SESSION
    fi
else
    echo "is tmux"

    ZOXIDE_RESULT=$(zoxide -query -l | fzf --reverse)

    if [-z "$ZOXIDE_RESULT" ]; then
        exit 0 
    fi

    FOLDER=$(basename $ZOXIDE_RESULT)

    SESSION=$(tmux list-sessions | grep $FOLDER | awk '{print $1}')
    SESSION=${SESSION//:/}

    if [-z "$SESSION" ]; then
        echo "session does not exists"

        cd $ZOXIDE_RESULT

        tmux new-session -d -s $FOLDER
        tmux switch-client -t $FOLDER
    else
        echo "session exists"

        tmux switch-client -t $FOLDER
    fi
fi

