#define TAB 8
#define TNAME "st-256color"
#define FONT "monospace:antialias=true:autohint=true"
#define BORDER 2
#define SHELL "/bin/sh"

/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
	"black",
	"red3",
	"green3",
	"yellow3",
	"blue2",
	"magenta3",
	"cyan3",
	"gray90",
	"gray50",
	"red",
	"green",
	"yellow",
	"#5c5cff",
	"magenta",
	"cyan",
	"white",
	[255] = 0,
	/* more colors can be added after 255 to use with DefaultXX */
	"#f3f0f0",
	"#000300",
	"#aa4444",
	"#333333",
};

/* Default colors (colorname index)
   foreground, background, cursor, unfocused cursor */
#define DefaultFG  256
#define DefaultBG  257
#define DefaultCS  258
#define DefaultUCS 259

/* Special keys (change & recompile st.info accordingly)
   Keep in mind that kpress() in st.c hardcodes some keys.

   Mask value:
   * Use XK_ANY_MOD to match the key no matter modifiers state
   * Use XK_NO_MOD to match the key alone (no modifiers)

      key,        mask,  output */
static Key key[] = {
	{ XK_BackSpace, XK_NO_MOD, "\177" },
	{ XK_Insert,    XK_NO_MOD, "\033[2~" },
	{ XK_Delete,    XK_NO_MOD, "\033[3~" },
	{ XK_Home,      XK_NO_MOD, "\033[1~" },
	{ XK_End,       XK_NO_MOD, "\033[4~" },
	{ XK_Prior,     XK_NO_MOD, "\033[5~" },
	{ XK_Next,      XK_NO_MOD, "\033[6~" },
	{ XK_F1,        XK_NO_MOD, "\033OP"   },
	{ XK_F2,        XK_NO_MOD, "\033OQ"   },
	{ XK_F3,        XK_NO_MOD, "\033OR"   },
	{ XK_F4,        XK_NO_MOD, "\033OS"   },
	{ XK_F5,        XK_NO_MOD, "\033[15~" },
	{ XK_F6,        XK_NO_MOD, "\033[17~" },
	{ XK_F7,        XK_NO_MOD, "\033[18~" },
	{ XK_F8,        XK_NO_MOD, "\033[19~" },
	{ XK_F9,        XK_NO_MOD, "\033[20~" },
	{ XK_F10,       XK_NO_MOD, "\033[21~" },
	{ XK_F11,       XK_NO_MOD, "\033[23~" },
	{ XK_F12,       XK_NO_MOD, "\033[24~" },
};

/* Internal shortcuts. */
#define MODKEY Mod1Mask

static Shortcut shortcuts[] = {
	/* modifier		key		function	argument */
	{ MODKEY|ShiftMask,	XK_Prior,	xzoom,		{.i = +1} },
	{ MODKEY|ShiftMask,	XK_Next,	xzoom,		{.i = -1} },
};

/* double-click timeout (in milliseconds) between clicks for selection */
#define DOUBLECLICK_TIMEOUT 200
#define TRIPLECLICK_TIMEOUT (2*DOUBLECLICK_TIMEOUT)
