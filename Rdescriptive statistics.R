#-------------------------------------------------------------------------------
# Guided project to calculate descriptive statistical metrics on a dataset
# and create a data quality report file.
#-------------------------------------------------------------------------------

# Task 1
print("Hello")

data <- read.csv("data.csv", stringsAsFactors = FALSE)



#-------------------------------------------------------------------------------
# Task 2
length(data$Transmission.Type)
length(unique(data$Transmission.Type))
freq <- table(data$Transmission.Type)
freq <- sort(freq,decreasing = TRUE)
freq
#-------------------------------------------------------------------------------
# Task 3
mean(data$Engine.HP)
mean(data$Engine.HP, na.rm=TRUE)
median(data$Engine.HP, na.rm = TRUE)
uniquevalues <- unique(data$Engine.HP)
uniquevalues[which.max(tabulate(match(data$Engine.HP,uniquevalues)))]

#-------------------------------------------------------------------------------
# Task 4
min(data$Engine.HP, na.rm=TRUE)
max(data$Engine.HP, na.rm=TRUE)
range(data$Engine.HP,na.rm=TRUE)
var(data$Engine.HP,na.rm=TRUE)
sd(data$Engine.HP,na.rm=TRUE)
#-------------------------------------------------------------------------------
# Task 5
as.numeric(2)
as.character(2)

test <- as.character(1:3)
mean(test)
class(data$Engine.HP)
test2 <- c(NA,2,44,55,NA)
test2
sum(is.na(test2))
sum(is.na(data$Number.of.Doors))
sum(is.na(data$Transmission.Type))
#-------------------------------------------------------------------------------
# Task 6
apply(data, MARGIN=2,length)
sapply(data, function(x) min(x,na.rm=TRUE))
quality_data <- function(df=NULL){
  if(is.null(df)) print("please pass a non-empty data frame")
  summary_table <- do.call(data.frame,
                           list(
                             Min = sapply(df, function(x) min(x, na.rm =TRUE)),
                             Max = sapply(df, function(x) max(x, na.rm =TRUE)),
                            Mean = sapply(df, function(x) mean(x, na.rm =TRUE)),
                            SD = sapply(df, function(x) sd(x, na.rm =TRUE)),
                            Total = apply(df, 2,length),
                            NULLS = sapply(df, function(x) sum(is.na(x))),
                            unique = sapply(df, function(x) length(unique(x))),
                            dataType = sapply(df,class)
                           ))
  nums <- vapply(summary_table,is.numeric, FUN.VALUE = logical(1))
  summary_table[,nums] <- round(summary_table[, nums],digits=3)
  return(summary_table)
}
#  -------------------------------------------------------------------------------
# Task 7

df_quality <- quality_data(data)
df_quality <- cbind(Columns=rownames(df_quality),
                    data.frame(df_quality, row.names = NULL))

write.csv(df_quality, ppaste0("Data Quality Report",format(sys.time(),"%d-
                                                           
                                                           5m-%Y-%H%M%s"),".csv")

#-------------------------------------------------------------------------------
# END OF PROJECT
#-------------------------------------------------------------------------------