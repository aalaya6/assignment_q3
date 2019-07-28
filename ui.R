#Aalaya Seshadri(11915082), Shlok Mittal(11915071)

library("shiny")


ui <- shinyUI(
  fluidPage(
    
    titlePanel("POS tagging"),
    
    sidebarLayout( 
      
      sidebarPanel(  
        
        fileInput("file", "Upload text file"),
        checkboxGroupInput("variable", "Fiter POS of interest:",
                           c("Noun" = "NOUN",
                             "Adjective" = "ADJ",
                             "Verb" = "VERB",
                             "AdVerb" = "",
                             "Conjunction"="CCONJ",
                             "Pronoun"="PRON",
                             "Proper Noun"="PROPN"
                           ),c("NOUN","ADJ","PROPN")),
        tableOutput("data"),
        
        numericInput('clusters', 'Number of Clusters', 3,
                     min = 1, max = 9)     ),   # end of sidebar panel
      
      
      mainPanel(
        
        tabsetPanel(type = "tabs",
                    
                    tabPanel("Overview",
                             h4(p("Data input")),
                             p("This app supports txt file",align="justify"),
                             br(),
                             h4('Please upload text file for which POS tagging needs to be done'),
                             p('Use the option ', 
                               span(strong("Upload text file")),
                               'provided to your left and upload the txt data file. You can also select the parts of speech you are interested to analyze by checking the appropriate  check boxes')),
                    tabPanel("Annotated documents", 
                             dataTableOutput('table1')),
                    
                    tabPanel("Wordclouds",
                             plotOutput('plot1')),
                    
                    tabPanel("Cooccurence",
                             plotOutput('plot2'))
                    
        ) 
      )
    ) 
  )  
) 