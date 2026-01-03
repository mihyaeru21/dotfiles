#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: dayfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/dayfox/dayfox.tmux
set -g mode-style "fg=#e4dcd4,bg=#643f61"
set -g message-style "fg=#e4dcd4,bg=#643f61"
set -g message-command-style "fg=#e4dcd4,bg=#643f61"
set -g pane-border-style "fg=#643f61"
set -g pane-active-border-style "fg=#2848a9"
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#643f61,bg=#e4dcd4"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
setw -g window-status-activity-style "underscore,fg=#824d5b,bg=#e4dcd4"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#824d5b,bg=#e4dcd4"

# 以下は書き換え済み
set -g status-left "#[fg=#e4dcd4,bg=#2848a9,bold]  #S #[fg=#2848a9,bg=#e4dcd4,nobold,nounderscore,noitalics] "
set -g status-right "#[fg=#e4dcd4,bg=#e4dcd4,nobold,nounderscore,noitalics]#[fg=#2848a9,bg=#e4dcd4] #{prefix_highlight} #[fg=#643f61,bg=#e4dcd4,nobold,nounderscore,noitalics]#[fg=#e4dcd4,bg=#643f61] #(tmux-mem-cpu-load -i 1 -g 0 -a 1)  󰃭 %Y-%m-%d  󰥔 %H:%M:%S #[fg=#2848a9,bg=#643f61,nobold,nounderscore,noitalics]#[fg=#e4dcd4,bg=#2848a9,bold] 󰍹 #h "
setw -g window-status-format "#[default]#I:#W#F "
setw -g window-status-current-format "#[fg=#e4dcd4,bg=#643f61,bold]#I:#W#F "

# for prefix_highlight
set -g @prefix_highlight_prefix_prompt 'Wait'
set -g @prefix_highlight_copy_prompt 'Copy'
set -g @prefix_highlight_sync_prompt 'Sync'
set -g @prefix_highlight_fg '#e4dcd4,bold'
set -g @prefix_highlight_bg '#2848a9'
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_copy_mode_attr 'fg=white,bg=yellow,bold'
set -g @prefix_highlight_show_sync_mode 'on'
set -g @prefix_highlight_sync_mode_attr 'fg=white,bg=green'
