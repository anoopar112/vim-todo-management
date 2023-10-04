#!/usr/bin/python3

import argparse
parser=argparse.ArgumentParser()
parser.add_argument("-s",help="status of the pomodoro 0-not started,1-running,2-paused,3-end")

args=parser.parse_args()

status_file = "/tmp/pm_status.txt"

def setStatus():
    with open(status_file, 'w') as f:
        f.write(args.s)

setStatus()
