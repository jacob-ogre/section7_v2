# BSD_2_clause

source("pages/home_page.R")
# source("pages/data_page.R")

shinyUI(
  navbarPage(
    tags$head( tags$style(AdminLTE()) ),
    # title = "Section 7 Explorer",
    tabPanel(
      "Home",
      home_page
    ),
    # tabPanel(
    #   "Data",
    #   data_page
    # ),
    inverse=FALSE,
    position="fixed-top"
  )
)

