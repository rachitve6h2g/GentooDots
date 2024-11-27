import os
from urllib.request import urlopen

# load your autoconfig, use this, if the rest of your config is empty

config.load_autoconfig()
config.bind('<Ctrl+/>', 'spawn mpv {url}', mode='normal')
config.bind('<Ctrl+.>', 'spawn mpv --no-video {url}', mode='normal')

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'mocha', True)
