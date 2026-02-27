# Logisim Configuration file
# Here is default values
# You can override these values

# Port for the web interface (default 5800)
LOGISIM_PORT ?= 5800

# Port for VNC (default 5900)
LOGISIM_VNC_PORT ?= 5900

# Local directory to be mounted as the workspace in the container (default ./workspace)
LOGISIM_VOLUME ?= ./workspace

DISPLAY_WIDTH ?= 1920
DISPLAY_HEIGHT ?= 1080
