import catppuccin

config.load_autoconfig()

catppuccin.setup(c, 'mocha', True)

c.editor.command = ["kitty", "-e", "mvim", "{file}"]
c.qt.args = ["enable-features=WebRTCPipeWireCapturer","ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so", "enable-features=WebContentsForceDark"]
c.tabs.show = "multiple"
c.tabs.position = "top"
c.fonts.default_family = "JetbrainsMono Nerd Font"
c.fonts.default_size = "14pt"
c.tabs.show = "multiple"
c.confirm_quit = ["downloads"]

config.bind("J", "back")
config.bind("K", "forward")
config.bind("H", "tab-prev")
config.bind("L", "tab-next")

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
}

c.url.start_pages = [ "https://google.com" ]

c.colors.webpage.preferred_color_scheme = "dark"
