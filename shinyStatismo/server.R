options(rgl.useNULL=T)
library(shinyRGL)
require(Rvcg)
require(RvtkStatismo)
require(rgl)
library(shiny)

rgl.init() 
buttonorig <- buttonstate <- 0
mod <- statismoLoadModel("decimMod.h5")
colorvec <- c("white","red","green","blue","orange")
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
                
                observe({
                   # mod <- statismoLoadModel(input$modelfile)
                    x    <- mod
                    col <- input$col
                    coef <- NULL
                    coef <- c(input$pc1,input$pc2,input$pc3,input$pc4,input$pc5,input$pc6)
                    if (input$random) {
                        isolate({
                        samp0 <- DrawSample(x)
                        coef1 <- ComputeCoefficientsForDataset(x,samp0)
                        isolate({for(i in 1:6) updateNumericInput(session,paste0("pc",i),value=coef1[i])})
                        updateCheckboxInput(session,"random",value=FALSE)
                        })
                    }
                     if (input$reset) {
                        isolate({
                            for(i in 1:6) updateNumericInput(session,paste0("pc",i),value=0)
                        updateCheckboxInput(session,"reset",value=FALSE)
                        })
                    }
                    samp <- (DrawSample(x,coef))
                    
                   
                    if (input$smooth) {
                        samp <- vcgSmooth(samp)
                        samp$normals <- NULL
                    }
                    if (input$normals)
                        samp <- vcgUpdateNormals(samp)
                    
                    
                    output$myWebGL <- renderWebGL({
                        shade3d(samp,col=col,specular=1)
                    },width=500,height=500)
                                        #if (input$random)
                                        #	i<- 1; updateNumericInput(session,paste0("pc",i),value=coef[i])
                    
})
})
