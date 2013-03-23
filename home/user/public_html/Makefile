INFILES = $(shell find . -name "*.pdc")
OUTFILES = $(INFILES:.pdc=.html)

all: $(OUTFILES)

%.html: %.pdc
	pandoc --standalone -o $@ $<

clean:
	rm -f $(OUTFILES)
