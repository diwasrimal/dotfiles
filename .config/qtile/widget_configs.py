from subprocess import check_output
import re

battery_status = check_output(
        'upower -i `upower -e | grep BAT`',
        shell=True,
        text=True
        )

# Find the percentage
state = re.search(r'state:\s+(.+)\b', battery_status).groups(1)[0]
percentage = re.search(r'percentage:\s+(\d+)%' , battery_status).groups(1)[0]

# Assign a prefix
if int(percentage) < 10: 
    foreground = '#EB1D36'
    prefix = ' '    
elif int(percentage) < 30: 
    foreground = 'E94560'
    prefix = ' '
elif int(percentage) < 60:
    foreground = '#D2D79F'
    prefix = ' '
elif int(percentage) < 80: 
    foreground = "#90B77D"
    prefix = ' '
else: 
    foreground = "#019267"
    prefix = ' '

if state == "charging":
    prefix = ' ' + prefix

battery_config = dict(
        charge_char=prefix,
        discharge_char=prefix,
        format='{char} {percent:2.0%}',
        foreground=foreground,
        update_interval=1,
        )

