# BSD_2_clause

#' @import shiny methods
#' @export
topline <- function(data) {
  library(AdminLTE)
  shinyApp(
    ui = fluidPage(
      # theme = "AdminLTE.css",
      tags$head( tags$style(AdminLTE()) ),
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
    }
  )
}
