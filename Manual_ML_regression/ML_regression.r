xy <- read.csv("https://raw.githubusercontent.com/petrkeil/ML_and_Bayes_2017_iDiv/master/Manual_ML_regression/xy_data.csv")

xy

library(manipulate)

myplot <- function(xy, beta0, beta1, sigma)
{
  
  # new.x <- seq(0, 10, by=0.1)
  x <-xy$x
  mean.y <- beta0 + beta1*x
  low.y  <- qnorm(0.025, mean.y, sigma)
  up.y <- qnorm(0.975, mean.y, sigma)
  
  neg.ll <- - sum(dnorm(xy$y, mean=mean.y, sd=sigma, log=TRUE))
  
  plot(xy)
  
  lines(new.x, mean.y, col="red")
  lines(new.x, low.y, lty=2, col="red")
  lines(new.x, up.y, lty=2, col="red")
  
}

manipulate(
myplot(xy, beta0, beta1, sigma),
beta0 = slider(min=-10, max=10, step=0.01, initial=3),
beta1 = slider(min=-10, max=10, step=0.01, initial=4),
sigma = slider(min=0, max=5, step=0.01, initial=0.1)
)
