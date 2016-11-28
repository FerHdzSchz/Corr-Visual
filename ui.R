
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinydashboard)
library(corrplot)

shinyUI(dashboardPage(

  # Application title
  dashboardHeader   (title = "Corr Visualization"),

  # Sidebar with a slider input for number of bins
  
  dashboardSidebar(
                
    # Copy the line below to make a file upload manager
                fileInput("file", label = h3("CSV File input")),            
    #Drop Down menu
    
                selectInput("selectordering", label = h3("Ordering"), 
                    choices = list("Ordered Eigenvectors" = "AOE", 
                                   "First Principal Component" = "FPC", 
                                   "Hierarchical Clustering" = "hclust",
                                   "Original" = "original"), 
                    selected = 1),
           
  
    
    # Cond panel          
                conditionalPanel(
                  
                  condition = "input.selectordering == 'hclust' ",
                       
                  sliderInput("bins",
                            "Number of bins:",
                            min = 1,
                            max = 9,
                            value = 5))
        
    ),

    # Show a plot of the generated distribution
    dashboardBody(
      fluidRow( 
        box(plotOutput("distPlot"),width = 600, title = "Correlation"
      )
    ))
  )
)
