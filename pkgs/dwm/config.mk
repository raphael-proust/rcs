# dwm version
VERSION = 6.0

# paths
PREFIX    = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/include/X11
X11LIB = /usr/lib/X11

# Xinerama
XINERAMALIBS  = -L${X11LIB} -lXinerama
XINERAMAFLAGS = -DXINERAMA

# includes and libs
INCS = -I. -I/usr/include -I${X11INC} -I/usr/include/freetype2
INCS += `pkg-config --cflags xft`

LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${XINERAMALIBS}
LIBS += `pkg-config --libs xft`

# flags
CPPFLAGS += -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   += -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS  += -s ${LIBS}

# compiler and linker
CC = cc
