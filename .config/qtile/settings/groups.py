from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys

groups = [Group(i) for i in [
    "   ", " 󰨞  ", "   ", " 󰉋  ", " 󰆼  ", " 󰡨  ", "   "]]

for i, group in enumerate(groups):
    current_key = str(i + 1)
    keys.extend([

#CHANGE WORKSPACES
        Key([mod], current_key, lazy.group[group.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key([mod, "shift" ], "Tab", lazy.screen.prev_group()),

# MOVE WINDOW TO SELECTED WORKSPACE AND STAY ON WORKSPACE
        #Key([mod, "shift"], current_key, lazy.window.togroup(group.name)),
# MOVE WINDOW TO SELECTED WORKSPACE AND FOLLOW MOVED WINDOW TO WORKSPACE
        Key([mod, "shift"], current_key, lazy.window.togroup(group.name) , lazy.group[group.name].toscreen()),
    ])