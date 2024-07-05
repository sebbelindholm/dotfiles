#!/bin/bash

location="$HOME/.config/dconf/dconf-settings.ini"

dconf dump / > "$location" 
