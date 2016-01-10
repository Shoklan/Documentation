
# The original code from the example text is at the bottom;
# I hate the format and it makes reading it impossible.
# So, I'm considering this my test if I understand what's going on.

library(shiny)

# Webpage Section functions
sidebarSnippet <- sidebarPanel(
  #Species selection
  selectInput("species","Select a species:",
              c("setosa", "versicolor", "virginica"))
)
# main panel for output.
mainPanelSnippet <- tabsetPanel(
  tabPanel("Summaries",tableOutput("table")),
  tabPanel("Graphics",plotOutput("plot"))
)


# Load main
shinyUI(fluidPage(
  # Application title
  titlePanel("Tabset Example"),
  
  # Sidebar
  sidebarLayout(
    sidebarSnippet,
    
    #The plot created in server.R is displayed
    mainPanel(mainPanelSnippet)
  )
))


#library(shiny)
#
# Starting line
#shinyUI(fluidPage(
#  
#  # Application title
#  titlePanel("Tabset Example"),
#  
#  # Sidebar
#  sidebarLayout(
#    sidebarPanel(
#Species selection
#      selectInput("species","Select a species:",
#                  c("setosa", "versicolor", "virginica"))),
#    
#    #The plot created in server.R is displayed
#    mainPanel(
#      tabsetPanel(
#        tabPanel("Summaries",tableOutput("table")),
#        tabPanel("Graphics",plotOutput("plot"))
#      ))
#    
#  )
#))