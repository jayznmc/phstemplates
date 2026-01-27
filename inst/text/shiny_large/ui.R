###############################################################################.
##  Dashboard template: Main UI script for the dashboard
###############################################################################.

############# CALL UI SCRIPTS ############################

source(file.path("ui", "00_intro_ui.R"), local = TRUE)$value
source(file.path("ui", "01_base_page_ui.R"), local = TRUE)$value
source(file.path("ui", "02_tabs_in_page_ui.R"), local = TRUE)$value
source(file.path("ui", "03a_first_page_ui.R"), local = TRUE)$value
source(file.path("ui", "03b_second_page_ui.R"), local = TRUE)$value
source(file.path("ui", "03c_bar_charts_page_ui.R"), local = TRUE)$value
source(file.path("ui", "downloadable_reports_ui.R"), local = TRUE)$value
source(file.path("ui", "data_download_ui.R"), local = TRUE)$value


###########INCLUDE NEXT LINE FOR PASSWORD AUTHORISATION#########################
# ui <- fluidPage(
################################################################################
  tagList(
    tags$html(lang = "en"), # Set the language of the page - important for accessibility
    # Specify most recent fontawesome library - change version as needed
    tags$style(
      "@import url(https://use.fontawesome.com/releases/v6.6.0/css/all.css);"
    ),
    navbarPage(
      id = "intabset", # id used for jumping between tabs
      title = div(
        tags$a(
          img(
            src = "phs-logo-white.png",
            height = 40,
            alt = "Go to Public Health Scotland (external site)"
          ),
          href = "https://www.publichealthscotland.scot/",
          target = "_blank"
        ), # PHS logo links to PHS website
        style = "position: relative; top: -10px;"
      ),
      windowTitle = "PHS Dashboard Template", # Title for browser tab
      header = tags$head(
        includeCSS("www/styles.css"), # CSS stylesheet
        tags$link(rel = "shortcut icon", href = "favicon_phs.ico") # Icon for browser tab
      ),
      #' All coding for the landing page is done within the 00_intro_ui.R script
      # Landing page
      intro_tab,

      #' For all other pages is is good practice to assign the tabpage title
      #' in tabPanel() or navbarMenu()
      # Single page
      tabPanel(title = "Base Page",
               base_page),

      # Single page with 2 tabs
      tabPanel(title = "Two Tabs",
               two_tabs_ui),

      # Dropdown menu for multiple pages
      navbarMenu(title = "Three Pages",
                 page_1,
                 #' tabPanel() can be used wihtin navbarMenu() to create a
                 #' page with multiple tabs
                 tabPanel("Two Tabs: Line Charts",
                          page_3_two_tabs_ui),

                 tabPanel("Two Tabs:Bar Charts",
                          page_3_bar_charts_ui)
      ),

      tabPanel(title = "Local Report",
               # This page is not numbered as it is always the 2nd last page
               #' (or last page if the "Data Download" page is not included)
               downloadable_reports_ui),

      tabPanel(title = "Data Download",
               # This page is not numbered as it is always the last page
               data_download_ui)

    ) # end navbar
  ) # end taglist

  ###########INCLUDE NEXT TWO LINES FOR PASSWORD AUTHORISATION####################
  # ) # end ui fluidpage
  # ui <- secure_app(ui, choose_language = TRUE)
  ################################################################################

# ----------------------------------------------
# Server

server <- function(input, output, session) {
  # Get functions
  source(file.path("functions/core_functions.R"), local = TRUE)$value
  source(file.path("functions/intro_page_functions.R"), local = TRUE)$value
  source(file.path("functions/page_1_functions.R"), local = TRUE)$value

  # Get content for individual pages
  source(file.path("pages/intro_page.R"), local = TRUE)$value
  source(file.path("pages/page_1.R"), local = TRUE)$value
  source(file.path("pages/contact_page.R"), local = TRUE)$value
}

# Run the application
shinyApp(ui = ui, server = server)

### END OF SCRIPT ###
