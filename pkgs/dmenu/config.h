/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Source Code Pro:pixelsize=10:antialias=true:autohint=true",
};
static const char *prompt      = NULL;      /* -p  option; prompt to the elft of input field */
static const char *normbgcolor = "#eee8d5"; /* -nb option; normal background                 */
static const char *normfgcolor = "#268bd2"; /* -nf option; normal foreground                 */
static const char *selbgcolor  = "#fdf6e3"; /* -sb option; selected background               */
static const char *selfgcolor  = "#657b83"; /* -sf option; selected foreground               */
static const char *outbgcolor  = "#00ffff";
static const char *outfgcolor  = "#000000";
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
