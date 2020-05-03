library(shiny)

interval_secs <- 1

# NOTE: in dev - killing the shiny process does not kill this observable
# have to restart R session to pick up the changes
observe({

    invalidateLater(interval_secs * 1000)
    ts <- Sys.time()
    message(paste("firing - timestamp: ", format(ts, format = '%Y-%m-%d %H:%M:%S')))

})

ui <- fluidPage(

    titlePanel("Old Faithful Geyser Data"),

    sidebarLayout(
        sidebarPanel(
        ),

        mainPanel(
        )
    )
)

server <- function(input, output) {

}

shinyApp(ui = ui, server = server)
