library(shiny)
mpgprediction <- function(wt, qsec, am) {
  if (am == "Automatic") amnum = 0
  else if (am == "Manual") amnum = 1
  # The following prediction model is taken from Regression Models course project
  prediction <- 9.618 - 3.917*wt + 1.226*qsec + 2.936*amnum
  return(prediction)
}

kmplconversion <- function(wt, qsec, am) {
  if (am == "Automatic") amnum = 0
  else if (am == "Manual") amnum = 1
  conversion <- (9.618 - 3.917*wt + 1.226*qsec + 2.936*amnum) * 0.4251437075
  return(conversion)
}

shinyServer(
  function(input, output) {
    output$inputwt <- renderPrint({input$wt})
    output$inputqsec <- renderPrint({input$qsec})
    output$inputam <- renderPrint({input$am})
    output$prediction <- renderPrint({mpgprediction(input$wt, input$qsec, input$am)})
    output$conversion <- renderPrint({kmplconversion(input$wt, input$qsec, input$am)})
  }
)