library(ggplot2)
library(shiny)
library(shinydashboard)
library(readr)
library(dplyr)

ec_data <- read_csv("~/Downloads/MITB/R/R Project/data/ec_data.csv")

ui <- dashboardPage(skin = 'blue',
                    dashboardHeader(title = 'EC Sales Analysis', titleWidth = 400),
                    dashboardSidebar(width = 400,
                                     sidebarMenu(menuItem('Descriptive', tabName = 'Descriptive', icon = NULL),
                                                 menuItem('Inferential', tabName = 'Inferential', icon = NULL))),
                                             
                    dashboardBody(
                      tabItems(
                        tabItem(tabName = 'Descriptive',
                                fluidPage(
                                  fluidRow(
                                    column(width = 12,
                                           box(
                                             radioButtons('analyseBy',
                                                          label = tags$strong('Analyse Sales By:'),
                                                          choices = c('Floor Level' = 'Floor',
                                                                      'Region' = '`Planning Region`',
                                                                      'Property Age' = '`Completion Date`')),
                                                          inline = TRUE)
                                           ))
                                  ),
                                  
                                  fluidRow(
                                    column(width = 12,
                                           box(
                                             width = 12,
                                             height = 800,
                                             solidHeader = TRUE,
                                             collapsible = FALSE,
                                             collapsed = FALSE,
                                             plotOutput('basketAnalysis', height = 750)
                                           )
                                    )
                                  ),
                                  
                                  fluidRow(
                                    column(width = 12,
                                           box(
                                             width = 12,
                                             height = 800,
                                             solidHeader = TRUE,
                                             collapsible = FALSE,
                                             collapsed = FALSE,
                                             plotOutput('weeklySalesAnalysis', height = 750)
                                           )
                                    )
                                  )
                                )),
                        
                        tabItem(tabName = 'Inferential',
                                fluidPage(
                                  fluidRow(
                                    column(width = 12,
                                           box(
                                             radioButtons('analyseBy2',
                                                          label = tags$strong('Analyse Sales By:'),
                                                          choices = c('Floor Level' = 'Floor',
                                                                      'Region' = '`Planning Region`',
                                                                      'Property Age' = '`Completion Date`'),
                                                          inline = TRUE)
                                           ))
                                  )
                                ))
                        )
  
)

                      
                      




server <- function(input, output) {
  
  # pal <- colorFactor(palette = c("red", "green", "blue", "orange", "purple"),
  #                    levels = c("East Region", "North East Region", 
  #                               "West Region", "North Region", "Central Region"))
  # output$map <- renderLeaflet({
  #   leaflet(ec_geo2) %>%
  #     setView(lng = 103.8522, lat = 1.347510, zoom = 10) %>%
  #     addTiles() %>%
  #     addCircleMarkers(label = ~ pjname, color = ~ pal(`Planning.Region`), radius = 3, fillOpacity = 0.5) %>%
  #     addLegend(
  #       "bottomleft",
  #       pal = pal,
  #       values = ~Planning.Region,
  #       opacity = 1, #color transparency
  #       title = "Regions"
  #     )
  # })
  
  output$basketAnalysis <- renderPlot({
    analysis <- ec_data %>%
      group_by_(.dots = input$analyseBy) %>%
      summarise(avg_ec_price = mean(`Unit Price ($ psm)`, na.rm = T))
    
    p <- ggplot(analysis, aes_string(y = 'avg_ec_price', x = input$analyseBy)) + 
      geom_bar(aes_string(fill = input$analyseBy), stat = 'identity') +
      labs(title = 'Average EC Price', subtitle = paste('by', input$analyseBy), 
           x = input$analyseBy, y = '`Unit Price ($ psm)`',
           fill = input$analyseBy)
    
    return(p)
    
  })
}
  
  # output$weeklySalesAnalysis <- renderPlot({
  #   analysis <- customer_transactions %>%
  #     group_by_(.dots = c('WEEK_NO', input$analyseBy)) %>%
  #     summarise(WEEKLY_SALES = sum(SALES_VALUE)) %>%
  #     ungroup()
  #
  #   p <- ggplot(analysis, aes(y = WEEKLY_SALES, x = WEEK_NO)) +
  #     geom_smooth(aes_string(col = input$analyseBy), method = 'lm', se = FALSE) +
  #     geom_point(aes_string(col = input$analyseBy))
  #   
  #   return(p)
    

shinyApp(ui, server)
