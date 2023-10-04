#!/usr/bin/python3
import time
import subprocess
import sys
import os
import argparse
parser=argparse.ArgumentParser()
parser.add_argument("-f",help="Path of the todo folder")

args=parser.parse_args()

todo_file=args.f+"/todo.md"
doing_file=args.f+"/doing.md"

status_file = "/tmp/pm_status.txt"

def parseLine(line):
    if "@priority" in line:
        line = line.replace("@priority(high)","").replace("@priority(medium)","").replace("@priority(low)","")
    if "@started" in line:
        st_text_index = line.index("@started")
        st_index = line.index("(",st_text_index)
        ed_index = line.index(")",st_index)
        started_section = line[st_text_index:ed_index+1]
        timestring = line[st_index:ed_index].split("/")[0].replace("(","")
        line = line.replace(started_section,"").strip() + " @"+timestring.strip()
    
    line = line.strip()
    return line

def processLines(lines):
    row = ""
    for line in lines:
        if line.strip().startswith("»"):
            # newline = line.replace("»","")
            row = parseLine(line)
            row += "\n"
            break
    return row

def combinefiles():
    lines = []
    l1 = open(todo_file,'r').readlines()
    l2 = open(doing_file,'r').readlines()
    lines = l2 +l1
    return processLines(lines)

def getCurrentStatus():
    current_status = 0
    if os.path.isfile(status_file):
        current_status = open(status_file,'r').read()
    else:
        with open(status_file, 'w') as f:
            f.write("0")
    return current_status


    
def main():
    mins = 0
    sec = 0
    todo = combinefiles()
    currentdir = os.path.dirname(__file__) 
    if getCurrentStatus() == "0":
        sys.stdout.write(f"{mins}:{sec} {todo} \r")
        sys.stdout.flush()
    else:
        while mins != 25:
            sec = 0
            while sec != 59:
                time.sleep(1)
                if getCurrentStatus() == "1":
                    sec += 1
                    subprocess.call(["aplay", "-q",f"{currentdir}/Tick.wav"])
                elif getCurrentStatus() == "0":
                    break
                sys.stdout.write(f"{mins}:{sec} {todo}")
                sys.stdout.flush()
            # Increment the minute total
            if getCurrentStatus() == "1":
                mins += 1
            elif getCurrentStatus() == "0":
                break
        # Bring up the dialog box here
        subprocess.call(["aplay", "-q",f"{currentdir}/alarm.wav"])
        subprocess.call(["notify-send",f"Task {todo} stopped"])
main()
