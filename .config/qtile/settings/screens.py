from libqtile.config import Screen
from libqtile import bar
from .widgets import primary_widgets, secondary_widgets

status_bar = lambda widgets: bar.Bar(widgets, 24, opacity=0.92)

def init_screens():
    return [Screen(top=status_bar(primary_widgets)),
            Screen(top=status_bar(secondary_widgets))]

screens = init_screens()