#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(HistData)
library(plotly)
data("GaltonFamilies")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  fit <- lm(childHeight ~ mother+father+gender, data = GaltonFamilies)
  
  output$plot <- renderPlotly({
    p <- predict.lm(fit, 
                    data.frame(mother=input$mom, father=input$dad, gender=input$gender),
                    interval = "prediction")
    
    x <- c("Father", "Mother", "Child")
    y <- c(input$dad, input$mom, round(p[1],1))

    plot_ly(data.frame(x, y), x = ~x, y = ~y, type = "bar", mode = "markers") %>%
            layout(title = "Average Child Height - Galton - 95% confidence",
                   xaxis = list(title = "Family"),
                   yaxis = list(title = "Height (inches)"))
  })
})
