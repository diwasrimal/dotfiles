# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget
from libqtile.config import Click, Group, Key, Match, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal

from fonts import jet_bold, jet_regular
import mywidgets 
import colors
import keymaps

mod = "mod4"

# All keybindings and mouse actions
keys = keymaps.bindings
mouse = keymaps.mouse_actions

workspace_labels = {
    '1': ' ',
    '2': ' ',
    '3': ' ',
    '4': ' ',
    '5': ' ',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
}

groups = [Group(i) for i in workspace_labels.keys()]

for i in groups:
    # Uncomment this to use icons as labels
    # i.label = workspace_labels[i.name]
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        border_focus='56BBF1',
        border_normal='#4F4F4F',
        bborder_focus_stack=["#d75f5f", "#8f3d3d"],
        border_width=1),
    layout.Max(),
    layout.Floating(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font=jet_bold,
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


dot = widget.TextBox('', foreground='874356')

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(font=jet_regular),
                widget.GroupBox(
                    highlight_method='line',
                    highlight_color='383838',             # background of open workspace
                    block_highlight_text_color='4D77FF',  # Currently open workspace
                    active='D49B54',                      # All active workspaces
                    inactive='F7E2E2',
                    font=jet_regular,
                    ),
                widget.Prompt(),
                widget.Spacer(),
                # widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(),
                dot,
                widget.Backlight(
                    backlight_name='intel_backlight',  # Backlight driver name
                    brightness_file='brightness',     # File with current brightness (/sys/class/intel_backlight/brightness) for me
                    foreground='F3E0B5',
                    fmt=' {}',
                ),
                dot,
                widget.Volume(
                    foreground='#61A4BC',
                    fmt=' {}',
                    ),
                dot,

                widget.Battery(
                    battery         = 'BAT0',
                    update_interval = 1,
                    format          = '{char} {percent:2.0%}',
                    charge_char     = ' ' + mywidgets.battery()['icon'],
                    discharge_char  = mywidgets.battery()['icon'],
                    foreground      = mywidgets.battery()['foreground'],
                ),

                dot,
                widget.Clock(format="  %I:%M %p", foreground='#E38B29'),
                widget.Clock(format="%b %d,%a", foreground='#F1A661'),
                dot,
                widget.QuickExit(
                    default_text="   ",
                    foreground="#EB1D36",
                    countdown_format=' {}  ',
                ),
            ],
            24,
            # background='#472D2D'
            background = colors.nordy_black,    # Prefixing with transparency value
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
