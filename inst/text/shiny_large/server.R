####################### Server #######################
# Description: Main server script for the dashboard
# This script source individual server scripts to create the charts,
# tables and download files for each page/tab

function(input, output, session) {

  # Get functions
  source(file.path("functions/core_functions.R"), local = TRUE)$value
  source(file.path("functions/intro_page_functions.R"), local = TRUE)$value
  source(file.path("functions/page_1_functions.R"), local = TRUE)$value

  # Get content for individual pages
  source(file.path("pages/intro_page.R"), local = TRUE)$value
  source(file.path("pages/page_1.R"), local = TRUE)$value
  source(file.path("pages/contact_page.R"), local = TRUE)$value

}

