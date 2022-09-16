from subprocess import check_output
import re

import colors

def battery():

    # battery_status = check_output( 'upower -i `upower -e | grep BAT`', shell=True, text=True)
    # state = re.search(r'state:\s+(.+)\b', battery_status).groups(1)[0]
    # percentage = re.search(r'percentage:\s+(\d+)%' , battery_status).groups(1)[0]

    # percentage: string
    percent = int(check_output(
        "upower -i `upower -e | grep BAT` | grep percentage | awk '{print $2}'",
        shell=True,
        text=True,
    ).strip()[:-1])

    if __name__ == "__main__":
        print(f"Battery percentage: {percent}")

    if percent < 10: return {'foreground': '#EB1D36',           'icon': ' '}
    if percent < 30: return {'foreground': colors.pink,         'icon': ' '}
    if percent < 60: return {'foreground': colors.maybe_green,  'icon': ' '}
    if percent < 85: return {'foreground': '#90B77D',           'icon': ' '}
    return {'foreground': '#019267', 'icon': ' '}


if __name__ == "__main__":
    config = battery()
    print(config)
