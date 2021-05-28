library(ggplot2)
library(reshape2)
a<-read.table("D:\\Lab\\Lab1\\18report2\\CCA\\L2_L6_taxonomy_seqs_count\\otu_table_L4.txt",header=TRUE)

print(a[17])
#添加一列，计算每个分类的数量和
a$Ori.S<-rowSums(a[,2:4])
a$Ori.W<-rowSums(a[,5:7])
a$y5.S<-rowSums(a[,8:10])
a$y5.W<-rowSums(a[,11:13])
a$y10.S<-rowSums(a[,14:16])
a$y10.W<-rowSums(a[,17:19])

a<-a[,-c(2:19)]


new.df<-melt(a,id.vars ="Taxon")
names(new.df)= c("Taxon","Group","Weight")


ggplot(data =new.df,aes(Group,Weight,fill = Taxon))+ 
  geom_bar(stat = "identity", position = "fill", color = "Black", width = 0.5, size = 0.25)+
  ylab("Relative Abundance") +scale_fill_manual(values = c("lightpink","tomato","paleturquoise","rosybrown","Gray","skyblue","palegreen","cornsilk","chocolate")) +
  theme(
    axis.title.x = element_blank(), 
    axis.title = element_text(size = 15, face = "plain", color = "black"),
    axis.text.x = element_text(size = 10, face = "bold.italic", color = "black",angle=30),
    axis.text.y = element_text(size = 10, face = "bold", color = "black"),
    legend.title = element_text(size = 14, face = "plain", color = "black"),
    legend.position = "right"
  )


