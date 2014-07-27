MyApp : Short Overview
========================================================
author: GhisLain Landry
date: July 27 14
transition: rotate

<small>
Coursera Data Science Specialization<br>
Deloping Data product Module
</small>

Objective
========================================================

MyApp is a simple program that I developed in the context of the Developing Data products class. It serves the following purposes. 

- Illustrate features of Shiny
- Implement a simple prediction algorithm to predict a child height based on its parents' 
   - Two prediction models  (Note: they are pretty much the same)
        - An empiric prediction model
        - Linear regression based prediction model
  

Implementation details: Prediction models
========================================================
- Empirical model
  - The height of a child is predicted as the average of its perents' heigh plus or minus a constant depending on whether he is a girl or a boy..
- Linear regression based prediction model
  - Built from the galton data set available in R.(code for building the model)  

```r
require(UsingR)
data(galton)
fit <- lm(child ~ parent, data= galton)
summary(fit)$coef # display models coefficients
```

Implementation details: Prediction models (cont.)
========================================================


```
            Estimate Std. Error t value  Pr(>|t|)
(Intercept)  23.9415    2.81088   8.517 6.537e-17
parent        0.6463    0.04114  15.711 1.733e-49
```
Example: Predict the child height when the parent is 68 inches

```r
as.numeric(predict(fit, data.frame("parent" = c(68))))
```

```
[1] 67.89
```

MyApp: Usage 
========================================================
To use MyApp you should provide a few information:
- The heigh of at least one of your parents 
- Select the appropriate predictor
  - MyApp predicts using the empirical model when both predictors are selected.
- The submit button allows you to submit your initial query
  - Subsequent queries automaticaly update the display pannel with the information you entered and your predicted height
