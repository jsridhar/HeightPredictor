Predict child's height (95% confidence) using parents height
========================================================
author: Sri
date: 03/05/2017
autosize: true

### Developing Data Products - Course Project
### John Hopkins University



Summary
========================================================

Easy to use application to predict the child height based on parents height & child's gender.

- The prediction model is built using GaltonFamilies data in the HistData package. The HistData package provides small datasets on important histtory of statistics & data visualization. More info @ https://cran.r-project.org/web/packages/HistData/index.html

- Data set lists the individual observations for 934 children in 205 families on which Galton (1886) based his cross-tabulation. Source https://rdrr.io/rforge/HistData/man/GaltonFamilies.html

- Application is hosted @ https://jsridhar.shinyapps.io/heightpredictor/

Have fun!

Understanding the data
========================================================

The model for prediction is built using GaltonFamilies data in the HistData package. See below for a visual distribution of child height vs. mid parent height.

<img src="pitch-figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

Prediction model 
========================================================

Using sample heights of father, mother and gender of the child, the below demonstrations shows simple way to predict child height.


```r
fit <- lm(childHeight ~ mother+father+gender, data = GaltonFamilies)
predict.lm(fit, data.frame(mother=64, father=69, gender="male"), interval = "prediction")
```

```
       fit     lwr      upr
1 69.16946 64.9168 73.42213
```

References
========================================================

### HistData package https://cran.r-project.org/web/packages/HistData/index.html

### GaltonFamilies Data Description https://rdrr.io/rforge/HistData/man/GaltonFamilies.html

