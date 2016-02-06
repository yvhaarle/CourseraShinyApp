library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Predict MPG of a car using the mtcars dataset"),
  sidebarPanel(
    selectInput('am','Transmission',choices = list("Automatic"=0,"Manual"=1),
                selected = 0),
    sliderInput('cyl', 'Number of cylinders',value = 2, min = 4, max = 8, step = 2),
    sliderInput('wt', 'Weight of the car [10^3 lb]', 0.1, min = 0.1, max = 5.5, step = 0.01),
    submitButton('Submit'),
    h3(''),
    h3('Instructions / documentation'),
    h4('Suppose you would like to buy a car and want to know what affects Miles Per Gallon (MPG) the most. This 
       application can help you with that. It uses the mtcars dataset that comes with R that 
       contains a lot of data from a range of cars.'),
    h4('This app uses a simple linear model (fit to the mtcars data) to predict MPG as a function of weight, 
        number of cylinders and transmission type. This app stays within the boundaries of the data: it does 
       not extrapolate to areas outside these boundaries.'),
    h4('Just set the parameters in the left panel (above this text), press submit and the prediction of MPG will 
       be shown in the right panel under \"Prediction of MPG:\". Have fun! ')
  ),
  mainPanel(
    h3('You entered the following:'),
    h4('Transmission:'),
    verbatimTextOutput("oTrans"),
    h4('Number of cylinders:'),
    verbatimTextOutput("ocyl"),
    h4('Weight of the car [10^3 lb]'),
    verbatimTextOutput("owt"),
    h2('Prediction of MPG:'),
    verbatimTextOutput("MPG")
    
    
  )
))