#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
data(diamonds, package = "ggplot2")


# Define server logic 
shinyServer(function(input, output) {
      
      model1pred <- reactive ({
            selected <- filter(diamonds,cut==input$cutselection & color==input$colorselection & clarity==input$clarityselection)
            model1 <- lm(price~carat,data=selected)
            caratinput <- input$caratselection
            predict(model1,newdata=data.frame(carat=caratinput))
      })
      
      output$Plot1 <- renderPlot({
            selected <- filter(diamonds,cut==input$cutselection & color==input$colorselection & clarity==input$clarityselection)
            caratinput <- input$caratselection
            model1 <- lm(price~carat,data=selected)
            plot(selected$carat,selected$price,xlab="Carat",ylab="Price",bty="n",pch=16,xlim=c(0.2,5.2),ylim=c(300,40000))
            abline(model1,col="red",lwd=2)
            points(caratinput,model1pred(),col="red",pch=16,cex=2)
      })    
      
      output$pred1 <- renderText({
            model1pred()
      })
})
