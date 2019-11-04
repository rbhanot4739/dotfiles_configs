# This tmux statusbar config was created by tmuxline.vim
# on Fri, 25 Jan 2019

set -g status-justify "centre"
set -g status "on"
set -g status-attr "none"
set -g message-command-bg "colour240"
set -g status-left-length "100"
set -g pane-active-border-fg "colour33"
set -g status-bg "colour235"
set -g message-command-fg "colour234"
set -g pane-border-fg "colour240"
set -g message-bg "colour240"
set -g status-left-attr "none"
set -g status-right-attr "none"
set -g status-right-length "100"
set -g message-fg "colour234"
setw -g window-status-fg "colour245"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "colour235"
setw -g window-status-activity-attr "none"
setw -g window-status-activity-fg "colour33"
setw -g window-status-separator ""
setw -g window-status-bg "colour235"
set -g status-left "#[fg=colour234,bg=colour33] #S #[fg=colour33,bg=colour240,nobold,nounderscore,noitalics]#[fg=colour234,bg=colour240] #{?pane_synchronized,PANES-ARE-SYNCED,} #[fg=colour240,bg=colour235,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour245,bg=colour235] %a #[fg=colour240,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour234,bg=colour240] %R #[fg=colour245,bg=colour240,nobold,nounderscore,noitalics]#[fg=colour234,bg=colour245] #(date +%F) "
setw -g window-status-format "#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[default] #I #W #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=colour235,bg=colour240,nobold,nounderscore,noitalics]#[fg=colour234,bg=colour240] #I #W #[fg=colour240,bg=colour235,nobold,nounderscore,noitalics]"