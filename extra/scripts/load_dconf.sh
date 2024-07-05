#!/bin/bash

location="$HOME/.config/dconf/dconf-settings.ini"

dconf load / < "$location"
