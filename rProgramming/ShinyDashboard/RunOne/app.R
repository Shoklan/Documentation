#####
# TEMP STUFF
#######
setwd("C:\\Users\\mitcolli\\Documents\\Docs\\code\\LogParser")
source('libraries.R')
source('LogParser.R')

ROOT<- getwd()
path7za<- file.path( ROOT, '7za', '7za.exe')
completeDirectory<- file.path( ROOT, 'Completed')
projectsDirectory<- file.path( ROOT, 'Projects')



global<- reactiveValues( completed = seekCompleted(), projects = seekProjects(),
           tasks = c('Log File Errors', 'Unique AD Users'),
           taskTranslate = list( c('collectErrors()', 'printOutput(dataTable = Results)'), 'uniqueUsers'),
           taskNeedParse = c(TRUE, FALSE))

##########



# splitting up pieces for simplicity
header <- dashboardHeader(title = 'ppic')

# SIDEBAR
sidebar<- dashboardSidebar(
  sidebarMenu(
    menuItem('Potential Jobs', tabName = 'jobsPage', icon = icon('cloud-upload')),
    menuItem('Finished Jobs', tabName = 'finishedJobs', icon = icon('arrow-down')),
    tags$hr(),
    textInput('projectName', label = NULL, placeholder = 'Project Name'),
    fileInput('downloadFile', 'Upload Files:', accept = 'text/csv'),
    tags$hr(),
    actionButton('dataUpload', "Upload Data")
  )
)

#BODY
body   <- dashboardBody(
  tabItems(
    tabItem(
      tabName = 'jobsPage',
      div(h2("Select a Job Type:")),
      HTML('<div class="shiny-input-radiogroup" id="var">'),
      lapply(1:length(isolate(global$tasks)), function(i){
        HTML(paste0('<div class="shiny-html-output col-sm-6" id="job', i, '"></div>', collapse = ''))
      }),
      HTML('</div>')
    ),
    tabItem(
      tabName = 'finishedJobs',
      # prepare for REACTIVE context on the server
      lapply(1:length(isolate( global$completed )), function(i){
        HTML(paste0('<div class="shiny-html-output col-sm-6" id="completedJob', i, '"></div>', collapse = ''))
      }),
      verbatimTextOutput('checkVar'),
      tableOutput('contents')
    )
  )
)

# compile it all together
ui <- dashboardPage(
  header,
  sidebar,
  body
)

server <- function(input, output) {
  
  # Variables used for server elements
  global<- reactiveValues( completed = seekCompleted(), projects = seekProjects(), tasks = c('Log File Errors', 'Web UI Response Times', 'Unique AD Users'))
  
  
  #output$contents <- renderTable({
  #   inFile = input$downloadFile
     
  #   if( is.null( inFile )) return( NULL )
  #   else{
  #     file.copy(inFile$datapath, file.path('C:', 'Users', 'mitcolli', 'Downloads', 'target', paste0('herp', '.csv' )))
  #     setwd(file.path( 'C:', 'Users', 'mitcolli', 'Downloads', 'target' ))
  #     data<-fread(paste0('herp', '.csv' ))
  #     data[, 1:3, with = FALSE]
  #   }
  #})


  # Create Potential jobs
  lapply(1:length(isolate(global$tasks )), function(i){
    output[[ paste0('job', i) ]] <- assign( paste0('value', isolate(global$tasks[ i ] )),
                                            renderValueBox({ valueBox(
                                              HTML(sprintf('<input type="radio" name="var" id="%s" value="%s"/><span>%s</span><br />',
                                                           isolate(global$tasks[ i ]), isolate(global$tasks[ i ]), isolate(global$tasks[ i ] ))),
                                              isolate(global$tasks[ i ]), icon = icon('check'), color = 'red' )
                                            }))
  }) #END potential jobs
  
  # Create Completed Jobs page
  if( !is.null( isolate( global$completed ))){
    if( length( isolate( global$completed )) == 1 ){
      output [[ paste0( 'download', isolate( global$completed[ 1 ])) ]] <- assign( paste0( 'value', isolate( global$completed[ 1 ]) ),
                                                                                   createDownloadHandler( isolate( global$completed[ 1 ]) ))
      output[[ paste0( 'completedJob',1 ) ]] <- assign( paste0('value', isolate(global$completed[ 1 ] )),
                                                        renderValueBox({
                                                          valueBox( downloadButton( paste0( 'download', isolate( global$completed[ 1 ] )), isolate(global$completed[ 1 ])),
                                                                    isolate(global$completed[ 1 ]), icon = icon('check'), color = 'blue' )
                                                        }))
    }
    else{
      lapply(1:length( isolate(global$completed )), function(i){
        output [[ paste0( 'download', isolate( global$completed[ i ])) ]] <- assign( paste0( 'value', isolate( global$completed[ i ]) ),
                                                                                     createDownloadHandler( isolate( global$completed[ i ]) ))
        output[[ paste0( 'completedJob',i ) ]] <- assign( paste0('value', isolate(global$completed[ i ] )),
                                                          renderValueBox({
                                                            valueBox( isolate(global$completed[ i ] ),
                                                                      'herp', icon = icon('check'), color = 'blue' )
                                                          }))
      })
    }
  } #END creating Jobs
  
  output$checkVar<-renderText ({ input$var })
  #print(class( input$var ))
  
  observeEvent(input$dataUpload, {
    validate(
      need( !is.null( input$var ), message = "Select a Task" ),
      need( !checkForCollision( input$projectName ), message = "Project Name already Exists" ),
      need( !is.null(input$downloadFile), message = "Upload a File First" )
    )
    zipExtract(input$projectName, input$downloadFile$datapath)
    
    
  })
  
}


shinyApp(ui, server)



