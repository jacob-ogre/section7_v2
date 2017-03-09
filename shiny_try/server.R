# BSD_2_clause

shinyServer(function(input, output, session) {
  cons <- table(dat$formal_consult)
  all_time <- median(dat$elapsed, na.rm = TRUE)
  form_time <- median(
    filter(dat, formal_consult == "Yes")$elapsed,
    na.rm = TRUE
  )
  output$n_cons <- renderText({ sum(cons) })

  output$n_form <- renderText({ cons[["Yes"]] })
                
  output$time_all <- renderText({ paste(all_time, "days") })

  output$time_formal <- renderText({ paste(form_time, "days") })

})
