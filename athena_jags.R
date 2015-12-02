## R source to install rjags

install.packages("~/JAGS/rjags_4-4.tar.gz", repos=NULL, type="source",
	configure.args="--with-jags-prefix=~/JAGS --enable-rpath")

install.packages("R2jags", repos="https://cran.rstudio.com")