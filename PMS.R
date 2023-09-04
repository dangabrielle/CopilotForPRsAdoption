library(readxl)
library(rms)
library(ggplot2)
library(dplyr)
set.seed(111)
exper_data <- read.csv("LLMPRs.csv", header=TRUE, sep=",")
exper_data <- subset(exper_data, isValid == 'True' & state %in% c('MERGED','CLOSED') & isGeneratedByBots == 'False')
contr_data <- read.csv("control_prs_df.csv", header=TRUE, sep=",")
contr_data <- subset(contr_data, state %in% c('MERGED','CLOSED') & isGeneratedByBots == 'False')

exper_data$purpose <- ifelse(grepl("doc|copyright|license", exper_data$body, ignore.case = T), "Document", 
                             ifelse(grepl("bug|fix|defect", exper_data$body, ignore.case = T), "Bug", "Feature"))
exper_data = subset(exper_data, select = -c(isValid,firstEditedAtBycopilot4prs))
exper_data['isGeneratedByCopliot'] <- TRUE
contr_data$purpose <- ifelse(grepl("doc|copyright|license", contr_data$body, ignore.case = T), "Document", 
                             ifelse(grepl("bug|fix|defect", contr_data$body, ignore.case = T), "Bug", "Feature"))
contr_data['isGeneratedByCopliot'] <- FALSE

round(colMeans(exper_data[ , unlist(lapply(exper_data, is.numeric))]),3)
round(colMeans(contr_data[ , unlist(lapply(contr_data, is.numeric))]),3)
unique_exper_data <- exper_data[!duplicated(exper_data[,c('repoName')]),]
round(colMeans(unique_exper_data[ , unlist(lapply(unique_exper_data, is.numeric))]),3)
unique_contr_data <- contr_data[!duplicated(contr_data[,c('repoName')]),]
round(colMeans(unique_contr_data[ , unlist(lapply(unique_contr_data, is.numeric))]),3)
data <- rbind(exper_data, contr_data)

model_data <- data.frame(data$reviewTime, data$reviewersTotalCount, data$reviewersComments, data$authorComments,
                         data$commentsTotalCount, data$additions, data$deletions, data$prSize,
                         data$commitsTotalCount, data$changedFiles, data$prExperience, data$isGeneratedByCopliot, data$bodyLength, 
                         data$purpose,data$repoLanguage,data$forkCount,data$stargazerCount,data$repoAge,data$isMember)
names(model_data)[1] <- "reviewTime"
names(model_data)[2] <- "reviewersTotalCount"
names(model_data)[3] <- "reviewersComments"
names(model_data)[4] <- "authorComments"
names(model_data)[5] <- "commentsTotalCount"
names(model_data)[6] <- "additions"
names(model_data)[7] <- "deletions"
names(model_data)[8] <- "prSize"
names(model_data)[9] <- "commitsTotalCount"
names(model_data)[10] <- "changedFiles"
names(model_data)[11] <- "prExperience"
names(model_data)[12] <- "isGeneratedByCopliot"
names(model_data)[13] <- "bodyLength"
names(model_data)[14] <- "purpose"
names(model_data)[15] <- "repoLanguage"
names(model_data)[16] <- "forkCount"
names(model_data)[17] <- "stargazerCount"
names(model_data)[18] <- "repoAge"
names(model_data)[19] <- "isMember"
model_data$isMember <- as.integer(as.logical(model_data$isMember))
model_data$reviewTime <- as.numeric(model_data$reviewTime)
# Calculate the frequency of each value in the column
value_counts <- table(model_data[["repoLanguage"]])
print(order(value_counts, decreasing = TRUE))
# Get the values that have frequency in the bottom 10
top_values <- names(value_counts)[order(value_counts, decreasing = TRUE)][1:10]
# Create a new column with values replaced by "Other" for bottom values
model_data$repoLanguage <- ifelse(!(model_data[["repoLanguage"]] %in% top_values), "Other", model_data[["repoLanguage"]])

library(moments)


library("tidyverse")
library("broom")
library("magrittr")
library("WeightIt")
library("cobalt")
W.out <- weightit(isGeneratedByCopliot ~ reviewersTotalCount + reviewersComments + authorComments + commentsTotalCount   +
                    additions + deletions + prSize + commitsTotalCount + changedFiles + prExperience +
                    bodyLength + purpose + repoLanguage + forkCount + stargazerCount + repoAge + isMember ,
                  data = model_data, estimand = "ATT", method = "ebal")
W.out
summary(W.out)
bal.tab(W.out,threshold=0.1)
plot(bal.tab(W.out,threshold=0.1, un = TRUE), abs = TRUE)
model_data$weights <- W.out$weights
PSM_result <- model_data %>%
  lm(reviewTime ~ isGeneratedByCopliot +  
       reviewersTotalCount + reviewersComments + authorComments + commentsTotalCount   +
       additions + deletions + prSize + commitsTotalCount + changedFiles + prExperience +
       bodyLength + purpose + repoLanguage + forkCount + stargazerCount + repoAge + isMember ,
     data = ., weights = weights) %>%
  tidy()

print(n = 38,PSM_result)
for(i in 1:nrow(PSM_result)) {
  term <- as.character(PSM_result[i,'term'])
  estimate <- round(as.numeric(PSM_result[i,'estimate']), 1)
  std_error <- round(as.numeric(PSM_result[i,'std.error']), 1)
  p_value <- format(as.numeric(PSM_result[i,'p.value']), scientific = TRUE, digits = 2)
  
  output <- paste(term, "&", estimate, "&", std_error, "&", p_value, "\\")
  print(output)
}




library("MatchIt")
library("tidyverse")
library("broom")
library("magrittr")

data <- read.csv("~/Documents/RStudio/PSMdata.csv")

m_near <- matchit(formula = treatment ~ repositories + sponsoring + openedPRs + reviewedPRs + language + followers + organizations,
                  data = data,
                  method = "nearest",
                  replace = TRUE)
summary(m_near)
matched_data <- match.data(m_near)
matched_data
PSM_result <- matched_data %>%
  lm(sponsors ~ treatment + repositories + sponsoring + openedPRs + reviewedPRs + language + followers + organizations,
     data = ., weights = weights) %>%
  tidy()

