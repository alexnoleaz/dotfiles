
from libqtile import hook
from libqtile import qtile

from settings.keys import mod, keys
from settings.groups import groups
from settings.layouts import layouts, floating_layout
from settings.widgets import widget_defaults, extension_defaults
from settings.screens import screens
from settings.mouse import mouse
from settings.path import qtile_path

from os import path
import subprocess

@hook.subscribe.client_new
def new_client(window):
    if window.name == 'ArchLinux Logout':
        qtile.hide_show_bar()

@hook.subscribe.client_killed
def logout_killed(window):
    if window.name == 'ArchLinux Logout':
        qtile.hide_show_bar()

@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, 'autostart.sh')])

main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = 'smart' # smart or focus
wmname = 'Qtile'
