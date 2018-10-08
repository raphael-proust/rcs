#define HEADER_MAX 4096
#define FIELD_MAX  200

/* mime-types */
static const struct {
	char *ext;
	char *type;
} mimes[] = {
	{ "xml",   "application/xml" },
	{ "xhtml", "application/xhtml+xml" },
	{ "html",  "text/html; charset=UTF-8" },
	{ "htm",   "text/html; charset=UTF-8" },
	{ "css",   "text/css" },
	{ "txt",   "text/plain" },
	{ "md",    "text/plain" },
	{ "c",     "text/plain" },
	{ "h",     "text/plain" },
	{ "gz",    "application/x-gtar" },
	{ "tar",   "application/tar" },
	{ "pdf",   "application/x-pdf" },
	{ "png",   "image/png" },
	{ "gif",   "image/gif" },
	{ "jpeg",  "image/jpg" },
	{ "jpg",   "image/jpg" },
	{ "iso",   "application/x-iso9660-image" },
	{ "webp",  "image/webp" },
	{ "svg",   "image/svg+xml" },
	{ "flac",  "audio/flac" },
	{ "mp3",   "audio/mpeg" },
	{ "ogg",   "audio/ogg" },
	{ "mp4",   "video/mp4" },
	{ "ogv",   "video/ogg" },
	{ "webm",  "video/webm" },
};
