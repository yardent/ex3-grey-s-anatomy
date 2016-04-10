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

![alt tag](/ga_plot.png)

##למי מהשחקנים יש את מדד המרכזיות הגבוה ביותר:
1. Betweeness- "sloan"
![alt tag](/ga_plot_betweenness.png)  
2. Closeness- "torres"
![alt tag](/ga_plot_closeness.png)
3. Eigenceetor- "karev"
![alt tag](/ga_plot_evcent.png)


##זיהוי קהילות

### Grivan-Newman algorithm

  1. רשת לפי קוד צבעים התואם את הקהילות
  
   ![alt tag](/ga_plot_Grivan-Newman.png)
  2. התקבלו 7 קהילות
  
    קהילה 1- 8 קודקודים

    קהילה 2- 5 קודקודים

    קהילה 3- 4 קודקודים

    קהילה 4- 4 קודקודים

    קהילה 5- 5 קודקודים

    קהילה 6- 3 קודקודים

    קהילה 7- 3 קודקודים
  3. modularity max-0.5774221
  
    ![alt tag](/ga_mod_Grivan-Newman.png)



### fastgreedy community

  1. רשת לפי קוד צבעים התואם את הקהילות
  
   ![alt tag](/ga_plot_fastgreedy.png)
  2. התקבלו 3 קהילות
  
    קהילה 1- 24 קודקודים

    קהילה 2- 5 קודקודים

    קהילה 3- 3 קודקודים
  3. modularity max-0.3044983
  
    ![alt tag](/ga_mod_fastgreedy.png)
