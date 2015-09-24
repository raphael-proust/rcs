/* quark configuration */

static const char *servername = "127.0.0.1";
static const char *serverport = "80";
static const char *chrootdir  = ".";
static const char *docroot    = ".";
static const char *docindex   = "index.html";
static const char *user       = "nobody";
static const char *group      = "nobody";
static const char *cgi_dir    = ".";
static const char *cgi_script = "/werc.rc";
static int cgi_mode           = 0;
static int allowdirlist       = 0;

static const MimeType servermimes[] = {
	{ "html", "text/html; charset=UTF-8" },
	{ "htm",  "text/html; charset=UTF-8" },
	{ "css",  "text/css" },
	{ "c",    "text/plain" },
	{ "h",    "text/plain" },
	{ "go",   "text/plain" },
	{ "sh",   "text/plain" },
	{ "log",  "text/plain" },
	{ "txt",  "text/plain" },
	{ "md",   "text/plain" },
	{ "pdc",   "text/plain" },
	{ "png",  "image/png" },
	{ "gif",  "image/gif" },
	{ "jpeg", "image/jpeg" },
	{ "jpg",  "image/jpeg" },
	{ "webp", "image/webp" },
	{ "xml",  "application/xml" },
	{ "js",   "application/javascript" },
	{ "bz2",  "application/x-bzip2" },
	{ "gz",   "application/x-gzip" },
	{ "xz",   "application/x-xz" },
	{ "tgz",  "application/x-gtar" },
	{ "pdf",  "application/x-pdf" },
	{ "tar",  "application/x-tar" },
	{ "zip",  "application/zip" },
	{ "iso",  "application/x-iso9660-image" },
	{ "ogx",  "application/ogg" },
	{ "flac", "audio/flac" },
	{ "mp3",  "audio/mp3" },
	{ "oga",  "audio/ogg" },
	{ "ogg",  "audio/ogg" },
	{ "avi",  "video/x-msvideo" },
	{ "mp4",  "video/mp4" },
	{ "ogv",  "video/ogg" },
	{ "webm", "video/webm" }
};
