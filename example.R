# Load libraries
library(dplyr)
library(ggplot2)

# Create a dataframe
data <- read.table("data_EY.txt", header=TRUE)

data_grouped <- group_by(data, Peptide, Conc=as.factor(Conc))

data_grouped_summarized <- summarize( data_grouped, Mean=mean(RLU) )

# data_grouped_summarized <- group_by(data, Peptide, Conc=as.factor(Conc)) %>% summarize(Mean=mean(RLU), Stdev=sd(RLU))

# Make grouped bar plot
ggplot(data_grouped_summarized, aes(y=Mean, x=Peptide, fill=Conc)) +
  geom_bar(position="dodge", stat="identity") +
  ylab("SINV replication (RLU)") +
  labs(fill="Conc (uM)")


ggsave("EY.png", dpi=720)
