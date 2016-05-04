install.packages('igraph')
library(igraph)
  ga.data <- read.csv('ga_edgelist.csv',header = TRUE)
  g<-graph.data.frame(ga.data,directed=FALSE)
  g <- simplify(g)
  summary(g)
  V(g)$name
  g$layout<-layout.fruchterman.reingold(g)
  png(filename="ga_plot.png")
  plot(g)
  dev.off()

c<-g
clo <- closeness(c)
clo.score <- round( (clo - min(clo)) * length(clo) / max(clo) ) + 1
clo.colors <- rev(heat.colors(max(clo.score))) 
V(c)$color <- clo.colors[ clo.score ] 
png(filename="ga_plot_closeness.png")
plot(c)
dev.off()
maxCloseness = which((closeness(c))==max(closeness(c)))
V(c)[maxCloseness]$name

e<-g
eig<- evcent(e)
eig$vector<-eig$vector*1000
eig$colors <- rev(heat.colors(max(eig$vector))) 
V(e)$color<-eig$colors[eig$vector]
png(filename="ga_plot_evcent.png")
plot(e)
dev.off()
maxEv = which(max(evcent(e)$vector)==(evcent(e)$vector))
V(e)[maxEv]$name

 

#Community
set.seed(100)
# Grivan-Newman algorithm
# 1st we calculate the edge betweenness, merges, etc...
ebc <- edge.betweenness.community(g, directed=F)

V(g)$color=ebc$membership
g$layout <- layout.fruchterman.reingold
png(filename="ga_plot_Grivan-Newman.png")
plot(g)
dev.off()

#amount of communities
i=max(ebc$membership)
x=1
while (x<=i)
{
  t<-table(ebc$membership)[x]
  print(t)
  x=x+1
}

#fastgreedy community

fc <- fastgreedy.community(g)
V(g)$color=fc$membership
g$layout <- layout.kamada.kawai()
png(filename="ga_plot_fastgreedy.png")
plot(g)
dev.off()


#amount of communities
i=max(fc$membership)
x=1
while (x<=i)
{
  t<-table(fc$membership)[x]
  print(t)
  x=x+1
}
