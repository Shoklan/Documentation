library(shiny)

#initialization of server.R
shinyServer(function(input, output) {
  
  #Plot generation
  output$plot <- renderPlot({
    if(input$selectcolor){
      plot(1/1:input$number, col=input$color)
    } else {
      plot(1/1:input$number)
    }
  })
  
})