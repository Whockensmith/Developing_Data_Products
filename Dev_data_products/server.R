library("shiny")
library("datasets")
library("ggplot2")


mpgData <- mtcars

mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))


shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$mpgPlot <- renderPlot({
    
    if (input$variable == "am") {
      
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]], labels = c("Automatic", "Manual")))
    }
    else {
      
      mpgData <- data.frame(mpg = mtcars$mpg, var = factor(mtcars[[input$variable]]))
    }
    
    if (input$variable2 == "cp"){
      cp <- coplot(mpg ~ disp | as.factor(mtcars[[input$variable]]), data = mtcars,
                   panel = panel.smooth, rows = 1 , pch = 19, lwd=2, col="blue" )
      print(cp)
    }
    else{
      if(input$variable == "am") {
        p <- ggplot(mpgData, aes(var, mpg)) +
          geom_boxplot(outlier.size = ifelse(input$outliers, 2, NA), fill = c("peachpuff2","palegoldenrod"), colour = "#3366FF") +
          xlab(input$variable) 
        print(p)
      }
      else{
        if(input$variable == "cyl") {
          p <- ggplot(mpgData, aes(var, mpg)) +
            geom_boxplot(outlier.size = ifelse(input$outliers, 2, NA), fill = c("slateblue4","orangered2","darkcyan"), colour = "#3366FF") +
            xlab(input$variable) 
          print(p)
        }
        else{
          p <- ggplot(mpgData, aes(var, mpg)) +
            geom_boxplot(outlier.size = ifelse(input$outliers, 2, NA), fill = c("coral","cornflowerblue","darkcyan"), colour = "#3366FF") +
            xlab(input$variable) 
          print(p)
        }
      }
    }
  })
})

