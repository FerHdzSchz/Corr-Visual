

server <- function(input, output, session) {
 
  inFile <- reactive({
    if (is.null(input$file)) {
      return(NULL)
    } else {
      input$file
    }
  })
  
  myData <- reactive({
    if (is.null(inFile())) {
      return(NULL)
    } else {
      read.csv(inFile()$datapath)
    }
  })
  
  observe({
    updateSelectInput(
      session,
      "varnames",
      choices=names(myData()))
    
  })
  
  
  output$fileUploaded <- reactive({
    return(!is.null(myData()))
  })

  outputOptions(output, 'fileUploaded', suspendWhenHidden=FALSE)
}