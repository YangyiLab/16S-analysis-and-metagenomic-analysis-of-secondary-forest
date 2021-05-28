library(ggplot2)
library(reshape2)
a<-read.table("D:\\Lab\\Lab1\\18report2\\CCA\\L2_L6_taxonomy_seqs_count\\otu_table_L4.txt",header=TRUE)

new.df<-melt(a,id.vars ="Taxon")
names(new.df)= c("Taxon","Group","Weight")

ggplot(data =new.df,aes(Group,Weight,fill = Taxon))+ 
  geom_bar(stat = "identity", position = "fill", color = "SlateGrey", width = 0.5, size = 0.25)+
  ylab("Relative Abundance") +
  scale_fill_discrete() +
  theme(
    axis.title.x = element_blank(), 
    axis.title = element_text(size = 15, face = "plain", color = "black"),
    axis.text.x = element_text(size = 7, face = "bold.italic", color = "black",angle=30),
    axis.text.y = element_text(size = 10, face = "bold", color = "black"),
    legend.title = element_text(size = 14, face = "plain", color = "black"),
    legend.position = "right"
  )


