options(rgl.useNULL=T)
library(shiny)
library(shinyRGL)
require(rgl)
library(shiny)
#options(rgl.useNULL=T)
#rgl.init() 
colorvec <- c("white","red","green","blue","orange")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
	
  # Application title
  title=("First 6 PCs of statismo mandible model"),
  webGLOutput("myWebGL"),
  	fluidRow(
    	column(3,
		h4("PCs"), 
		sliderInput("pc1", "PC1: ", min = -3, max = 3, value = 0, step=1,"width=100px"),
		sliderInput("pc2", "PC2: ", min = -3, max = 3, value = 0, step=1),
        	sliderInput("pc3", "PC3: ", min = -3, max = 3, value = 0, step=1),
        	),
 	column(3,
		h4("PCs"),
		sliderInput("pc4", "PC4: ", min = -3, max = 3, value = 0, step=1),
        	sliderInput("pc5", "PC5: ", min = -3, max = 3, value = 0, step=1),
        	sliderInput("pc6", "PC6: ", min = -3, max = 3, value = 0, step=1),
        	selectInput('col','Select color',colorvec)
        ))



    # Show a plot of the generated distribution
  )
)

