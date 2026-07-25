config.load_autoconfig()

# -----------------------------
# Keybindings
# -----------------------------

config.bind("J", "tab-prev")
config.bind("K", "tab-next")

config.bind("xx", "tab-close")
config.bind("tt", "cmd-set-text -s :open")

config.unbind("d")

config.bind(",p", "spawn --userscript view-pdf")

# -----------------------------
# Downloads
# -----------------------------

c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt = True
c.downloads.position = "bottom"

# -----------------------------
# Editor
# -----------------------------

c.editor.command = ["nvim", "{}"]

# -----------------------------
# Behaviour
# -----------------------------

#c.auto_save.session = True
#c.session.lazy_restore = True

c.tabs.background = True
c.scrolling.smooth = False
c.completion.shrink = True

c.confirm_quit = ["downloads"]      # don't ask unless downloading
c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"

# -----------------------------
# Privacy
# -----------------------------

c.content.autoplay = False
c.content.notifications.enabled = False

# -----------------------------
# Search
# -----------------------------

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://www.google.com/search?q={}",
    "w": "https://en.wikipedia.org/wiki/{}",
    "gh": "https://github.com/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
}

# -----------------------------
# Appearance
# -----------------------------

c.tabs.favicons.show = "always"
c.tabs.title.format = "{audio}{current_title}"
c.statusbar.show = "always"

# -----------------------------
# Theme
# -----------------------------

config.source("/home/avi/.config/themes/output/qutebrowser.py")

# -------------------------------

c.content.cookies.accept = "all"

with config.pattern("https://chatgpt.com/"):
    c.content.javascript.clipboard = "access-paste"
    c.content.desktop_capture = True

with config.pattern("https://auth.openai.com/"):
    c.content.cookies.accept = "all"
