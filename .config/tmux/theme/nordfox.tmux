#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: nordfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nordfox/nordfox.tmux
set -g mode-style "fg=#232831,bg=#abb1bb"
set -g message-style "fg=#232831,bg=#abb1bb"
set -g message-command-style "fg=#232831,bg=#abb1bb"
set -g pane-border-style "fg=#abb1bb"
set -g pane-active-border-style "fg=#81a1c1"
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#abb1bb,bg=#232831"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
setw -g window-status-activity-style "underscore,fg=#7e8188,bg=#232831"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#7e8188,bg=#232831"

# 以下は書き換え済み
set -g status-left "#[fg=#232831,bg=#81a1c1,bold]  #S #[fg=#81a1c1,bg=#232831,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#232831,bg=#232831,nobold,nounderscore,noitalics]#[fg=#81a1c1,bg=#232831] #{prefix_highlight} #[fg=#abb1bb,bg=#232831,nobold,nounderscore,noitalics]#[fg=#232831,bg=#abb1bb] #(tmux-mem-cpu-load -i 1 -g 0 -a 1)  󰃭 %Y-%m-%d  󰥔 %H:%M:%S #[fg=#81a1c1,bg=#abb1bb,nobold,nounderscore,noitalics]#[fg=#232831,bg=#81a1c1,bold] 󰍹 #h "
setw -g window-status-format " #[default]#I:#W#F "
setw -g window-status-current-format "#[fg=#232831,bg=#abb1bb,bold]#I:#W#F "

# for prefix_highlight
set -g @prefix_highlight_prefix_prompt 'Wait'
set -g @prefix_highlight_copy_prompt 'Copy'
set -g @prefix_highlight_sync_prompt 'Sync'
set -g @prefix_highlight_fg '#232831,bold'
set -g @prefix_highlight_bg '#81a1c1'
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_copy_mode_attr 'fg=black,bg=yellow,bold'
set -g @prefix_highlight_show_sync_mode 'on'
set -g @prefix_highlight_sync_mode_attr 'fg=black,bg=green'
