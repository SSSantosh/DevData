library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("The Central Limit Theorem!"),
  sidebarPanel(
    
    radioButtons('name','Type of distribution of population',
                       c('Standard Normal Distribution','Standard Uniform Distribution','Standard Exponential Distribution')),
    sliderInput('N','Population size',1000, min = 500, max = 2000, step = 1),
    uiOutput("SliderWidget")
  ),
  mainPanel(
    p('This app lets you play for a while with the Central Limit Theorem. CLT states that the distribution of means of a sample of a given size nears the normal distribution with its mean nearing the mean of the population as the sample size increases.'),
    p('So, now, you can choose a type of input distribution, the population size and the sample size from the Sidebar Panel.'),
    p('You can now see the population distribution and sample mean distribution below.'),
    
    
    h3("Ready..."),
    
    p('The N you entered is'),
    verbatimTextOutput("N"),
    
    p('The n you entered is'),
    verbatimTextOutput("n"),
    
    
    p('The type of population distribution you chose is '),
    verbatimTextOutput("name"),
    plotOutput("histpop"),
    
    p('The distribution of 1000 sample means from the above population is'),
    plotOutput("histsm")
  )
))



