# eztop

`top`, but it only shows what matters: CPU, RAM, disk, and which apps are using them.

Run it anywhere, no install:

    curl -fsSL https://raw.githubusercontent.com/theowiik/eztop/main/eztop | python3 -

Or from a checkout:

    ./eztop          # q to quit
    ./eztop --once   # print one snapshot
    ./eztop -n 5     # update every 5 seconds

Linux only. Needs Python 3 and nothing else.

Press `a` or click the button at the bottom for advanced mode: every process,
per-core load, and sorting with `c` (CPU) or `m` (memory).
