library(dplyr)
library(ggplot2)

data_ln <- read.csv("data_LN.csv")
data_ln_summarized <- group_by(data_ln, isoform, virus) %>% summarize(mean=mean(fold_inhibition), stdev=sd(fold_inhibition))

ggplot(data_ln_summarized, aes(x=virus, y=mean, fill=virus)) +
    geom_bar(stat="identity", position=position_dodge()) +
    scale_fill_brewer(palette="Dark2") +
    theme_light() +
    geom_errorbar(aes(ymin=mean-stdev, ymax=mean+stdev), width=0.3, position=position_dodge(0.9)) +
    facet_grid(cols=vars(isoform))
