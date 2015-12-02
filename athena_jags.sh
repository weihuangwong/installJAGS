#!/bin/bash

## =============
## Functions
## =============

ansYN() {
    echo -e "Please answer yes or no."
    }

## =============
## Variables
## =============
JAGSvers=4.0.1

while true; do
    read -p "\
@ Do you need to download JAGS?
[y/n]" yn
    case $yn in
        [Yy]* )
            mkdir ~/JAGS
            wget http://www.mit.edu/~wwong/17804/JAGS/JAGS-${JAGSvers}.tar.gz -P ~/JAGS
            break;;

        [Nn]* ) break;;
        * ) ansYN ;;
    esac
done
echo ""

while true; do
    read -p "\
@ Do you need to install JAGS?
[y/n]" yn
    case $yn in
        [Yy]* )            
            cd ~/JAGS
            tar xfvz JAGS-${JAGSvers}.tar.gz
            cd JAGS-${JAGSvers}
            export JAGS_HOME=$HOME/JAGS
            export PATH=$PATH:~/JAGS/bin
            ./configure --prefix=$JAGS_HOME
            make
            make install
            export PKG_CONFIG_PATH=~/JAGS/lib/pkgconfig
            break;;

        [Nn]* ) break;;
        * ) ansYN ;;
    esac
done
echo ""

while true; do
    read -p "\
@ Do you need to download rjags?
[y/n]" yn
    case $yn in
        [Yy]* ) 
            wget https://cran.r-project.org/src/contrib/rjags_4-4.tar.gz -P ~/JAGS
            break;;

        [Nn]* ) break;;
        * ) ansYN ;;
    esac
done
echo ""

while true; do
    read -p "\
@ Do you need to install rjags and R2jags?
[y/n]" yn
    case $yn in
        [Yy]* ) 
            R CMD BATCH ~/installJAGS/athena_jags.R
            break;;

        [Nn]* ) break;;
        * ) ansYN ;;
    esac
done
echo ""


