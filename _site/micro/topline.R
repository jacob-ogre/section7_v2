# BSD_2_clause

# if I had any sense I would drop this in a package...
topline <- function(data, select) {
  library(AdminLTE)
  shinyApp(
    ui = fluidPage(
      tags$head( tags$style(AdminLTE()) ),
      fluidRow(br()),
      fluidRow(
        column(4,
          valueBox(
            subtitle = "# consultations",
            value = textOutput("n_cons"),
            color = "navy",
            icon = NULL,
            width = NULL
          )
        ),
        column(4,
          valueBox(
            subtitle = "# formal consultations",
            value = textOutput("n_form"),
            color = "orange",
            icon = NULL,
            width = NULL
          )
        ),
        column(4,
          # shiny::icon("arrow-circle-left", "fa-3x"),
          htmlOutput("n_consult_phrase")
        )
      ),
      fluidRow(hr()),
      fluidRow(
        column(4,
          htmlOutput("T_consult_phrase")
        ),
        column(4,
          valueBox(
            subtitle = "Consultation duration (median)",
            value = textOutput("time_all"),
            color = "navy",
            icon = NULL,
            width = NULL
          )
        ),
        column(4,
          valueBox(
            subtitle = "Formal consultation duration",
            value = textOutput("time_formal"),
            color = "orange",
            icon = NULL,
            width = NULL
          )
        )
      ),
      fluidRow(br())
    ),

    server = function(input, output, session) {
      cons <- table(data$formal_consult)
      all_time <- median(data$elapsed, na.rm = TRUE)
      form_time <- median(
        filter(data, formal_consult == "Yes")$elapsed,
        na.rm = TRUE
      )
      output$n_cons <- renderText({ sum(cons) })

      output$n_form <- renderText({ cons[["Yes"]] })

      output$time_all <- renderText({ paste(all_time, "days") })

      output$time_formal <- renderText({ paste(form_time, "days") })

      output$n_consult_phrase <- renderUI({
        if(!select) {
          tags$blockquote("The number of consultations - total and formal only -
            performed by FWS since January, 2015.")
        } else {
          p("The number of consultations - total and formal only - in the
            current selection."
          )
        }
      })

      output$T_consult_phrase <- renderUI({
        if(!select) {
          tags$blockquote("The median duration of consultations performed by FWS
            since January, 2015.")
        } else {
          p("The duration of consultations - total and formal only - in the
            current selection."
          )
        }
      })

    }
  )
}
