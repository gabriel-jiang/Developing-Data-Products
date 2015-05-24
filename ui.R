library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Predicting the miles/(US) gallon for automatic and manual transmissions in 1973-74 automobiles"),

    # Sidebar with sliders, select box and action button that demonstrate various widgets available
    # options
    sidebarPanel(
	# Decimal interval with step value
	sliderInput('wt', 'Move the slider to select the weight (lb/1000)', 3.325, min = 1.513, max = 5.424, step= 0.1),

	# Decimal interval with step value
	sliderInput('qsec', 'Move the slider to select the 1/4 mile time (seconds)', 17.71, min = 14.50, max = 22.90, step= 0.1),

	# Transmission select box
	selectInput('am', label = h4("Select the transmission type"), 
	    choices = list("Automatic" = "Automatic", "Manual" = "Manual"), 
	    selected = "Automatic"),
	h4("Click the 'Predict' button"),
	submitButton('Predict')
    ),
    mainPanel(
	h3('Results of prediction'),
	h4('A car weighing (in lb/1000)'),
	verbatimTextOutput("inputwt"),
	h4('with a 1/4 mile time (in seconds) of'),
	verbatimTextOutput("inputqsec"),
	h4('with transmission type'),
	verbatimTextOutput("inputam"),
	h4('has a miles/(US) gallon prediction of '),
	verbatimTextOutput("prediction"),
	h4('which is equivalent to'),
	verbatimTextOutput("conversion"),
	h4('kilometres per litre.')
    )
  )
)