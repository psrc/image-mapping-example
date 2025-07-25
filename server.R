shinyServer(function(input, output, session) {
  
  output$overview_what_text <- renderUI({HTML(page_information(tbl=page_text, page_name="Main", page_section = "Overview-What", page_info = "description"))})
  
  output$overview_why_text <- renderUI({HTML(page_information(tbl=page_text, page_name="Main", page_section = "Overview-Why", page_info = "description"))})
  
  output$rtp_insights_text <- renderUI({HTML(page_information(tbl=page_text, page_name="Main", page_section = "Overview-Insights", page_info = "description"))})
  
  observeEvent(input$dark_mode, {
    new_theme <- if (input$dark_mode) psrc_theme_dark else psrc_theme_light
    session$setCurrentTheme(new_theme)
  })
  
})