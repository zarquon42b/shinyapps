options(rgl.useNULL=T)
library(shiny)
library(shinyRGL)
require(rgl)
library(shiny)
colorvec <- c("white","red","green","blue","orange")
modelvec <- list.files(pattern="h5")
                                        # Define UI for application that draws a histogram
shinyUI(fluidPage(
    title=("First 6 PCs of statismo mandible model"),
                                        #webGLOutput("myWebGL"),
    fluidRow(
        column(12, align="center",
               webGLOutput("myWebGL")
               ),
        hr(),
        column(3,
               h4("PCs 1-3:"), 
               sliderInput("pc1", "PC1: ", min = -3, max = 3, value = 0, step=1,"width=100px"),
               sliderInput("pc2", "PC2: ", min = -3, max = 3, value = 0, step=1),
               sliderInput("pc3", "PC3: ", min = -3, max = 3, value = 0, step=1)
               ),
        column(3,
               h4("PCs 4-6"),
               sliderInput("pc4", "PC4: ", min = -3, max = 3, value = 0, step=1),
               sliderInput("pc5", "PC5: ", min = -3, max = 3, value = 0, step=1),
               sliderInput("pc6", "PC6: ", min = -3, max = 3, value = 0, step=1)
               ),
        column(5,
               h4("Settings"),
               # selectInput('modelfile','Select model',modelvec),
               selectInput('col','Select color',colorvec),
               checkboxInput('smooth', 'Smooth mesh', FALSE),
               checkboxInput('normals', 'use normals to improve Rendering (slower)',FALSE),
               checkboxInput('random', 'select random sample',FALSE),
               checkboxInput('reset', 'reset to mean',FALSE)
               )
	)
    )
        )

