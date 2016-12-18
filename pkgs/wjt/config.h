/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar           = 1;    /* -b:  whether bar is at top or bottom of screen */
static int min              = 0;    /* -l:  lower bound */
static int max              = 100;  /* -u:  upper bound */
static int initval          = 0;    /* -x:  initial value */
static int labelval         = 1;    /* -lv: whether to display value label */
static int labelexts        = 1;    /* -le: whether to display extent labels */
static int step             = 1;    /* -s:  minimum adjustment */
static int jump             = 10;   /* -j:  large adjustment */
static const char *prompt   = NULL; /* -p:  prompt to the left of slider */
static const char *special  = NULL; /* -z:  special text */
static const char *fonts[]  = {     /* -f:  font set */
	"Source Code Pro:pixelsize=10:antialias=true:autohint=true"
};

static const char *colors[SchemeLast][2] = {
	/*                 fg         bg */
	[SchemePrompt] = { "#268bd2", "#eee8d5" },
	[SchemeSlider] = { "#268bd2", "#eee8d5" }, /* fg: extent labels, bg: slider beyond value */
	[SchemeValue]  = { "#073642", "#657b83" }, /* fg: value label, bg: slider up to value */
};
