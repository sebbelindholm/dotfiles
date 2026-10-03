# ~/.config/qutebrowser/config.py
import os
import theme

# Load settings changed via UI (:set) without overwriting manual configs
config.load_autoconfig(True)

# Apply Adwaita Dark + JetBrains Mono Nerd Font theme
theme.apply_theme(c)

# ==========================================
# Practical Daily Browsing Settings
# ==========================================
c.url.start_pages = ["https://google.com"]
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "dd": "https://duckduckgo.com/?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "gh": "https://github.com/search?q={}",
}

# Web Engine & Privacy Setup
c.content.autoplay = True
c.content.pdfjs = True
#c.content.cookies.accept = "no-unknown-3rdparty"
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.statusbar.show = "in-mode"
c.tabs.show = "multiple" # change to "switching" if only show briefly
c.content.javascript.clipboard = "access"

# ==========================================
# Password Managers (Bitwarden & Google)
# ==========================================
# 1. Google Password Manager:
#    Chromium's built-in password dialog works natively when prompted by web pages.

# ==========================================
# Fast Practical Keybindings
# ==========================================
# Quick navigation & tab management
config.bind("x", "tab-close")
config.bind("X", "undo")
config.bind("J", "back")
config.bind("K", "forward")
config.bind("H", "tab-prev")
config.bind("L", "tab-next")
config.bind("aa", "cmd-set-text -s :quickmark-add {url} {title}")
