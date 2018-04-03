# Lesson 2
library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("My Shiny App"),
  
  sidebarLayout(
    sidebarPanel(
      h1("Installation"),
      p("Shiny is available on CRAN, so you can
        install it in the usual way from your R
        consode:"),
      code('install.packages("shiny")'),
      br(),br(),br(),br(),
      img(src = "rstudio.png", height = 80, width = 250, align = "center"),
      br(),
      "Shiny is a product of ",span("RStudio",style = "color:blue")
    ),
    
    
    mainPanel(
      h1("Introducing Shiny"),
      p("Shiny is a new package from RStudio that make it ",
        em("incredibly easy "),
        "to build interactive web application with R."),
      br(),
      p("For an introduction and live examples, visit the ",
        a("Shiny homepage.", 
          href = "http://shiny.rstudio.com")),
      br(),
      h2("Features"),
      p("- Build useful web applications with only a few lines of code—no JavaScript required."),
      p("- Shiny applications are automatically 'live' in the same way that ", 
        strong("spreadsheets"),
        " are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser.")
    )
  )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)