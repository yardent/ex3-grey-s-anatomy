#מטלה 3- האנטומיה של גריי

###הגרף בנוי כך:
קודקודים- שחקני הסדרה

צלעות- הקשרים הרומנטים בין השחקנים
###השחקנים:
"lexi"         
"owen"         
"sloan"        
"torres"       
"derek"        
"karev"        
"o'malley"
"yang"         
"grey"         
"chief"        
"ellis grey"   
"susan grey"   
"bailey"       
"izzie"
"altman"       
"arizona"      
"colin"        
"preston"      
"kepner"       
"addison"      
"nancy"
"olivia"       
"mrs. seabury" 
"adele"        
"thatch grey"  
"tucker"       
"hank"         
"denny"
"finn"         
"steve"        
"ben"          
"avery"   

הגרף:
```sh
ga.data <- read.csv('ga_edgelist.csv',header = TRUE)
g<-graph.data.frame(ga.data,directed=FALSE)
g <- simplify(g)
summary(g)
V(g)$name
g$layout<-layout.fruchterman.reingold(g)
png(filename="ga_plot.png")
plot(g)
dev.off()
```
![alt tag](/ga_plot.png)

##למי מהשחקנים יש את מדד המרכזיות הגבוה ביותר:
1. Betweeness- "sloan"
```sh
b<-g
btw <- betweenness(b) 
btw.score <- round(btw) + 1 
btw.colors <- rev(heat.colors(max(btw.score))) 
V(b)$color <- btw.colors[ btw.score ] 
png(filename="ga_plot_betweenness.png")
plot(b)
dev.off()
maxBetween=which(max(betweenness(b, v=V(b),directed=FALSE, weights=NULL,nobigint=FALSE,normalized=FALSE))==betweenness(b, v=V(b),directed=FALSE, weights=NULL,nobigint=FALSE,normalized=FALSE))
V(b)[maxBetween]$name
```
![alt tag](/ga_plot_betweenness.png)  
2. Closeness- "torres"
```sh
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
```
![alt tag](/ga_plot_closeness.png)
3. Eigenceetor- "karev"
```sh
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
```
![alt tag](/ga_plot_evcent.png)


##זיהוי קהילות
```sh
set.seed(100)
```
### Grivan-Newman algorithm

  1. רשת לפי קוד צבעים התואם את הקהילות
  ```
  ebc <- edge.betweenness.community(g, directed=F)
  g2<-delete.edges(g, ebc$removed.edges[seq(length=which.max(mods)-1)])
  V(g)$color=clusters(g2)$membership
  g2<-delete.edges(g, ebc$removed.edges[seq(length=which.max(mods)-1)])
  V(g)$color=clusters(g2)$membership
  g$layout <- layout.fruchterman.reingold
  png(filename="ga_plot_Grivan-Newman.png")
  plot(g)
  dev.off()
  ```
  
   ![alt tag](/ga_plot_Grivan-Newman.png)
  2. התקבלו 7 קהילות
  ```
  i=max(ebc$membership)
  x=1
  while (x<=i)
  {
    t<-table(ebc$membership)[x]
    print(t)
    x=x+1
  }
  ```
    קהילה 1- 8 קודקודים

    קהילה 2- 5 קודקודים

    קהילה 3- 4 קודקודים

    קהילה 4- 4 קודקודים

    קהילה 5- 5 קודקודים

    קהילה 6- 3 קודקודים

    קהילה 7- 3 קודקודים
  3. modularity- 0.58
  
  ```
  ebc
  ```



### fastgreedy community

  1. רשת לפי קוד צבעים התואם את הקהילות
  ```sh
  fc <- fastgreedy.community(g)
  g2<-delete.edges(g, fc$removed.edges[seq(length=which.max(mods1)-1)])
  V(g)$color=clusters(g2)$membership
  g$layout <- layout.fruchterman.reingold
  png(filename="ga_plot_fastgreedy.png")
  plot(g)
  dev.off()
  ```
  
   ![alt tag](/ga_plot_fastgreedy.png)
  2. התקבלו 3 קהילות
  ```sh
  i=max(fc$membership)
  x=1
  while (x<=i)
  {
    t<-table(fc$membership)[x]
    print(t)
    x=x+1
  }
  ```
    קהילה 1- 10 קודקודים

    קהילה 2- 5 קודקודים

    קהילה 3- 4 קודקודים

    קהילה 4- 5 קודקודים
    
    קהילה 5- 5 קודקודים
    
    קהילה 6- 3 קודקודים
  3. modularity 0.59
  
  ```
  fc
  ```
