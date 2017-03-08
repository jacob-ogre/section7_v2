# BSD_2_clause

home_page <- {
  tabPanel(
      title="Home",
      div(class="graph-outer",
        tags$head(
          HTML("<link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400' rel='stylesheet' type='text/css'>"),
          includeCSS("www/custom.css")
        ),
        tags$style(type="text/css", "body {padding-top:30px;}"),
        fluidRow(
          column(2,
            h1("logo")
          ),
          column(8),
          column(2,
            h1("DOW")
          )
        ),
        fluidRow(
          column(1),
          column(2,
            absolutePanel(
              id="controls-graph", class="panel panel-default",
              fixed=TRUE, draggable=FALSE, top=110, left=40,
              right="auto", bottom="auto", width=230, height=NULL,
              tags$a(
                class = "list-group-item.active",
                "Basic numbers",
                href = "#basic_num"
              ),
              helpText("Note that the text accompanying the plots changes
                       depending on the data selection.")
            )
          ),
          column(7,
            fluidRow(
              h1("Section 7 Overview"),
              p("Section 7 of the U.S. Endangered Species Act (ESA) is often 
                considered the most important section of the law because of 
                its reach and prohibitions. Any federal agency whose actions 
                may affect ESA-listed species are required to consult with the 
                U.S. Fish and Wildlife Service (FWS) and/or the National 
                Marine Fisheries Service (NMFS) to ensure the action does not 
                jeopardize the species' existence or adversely modify or 
                destroy its critical habitat. A federal action could mean a 
                number of things, such as:"),
              tags$ul(
                tags$li(
                  p("issuing a permit to dredge or fill a wetland (a Clean 
                    Water Act 404 permit);"
                  )
                ),
                tags$li(
                  p("funding a highway project; or")
                ),
                tags$li(
                  p("carrying out an activity, such as prescribed burns on a
                    National Forest."
                  )
                )
              )
            ),
            tags$hr(),
            fluidRow(
              div(id = "basic_num",
                h2("Basic numbers"),
                p("Lede"),
                column(6,
                  valueBox(
                    subtitle = "# consultations",
                    value = textOutput("n_cons"),
                    color = "navy",
                    icon = NULL,
                    width = NULL
                  )
                ),
                column(6,
                  valueBox(
                    subtitle = "# formal consultations",
                    value = textOutput("n_form"),
                    color = "orange",
                    icon = NULL,
                    width = NULL
                  )
                ),
                column(6,
                  valueBox(
                    subtitle = "Consultation duration (median)",
                    value = textOutput("time_all"),
                    color = "navy",
                    icon = NULL,
                    width = NULL
                  )
                ),
                column(6,
                  valueBox(
                    subtitle = "Formal consultation duration",
                    value = textOutput("time_formal"),
                    color = "orange",
                    icon = NULL,
                    width = NULL
                  )
                )
              )
            )
          ),
          column(2)
        ),

        fluidRow(
          column(3),
          column(6,
                 p("placeholder")
                 # div(HTML(defenders_cc()), style=center_text)
          ),
          column(3)
        ),
        br(), br()
      )
    )
}
