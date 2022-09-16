from libqtile import widget
from subprocess import check_output

result = check_output(
        "cat /sys/class/net/wlan0/carrier",
        shell=True,
        text=True,
        )

print(result)
print(type(result))
