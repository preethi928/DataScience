#one tail one sample test 

x  <- c(0.593, 0.142, 0.329, 0.691, 0.231, 0.793, 0.519, 0.392, 0.418) 
t.test(x, alternative="greater", mu=0.3)
#alternative value is considered by understanding the question given.

#alpha= 0.05 (constant value), if P-value obtained is less then alpha value 
#then the H0 should be rejected and and Ha that is action should be taken .

# 2 tail 2 sample test
Control = c(91,87,99,77,88,91)
Treat = c( 101, 110, 103, 93, 99, 104) 
t.test(Control,Treat,alternative = "two.sided")
