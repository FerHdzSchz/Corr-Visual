
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    
    x <- read.csv(input$file$datapath)
    
    col4 <- colorRampPalette(c("#7F0000","red","#FF7F00","yellow","#7FFF7F", 
                               "cyan", "#007FFF", "blue","#00007F"))   
    
    
    corrplot( cor(x), order= input$selectordering , 
              addrect= input$bins,method = "ellipse",
              col = col4(10)) 

      })

})
