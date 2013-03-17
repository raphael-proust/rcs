
all: index.html projects.html

%.html: %.pdc
	pandoc --standalone -o $@ $<

