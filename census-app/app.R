# Lesson 5
library(shiny)
library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.rds")
# Define UI ----
ui <- fluidPage( title = "2010 US Census Visualization",
  titlePanel("2010 US Census Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("select", 
                  h3(strong("Choose a population to display")),
                  choices = list(
                    "Percent White",
                    "Percent Black",
                    "Percent Hispanic",
                    "Percent Asian"),
                  selected = "Percent White"
      ),
      sliderInput("num",
                  h3(strong("Range of Interest")),
                  min = 0, max = 100, value = c(0, 50)),
      plotOutput("map")
      ),
    
    mainPanel(
      p("Shiny is a package within R that allow for R Programmers to build interactive web application straight from R. It is one of the many ways to design
        interactive dashboard that allow you to tell your data story or allowing end users to interact with your data and analysis."),
      p("One of the many cool features with Shiny is that it has built-in responsive design.  So whether the users are on mobile or desktop, 
        it will automatically adjust."),
      p("Just like many visualization tools out there, the output will instantly change as the user modify the inputs."),
      p("Although it has a deep learning curve, Shiny allow R Programmers to use computational power of R while making stunningly beautiful visualization. "),
      p("Check out the", a("Shiny Gallery", href="https://shiny.rstudio.com/gallery/")," to see what others  users (with FAR more experiences and knowledge of R) had created!"),
      p("To see the code behind this, please click", a("here", href="https://github.com/Mahokkit/RProject/tree/master/census-app")),
      br(),br(),img(src = "rstudio.png", height = 80, width = 250, align = "center"),
      br(),

      "Shiny is a product of ",span("RStudio",style = "color:blue"),
      p("To learn more visit the ",
        a("Shiny homepage.", 
          href = "http://shiny.rstudio.com"))
      )
  )
  )

# Define server logic ----
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$select,
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    
    color <- switch(input$select,
                   "Percent White" = "darkgreen",
                   "Percent Black" = "black",
                   "Percent Hispanic" = "red",
                   "Percent Asian" = "brown")
    
    legend <- switch(input$select,
                    "Percent White" = "% White",
                    "Percent Black" = "% Black",
                    "Percent Hispanic" = "% Hispanic",
                    "Percent Asian" = "% Asian")
    percent_map(data, color, legend, input$num[1], input$num[2])
  })
}

# Run the app ----
shinyApp(ui = ui, server = server, options = list(display.mode = 'showcase'))