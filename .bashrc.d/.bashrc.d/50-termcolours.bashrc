#!/bin/env bash

tmux_bg_colours() {
	if [ "$1" == "prod" ]; then
    		tmux select-pane -P 'bg=#350000'
	elif [ "$1" == "dev" ]; then
    		tmux select-pane -P 'bg=#404000'
  	elif [ "$1" == "other" ]; then
 		tmux select-pane -P 'bg=#253320'
  	else
    		tmux select-pane -P 'bg=#1f2224'
  	fi;
}

default_term() {
	if [ "$1" == "prod" ]; then
		printf '\033]11;#350000\007'
	elif [ "$1" == "dev" ]; then
		printf '\033]11;#404000\007'
	elif [ "$1" == "other" ]; then
		printf '\033]11;#253320\007'
	else
		printf '\033]11;#1f2224\007'
	fi
}

term_bg_colours() {
	if [[ "$TERM" = "screen"* ]] && [[ -n "$TMUX" ]]; then
		tmux_bg_colours "$1"
	else
		default_term "$1"
	fi
}

ssh_term_bg() {
	trap "term_bg_colours" RETURN EXIT
        if [[ "$*" =~ "prod" ]]; then
	    term_bg_colours prod
	elif [[ "$*" =~ "dev" ]]; then
	    term_bg_colours dev
	else
	    term_bg_colours other
	fi
	ssh $*
}
