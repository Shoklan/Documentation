library(shiny)

# Site snippets
sidebarSnippet <- sidebarPanel(
  #Species selection
  checkboxGroupInput("species","Select the species to plot:",
                     levels(iris$Species),
                     selected= levels(iris$Species)),
  selectInput("xvar","Select the variable on the horizontal axis",names(iris)[1:4]),
  selectInput("yvar","Select the variable on the vertical axis",names(iris)[1:4]))

# mainPanel
mainPanelSnippet <- #The plot created in server.R is displayed
  mainPanel(
    plotOutput("custom.plot")
  )

# Starting line
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Reactive parameters in the application"),
  
  # Sidebar
  sidebarLayout(sidebarSnippet, mainPanelSnippet)
))