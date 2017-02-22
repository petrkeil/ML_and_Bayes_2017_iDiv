xy <- read.csv("xy_data.csv")
xy

library(manipulate)

myplot <- function(xy, beta0, beta1, sigma)
{
  plot(xy)
  abline(a=beta0, b=beta1)
  
}

manipulate(
myplot(xy, beta0, beta1, sigma),
beta0 = slider(min=-10, max=10, step=0.01, initial=0),
beta1 = slider(min=-10, max=10, step=0.01, initial=0),
sigma = slider(min=0, max=5, step=0.01, initial=1)
)
