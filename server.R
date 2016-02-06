library(shiny)

MPGprediction <- function(am,cyl,wt) {
  MPG <- 33.7536 - 3.1496*wt 
  if (am == 1) {
    MPG <- MPG + 0.1501
  }
  if (cyl == 6) {
    MPG <- MPG - 4.2573
  } else if (cyl == 8) {
    MPG <- MPG - 6.0791
  }
  
  return(MPG)
}

Transm <- function(am) {
  if (am == 0) {
    return('Automatic')
  } else {
    return('Manual')
  }
} 

shinyServer(
  function(input, output) {
    output$oTrans <- renderPrint({Transm(input$am)})
    output$ocyl <- renderPrint({input$cyl})
    output$owt <- renderPrint({input$wt})
    output$MPG <- renderPrint({MPGprediction(input$am,input$cyl,input$wt)})
  }
)