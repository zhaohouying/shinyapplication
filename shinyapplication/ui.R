#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
      
      # Application title
      titlePanel("Predict Diamond Price from Carat Based on Selected Criteria"),
      
      # Sidebar with a slidebar and three radio buttons 
      sidebarLayout(
            sidebarPanel(
                  sliderInput("caratselection",
                              "What is the carat of the diamond?",
                              min = 0.35,
                              max = 5,
                              value = 0.3),
                  radioButtons("cutselection","Please select quality of cut",c("Ideal","Premium","Very Good","Good","Fair")),
                  radioButtons("colorselection","Please select diamond color",c("D","E","F","G","H","I","J")),
                  radioButtons("clarityselection","Please select how clear the diamond is",c("IF","VVS1","VVS2","VS1","VS2","SI1","SI2","I1"))
            ),
            
            # Show a plot of the selected samples and the predicted value
            mainPanel(
                  h3("Regression and prediction based on seledted samples"),
                  plotOutput("Plot1"),
                  h3("Predicted price for your diamond (in USD):"),
                  textOutput("pred1"),
                  h3("Description:"),
                  h4("This shiny application is developed to predict diamond price from carat and selected cut,color and clarity"),
                  h5("1. This app loads the diamonds dataset from ggplot2 package"),
                  h5("2. The dataset contains the prices and other attributes of almost 54,000 diamonds"),
                  h5("3. You may choose the carat, and select the quality of cut, color and clarity of your diamond to predict the price"),
                  h5("4. A plot with regression based on your selection is shown with the predicted price highlighted")
            )
      )
))

