## Showing basic code structure, ui and server outline and reactive code

library(shiny)

ui <- fluidPage(
    sliderInput(
        inputId = "slider1",
        label = "Choose a number",
        value = 100,
        min = 50,
        max = 500
    ),
    plotOutput("hist")
)

server <- function(input, output) {
    output$hist <- renderPlot({
        title <- paste0("Histogram of ", input$slider1," values")
        hist(rnorm(input$slider1), main=title)
    })
}

shinyApp(ui = ui, server = server)