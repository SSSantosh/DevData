library(shiny)



shinyServer(
  function(input,output)
  {
    output$N <- renderPrint({input$N})
    
    output$SliderWidget <- renderUI({
      SlideMin = 5
      SlideMax = input$N
      sliderInput("n","Sample size",min = SlideMin,max = SlideMax,value = 5, step = 1)
    })
    
    output$n <- renderPrint({input$n})
    output$name <- renderPrint({input$name})
    set.seed(1)
    pop <- reactive({
    if (input$name == "Standard Normal Distribution")
    {
    as.numeric(rnorm(input$N))
    }
    
    else 
    {
      if (input$name == "Standard Uniform Distribution")
      {
        as.numeric(runif(input$N))
      }
      
      else
      {
        as.numeric(rexp(input$N))
      }
    }})
    
    

    
    output$histpop <- renderPlot({hist(pop(), main = ("Population Distribution"), xlab = "x")})
    output$histsm <- renderPlot({
      set.seed(1)
      sm_mean <- as.numeric(replicate(1000,mean(sample(pop(),input$n))))
      hist(sm_mean, main = "Distribution of sample means", xlab = "Sample mean", xlim = c(-3,3))
    })
  }
)