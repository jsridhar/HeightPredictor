#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Child Height Predictor - Galton Families - Plotly"),
  
  # Sidebar with a slider input for height of parents 
  sidebarLayout(
    sidebarPanel(
      sliderInput("dad",
                  "Father's Height",
                  min = 55,
                  max = 84,
                  value = 68),
      sliderInput("mom",
                  "Mother's Height",
                  min = 48,
                  max = 84,
                  value = 64),
      radioButtons("gender", 
                   "Child's Gender", 
                   choices = list("Female" = "female", "Male" = "male")),
      p("Select parent's height and / or child's gender to see the prediction of child's height.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("plot"),
      p("*Move mouse over the child bar in the graph to see the exact height of the child.")
    )
  )
))
