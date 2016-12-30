
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Correlation Analysis"),
  dashboardSidebar(
    ## Sidebar content
    dashboardSidebar(
      sidebarMenu(
        menuItem("Data", tabName = "datainput", icon = icon("folder")),
        menuItem("Explore", tabName = "corr", icon = icon("cog"))
      )
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "datainput",
              h2("This is the data loading and varibale selection screen."),
              
              fluidRow(
                
                box(fileInput("file", label = "CSV File input", 
                              accept= ('.csv')) , 
                    
                    conditionalPanel (condition= "!output.fileUploaded",
                                      p('You have not selected a file.')),
                
                    conditionalPanel (condition= "output.fileUploaded",
                                      selectInput("varnames", label = "Variables to use", "", multiple = T))
                    ),
                box (p("In this section you choose the files and variables you want to analize."))
                )
              ),
      # Second tab content
      tabItem(tabName = "corr",
              h2("This is the visualization screen"),
              box(conditionalPanel(condition= "!output.fileUploaded",
                               h1('You have not selected a file.')))
          
              )
              )
              )
  )

