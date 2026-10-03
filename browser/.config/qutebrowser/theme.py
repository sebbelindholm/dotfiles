# ~/.config/qutebrowser/theme.py

# ==========================================
# Adwaita Dark Palette Definitions
# ==========================================
bg_dark      = "#1e1e1e"  # Window background
bg_surface   = "#242424"  # Headerbar & panel background
bg_overlay   = "#303030"  # Popups & hover states
bg_active    = "#3d3d3d"  # Active tab / item selection
fg_main      = "#ffffff"  # Main text
fg_dim       = "#9a9996"  # Secondary muted text
accent       = "#3584e4"  # Adwaita Blue
accent_fg    = "#ffffff"
border_col   = "#303030"

color_error  = "#e01b24"  # Red
color_warn   = "#ffbe6f"  # Orange
color_success= "#2ec27e"  # Green

def apply_theme(c):
    # ==========================================
    # Typography
    # ==========================================
    font_family = "'JetBrains Mono Nerd Font', 'JetBrains Mono', monospace"
    c.fonts.default_family = font_family
    c.fonts.default_size = "10pt"

    c.fonts.completion.category = f"bold 10pt {font_family}"
    c.fonts.completion.entry = f"10pt {font_family}"
    c.fonts.debug_console = f"10pt {font_family}"
    c.fonts.downloads = f"10pt {font_family}"
    c.fonts.keyhint = f"10pt {font_family}"
    c.fonts.messages.error = f"10pt {font_family}"
    c.fonts.messages.info = f"10pt {font_family}"
    c.fonts.messages.warning = f"10pt {font_family}"
    c.fonts.prompts = f"10pt {font_family}"
    c.fonts.statusbar = f"10pt {font_family}"
    c.fonts.tabs.unselected = f"10pt {font_family}"
    c.fonts.tabs.selected = f"bold 10pt {font_family}"
    c.fonts.hints = f"bold 9pt {font_family}"

    # ==========================================
    # Statusbar
    # ==========================================
    c.statusbar.padding = {"top": 4, "bottom": 4, "left": 8, "right": 8}
    c.statusbar.widgets = ["keypress", "url", "scroll", "history", "tabs", "progress"]

    c.colors.statusbar.normal.bg = bg_surface
    c.colors.statusbar.normal.fg = fg_main
    c.colors.statusbar.insert.bg = color_success
    c.colors.statusbar.insert.fg = bg_dark
    c.colors.statusbar.passthrough.bg = accent
    c.colors.statusbar.passthrough.fg = accent_fg
    c.colors.statusbar.command.bg = bg_surface
    c.colors.statusbar.command.fg = fg_main
    c.colors.statusbar.caret.bg = "#c061cb"
    c.colors.statusbar.caret.fg = fg_main

    c.colors.statusbar.url.fg = fg_dim
    c.colors.statusbar.url.error.fg = color_error
    c.colors.statusbar.url.hover.fg = accent
    c.colors.statusbar.url.success.http.fg = fg_main
    c.colors.statusbar.url.success.https.fg = color_success
    c.colors.statusbar.url.warn.fg = color_warn

    # ==========================================
    # Tab Bar & Audio/Media Icons
    # ==========================================
    c.tabs.position = "top"
    c.tabs.padding = {"top": 5, "bottom": 5, "left": 10, "right": 10}
    c.tabs.indicator.width = 0  # Clean, flat borderless tabs

    # Clean Nerd Font symbols for pinned tabs and audio indicators
    c.tabs.title.format = "{audio}{index}: {current_title}"
    c.tabs.title.format_pinned = "󰐃 {index}"

    c.colors.tabs.bar.bg = bg_dark
    c.colors.tabs.even.bg = bg_dark
    c.colors.tabs.odd.bg = bg_dark
    c.colors.tabs.even.fg = fg_dim
    c.colors.tabs.odd.fg = fg_dim

    c.colors.tabs.selected.even.bg = bg_surface
    c.colors.tabs.selected.odd.bg = bg_surface
    c.colors.tabs.selected.even.fg = fg_main
    c.colors.tabs.selected.odd.fg = fg_main

    c.colors.tabs.pinned.even.bg = bg_dark
    c.colors.tabs.pinned.odd.bg = bg_dark
    c.colors.tabs.pinned.even.fg = fg_dim
    c.colors.tabs.pinned.odd.fg = fg_dim

    c.colors.tabs.pinned.selected.even.bg = bg_surface
    c.colors.tabs.pinned.selected.odd.bg = bg_surface
    c.colors.tabs.pinned.selected.even.fg = accent
    c.colors.tabs.pinned.selected.odd.fg = accent

    # ==========================================
    # Completion Menu
    # ==========================================
    c.colors.completion.category.bg = bg_dark
    c.colors.completion.category.fg = accent
    c.colors.completion.category.border.top = border_col
    c.colors.completion.category.border.bottom = border_col

    c.colors.completion.even.bg = bg_surface
    c.colors.completion.odd.bg = bg_dark
    c.colors.completion.fg = fg_main

    c.colors.completion.item.selected.bg = accent
    c.colors.completion.item.selected.fg = accent_fg
    c.colors.completion.item.selected.match.fg = color_warn
    c.colors.completion.match.fg = color_warn
    c.colors.completion.scrollbar.bg = bg_dark
    c.colors.completion.scrollbar.fg = bg_overlay

    # ==========================================
    # Link Hints & Prompts
    # ==========================================
    c.colors.hints.bg = accent
    c.colors.hints.fg = accent_fg
    c.colors.hints.match.fg = color_warn
    c.hints.border = "1px solid " + bg_dark
    c.hints.radius = 3
    c.hints.padding = {"top": 2, "bottom": 2, "left": 4, "right": 4}

    c.colors.prompts.bg = bg_surface
    c.colors.prompts.border = "1px solid " + border_col
    c.colors.prompts.fg = fg_main
