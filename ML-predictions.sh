#!/bin/bash
#--------------------------------------------------------------------------
#  ML-predictions.sh
#
# This is the 3rd script in the ML blog post
#
# At this point, we assume you are connected to the linux instance CLI and MySQL is 
# running
#
# In this script, we will download the predictions data generated from ML model into local 
# linux instance and upload into MySQL table r
# 
#  don't forget to add execute permissions to all shell scripts to be able to run them
#  ex.    chmod +x ML-predictions.sh
#
#--------------------------------------------------------------------------

# change to your home directory
clear
echo ""
echo ""
echo -n "changing to your home directory "
echo ~/
cd ~/

# download predictions data, replace <your_bucket> with the bucket name choosen
echo "Copy predictions file from S3 into Linux instance"
aws s3 cp s3://<your_bucket>/predictions/* predictions.csv

# Populate predictions table. Sustitute user name with loca name 
mysql -u root -e 'mysqlimport --fields-terminated-by=',' --local -u <username> -p 
predictions predictions.csv'

# Populate mldata_pred table 
echo "Populate the mldata_pred data"
mysql -u root -e 'INSERT INTO mldata_pred
  SELECT ml.*,pre.*,'Not-Match' 
  FROM mldata ml 
  INNER JOIN predictions pre 
  WHERE ml.id=pre.id ;'

# Now we are going to update the table and check each record and define whether the prediction 
# matched what really occurred or if it was incorrect

mysql -u root -e 'UPDATE mldata_pred
SET mldata_pred.match_status = 
   IF(mldata_pred.fail2pay=mldata_pred.bestAnswer, 'Matched', 'NotMatchedí);'

#---------------------------------------------------------------------------
# Once we matched the 2016 predictions with real data we download the table 
# in cvs format onto the local file system. Upload the file into S3 to 
# perform visualization using Quicksight
#---------------------------------------------------------------------------
# Check the number of row in mldata_pred table to verify the rows for visualization

echo "Number or rows in a table "
mysql -u root -e 'select count(*) from mldata_pred;'

# Download the results in CSV format from MySQL 

mysql -u suman -p --database=mldata -e "select * from mldata_pred” | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > mldata_pred.csv

# Validate the rows in the mldata_pred.csv file
# Note: 1 header row with column names is included in the cvs file

echo "Number of rows in a csv file"
wc -l mldata_pred.csv
