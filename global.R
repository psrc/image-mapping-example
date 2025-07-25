# Libraries ---------------------------------------------------------------
library(shiny)
library(bslib)
library(tidyverse)

# Files to source ---------------------------------------------------------
source("psrc_theme_light.R")
source("psrc_theme_dark.R")

# Useful Functions --------------------------------------------------------
page_information <- function(tbl, page_name, page_section=NULL, page_info) {
  
  if(is.null(page_section)) {
    
    t <- tbl |>
      filter(page == page_name) |>
      select(all_of(page_info)) |>
      pull()
    
  } else {
    
    t <- tbl |>
      filter(page == page_name & section == page_section) |>
      select(all_of(page_info)) |>
      pull()
    
  }
  
  
  if(is.na(t)) {f <- ""} else {f <- t}
  
  return(f)
  
}

# Inputs ------------------------------------------------------------------
psrc_mission <- "Our mission is to advance solutions to achieve a thriving, racially equitable, and sustainable central Puget Sound region through leadership, visionary planning, and collaboration."
page_text <- read_csv("page_text.csv", show_col_types = FALSE)
