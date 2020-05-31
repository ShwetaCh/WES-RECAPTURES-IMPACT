library(data.table)
library(dplyr)
library(reshape2)
library(stringr)
library(ggplot2)
library(tidyverse)
library(ggpubr)
##
library(purrr)
library(grid)
library(gridExtra)
library(ggExtra)
##
library(ggplot2)
library(ggsci)
theme_set(theme_pubclean())
##
data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
 return(data_sum)
}
##