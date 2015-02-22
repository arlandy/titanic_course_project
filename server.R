library(shiny)

if (!any(installed.packages()[,1]=="caret")){
  install.packages("caret", dependencies = TRUE)
}

library(caret)
library(e1071)
data<-read.csv("titanic.csv")
modFit <- train(Survived ~ .,method="rpart",data=data)

survives<-function(cl,sex,age){
  return(predict(modFit,newdata=data.frame(Class=cl,Sex=sex, Age=age )) == "True")
}

shinyServer(
  function(input, output) {
    output$result <- renderPrint({survives(input$cl,input$sex,input$age)})
  }
)
