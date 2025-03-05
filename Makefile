# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = _build
BUILDDIRBOOK  = _build/booktheme
PUBLISHDIR	  = Publish
SHRPTBUILDDIR=$(PUBLISHDIR)/docs-aspx
SHRPTBUILDDIR2=$(PUBLISHDIR)/docs-html
SHRPTBUILDDIR3=$(PUBLISHDIR)/docs-pdf
SUB_WIKI=Wiki_TopicTemplate

# List all the directory you don't want to publish here
TEMP_DIRS=$(SHRPTBUILDDIR)/html/$(SUB_WIKI)/_Logs_Journal \
               $(SHRPTBUILDDIR2)/html/$(SUB_WIKI)/_Logs_Journal \
			   $(SHRPTBUILDDIR)/doctrees/$(SUB_WIKI)/_Logs_Journal \
			   $(SHRPTBUILDDIR2)/doctrees/$(SUB_WIKI)/_Logs_Journal \
               $(SHRPTBUILDDIR)/html/_sources \
               $(SHRPTBUILDDIR2)/html/_sources 

SLIDE_DIR	  = $(BUILDDIR)/slides
# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

livehtml:
	sphinx-autobuild --port 8002 "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

booktheme-livedoc:
	sphinx-autobuild --port 8001 -D html_theme='sphinx_book_theme' "$(SOURCEDIR)" "$(BUILDDIRBOOK)" $(SPHINXOPTS) $(O)

livehtml-personal:
	sphinx-autobuild --port 8003 -t personal -D exclude_patterns='_build,build' "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

publish: post_build_cleanup
	@echo "done creating publish documents"

sharepoint-build: Makefile 
	@$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(SHRPTBUILDDIR)" $(SPHINXOPTS) $(O) -D html_file_suffix=".aspx"
	@$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(SHRPTBUILDDIR2)" $(SPHINXOPTS) $(O)
	# @$(SPHINXBUILD) -M pdf "$(SOURCEDIR)" "$(SHRPTBUILDDIR3)" $(SPHINXOPTS) $(O)

post_build_cleanup: sharepoint-build
	for dir in $(TEMP_DIRS) ; do \
		rm -rf $$dir ; \
	done

publish-clean: Makefile 
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(SHRPTBUILDDIR)" $(SPHINXOPTS) $(O)
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(SHRPTBUILDDIR2)" $(SPHINXOPTS) $(O)
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(SHRPTBUILDDIR3)" $(SPHINXOPTS) $(O)
