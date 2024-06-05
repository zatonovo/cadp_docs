#!/bin/bash
Rscript --vanilla -e 'library(bookdown);render_book("index.Rmd", "bookdown::gitbook")'
