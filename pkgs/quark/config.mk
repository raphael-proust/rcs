# quark version
VERSION = 0.1

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

# flags
CPPFLAGS += -DVERSION=\"${VERSION}\" -D_POSIX_C_SOURCE=200809 -D_BSD_SOURCE
CFLAGS += -g -std=c99 -pedantic -Wall -O0 ${CPPFLAGS}
LDFLAGS += # -s

# compiler and linker
CC = cc
