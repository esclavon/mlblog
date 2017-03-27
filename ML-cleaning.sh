#!/bin/bash
#--------------------------------------------------------------------------
#  ML-cleaning.sh
#
# This is the 2nd script in the ML blog post
#
# At this point, we assume you are connected to the linux instance CLI and MySQL is 
# running
#
#  In this script, we will setup the database and tables, insert the data, then clean the 
# data and dump it into the user's home folder
# 
#  don't forget to add execute permissions to all shell scripts to be able to run them
#  ex.    chmod +x ML-cleaning.sh
#
#--------------------------------------------------------------------------

# change to your home directory
clear
echo ""
echo ""
echo -n "changing to your home directory "
echo ~/
cd ~/

# Create the empty database mldata and create the table used on import
mysql -u root -e 'DROP DATABASE IF EXISTS `mldata`;'
mysql -u root -e 'CREATE DATABASE `mldata`;'
mysql -u root -e 'USE mldata;  CREATE TABLE `mldata` (


# is a convenient command line tool that lets you take a CSV and insert it into
# a MySQL database.

mysqlimport --fields-terminated-by=',' \
    --fields-enclosed-by='"' --local -u root mldata  mldata.csv

#----------------------------------------------------------------------------
# automatically for you. Please refer to the github link in the post to 
# download it.

mysql -u root  < ML-data-cleaner.sql

#----------------------------------------------------------------------------
# them into S3 for use with Machine Learning. 
#----------------------------------------------------------------------------


mysql -u root --database=mldata --batch -e \
    "SELECT * FROM mldata WHERE issue_d < '2016-01-01'" \
    mldata-final-2007-2015-cleaned-v3.0.csv  
    "SELECT * FROM mldata WHERE issue_d > '2015-12-31'" \

      