# tmux settings
# http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/tmux.1#x4f5054494f4e53

# ----------------------------------------------------------------------
# | General Settings                                                   |
# ----------------------------------------------------------------------

# Make window index start at 1
set -g base-index 1

# Make pane index start at 1
setw -g pane-base-index 1

# Remove delay when sending commands
# (default is 500 milliseconds)
set -sg escape-time 1


# ----------------------------------------------------------------------
# | Key Mappings                                                       |
# ----------------------------------------------------------------------

# Change the key combination for the PREFIX key to `ctrl-a`
set -g prefix C-a
unbind-key C-b

# Make tmux send the PREFIX to an application running
# within tmux simply by pressing PREFIX key twice
bind C-a send-prefix

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use vim keybindings in copy mode
setw -g mode-keys vi

# Remap the copy & paste keys to work as in vim
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind-key -T copy-mode-vi "v" send-keys -X begin-selection
bind-key -T copy-mode-vi "y" send-keys -X copy-selection

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# [ PREFIX + - ] Split window horizontally
bind - split-window -v

# [ PREFIX + | ] Split window vertically
bind | split-window -h

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# [ PREFIX + h/j/k/l ] Move from pane to pane
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# [ PREFIX + H/J/K/L ] Resize pane
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# [ PREFIX + r ] Reload tmux config
bind r source-file ~/.tmux.conf \; display "tmux configs reloaded"


# ----------------------------------------------------------------------
# | Status bar                                                         |
# ----------------------------------------------------------------------

# Notified when something happens in one of the other windows
setw -g monitor-activity on
set -g visual-activity on

# Periodically refresh the status bar
set -g status-interval 60

# Customize what is displayed
set -g status-justify left
set -g status-left-length 50
set -g status-left " #S / "
#                     ‚îî‚îÄ current session name
set -g status-right " %R "
#                     ‚îî‚îÄ current time

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Default colors
set -g status-bg green
set -g status-fg black

# Colors for window list
setw -g window-status-fg black
setw -g window-status-bg green
setw -g window-status-attr dim

# Colors for active window
setw -g window-status-current-fg black
setw -g window-status-current-bg yellow
setw -g window-status-current-attr dim


# ----------------------------------------------------------------------
# | Visual Styling                                                     |
# ----------------------------------------------------------------------

# Display things in 256 colors
set -g default-terminal "screen-256color"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Command Line
set -g message-fg black
set -g message-bg green
set -g message-attr dim

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Pane divider
set -g pane-active-border-bg default
set -g pane-active-border-fg green
set -g pane-border-bg default
set -g pane-border-fg colour244
