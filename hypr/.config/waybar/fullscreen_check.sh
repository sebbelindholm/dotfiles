#!/bin/bash

hyprctl activewindow | grep -q "fullscreen: 1" && echo "Fullscreen"
