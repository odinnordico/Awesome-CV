.PHONY: release

CC = xelatex
RELEASES_DIR = release
RESUME_DIR = resume
CV_DIR = cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

release: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(RELEASES_DIR) $<

cv.pdf: cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(RELEASES_DIR) $<

coverletter.pdf: coverletter.tex
	$(CC) -output-directory=$(RELEASES_DIR) $<

clean:
	rm -rf $(RELEASES_DIR)/*.pdf
