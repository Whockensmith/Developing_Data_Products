library(shiny)


shinyUI(pageWithSidebar(
  
  
   headerPanel("MPG vs Number of Cylinders, Gears, Transmission Type, and Engine Displacement"),
  
  
    sidebarPanel(
    selectInput("variable2", "Pick Chart Type:",
                list("Box and Wiskers" = "p", 
                      "Co-Plot" = "cp")),  
    
    checkboxInput("outliers", "Show outliers (Box and Wiskers Only)", FALSE),
      
    selectInput("variable", "Select Factor Variable:",
                list("Cylinders" = "cyl", 
                     "Transmission" = "am", 
                     "Gears" = "gear")),
    
      
    hr(),
    print("1. Select chart type from 'Pick Chart Type:' dropdown."),
    hr(),
    print("2. Check/Uncheck 'Show Outliers' Checkbox.  This only applies to the Box and Wiskers chart."),
    hr(),
    print("3. Select the Factor from the 'Select Factor Variable:' dropdown.")
  ),
  
  
  mainPanel(
    #h6(textOutput("caption")),
    
    plotOutput("mpgPlot"),
    hr(),
    print("The data is from the mtcars table with in R-Studio.  It was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).")
  )
))