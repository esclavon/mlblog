#!/bin/bash
#--------------------------------------------------------------------------
#  ML-provision.sh
#
# This is the first script in the ML blog post
#
# At this point, we assume you are connected to the linux instance CLI. If you need help,
# go to this URL
#
# http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html
#
#  In this script, we will update the instance to the latest software, install mysql, check
# that all 7 CSV zip files are in your home folder, extract them, and consolidate them to one file.
#
#  don't forget to add execute permissions to all shell scripts to be able to run them
#  ex.    chmod +x ML-provision.sh
#
#--------------------------------------------------------------------------

# change to your home directory
clear
echo ""
echo ""
echo "Downloading files...."
cd ~/mlblog



# proceed to download all 7 files one at a time

LD=`curl -o /dev/null --silent --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats3a.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats3a.csv.zip
  echo "Downloaded LoanStats3a.csv.zip"
else
  echo "[Error] Could not download LoanStats3a.csv.zip. HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats3b.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats3b.csv.zip
  echo "Downloaded LoanStats3b.csv.zip"
else
  echo "[Error] Could not download LoanStats3b.csv.zip. HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats3c.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats3c.csv.zip
  echo "Downloaded LoanStats3c.csv.zip"
else
  echo "[Error] Could not download LoanStats3c.csv.zip. HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats3d.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats3d.csv.zip
  echo "Downloaded LoanStats3d.csv.zip"
else
  echo "[Error] Could not download LoanStats3d.csv.zip. HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats_2016Q1.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats_2016Q1.csv.zip
  echo "Downloaded LoanStats_2016Q1.csv.zip"
else
  echo "[Error] Could not download LoanStats_2016Q1.csv.zip  HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats_2016Q2.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats_2016Q2.csv.zip
  echo "Downloaded LoanStats_2016Q2.csv.zip"
else
  echo "[Error] Could not download LoanStats_2016Q2.csv.zip  HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats_2016Q3.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats_2016Q3.csv.zip
  echo "Downloaded LoanStats_2016Q3.csv.zip"
else
  echo "[Error] Could not download LoanStats_2016Q3.csv.zip  HTTP code $LD"
  exit
fi


echo ""
echo "All files downloaded"
echo ""


# extract the downloaded files
echo "Extracting all files...."
echo ""
unzip LoanStats3a.csv.zip
unzip LoanStats3b.csv.zip
unzip LoanStats3c.csv.zip
unzip LoanStats3d.csv.zip
unzip LoanStats_2016Q1.csv.zip
unzip LoanStats_2016Q2.csv.zip
unzip LoanStats_2016Q3.csv.zip

# create and empty file so we can combine all the different CSVs into one
echo "Creating mldata.csv...."
touch mldata.csv

# now, copy the file from the source CSV to the full csv
echo "Removing comments and consolidating CSVs..."
cat LoanStats3a.csv | grep -v 'Notes offered by Prospectus' | grep -v 'Total amount funded in policy code' > mldata.csv

# now, copy the 2nd file from the source CSV to the full csv
cat LoanStats3b.csv | grep -v 'Notes offered by Prospectus' | grep -v 'Total amount funded in policy code' | grep -v 'total_il_high_credit_limit' >> mldata.csv

# now, copy the 3rd file from the source CSV to the full csv
cat LoanStats3c.csv | grep -v 'Notes offered by Prospectus' | grep -v 'Total amount funded in policy code' | grep -v 'total_il_high_credit_limit' >> mldata.csv

# now, copy the 4th file from the source CSV to the full csv
cat LoanStats3d.csv | grep -v 'Notes offered by Prospectus' | grep -v 'Total amount funded in policy code' | grep -v 'total_il_high_credit_limit' >> mldata.csv

# now, copy the 5th file from the source CSV to the full csv
cat LoanStats_2016Q1.csv | grep -v 'Notes offered by Prospectus' | grep -v 'Total amount funded in policy code' | grep -v 'total_il_high_credit_limit' >> mldata.csv

# now, copy the 6th file from the source CSV to the full csv
cat LoanStats_2016Q2.csv | grep -v 'Notes offered by Prospectus' | grep -v 'Total amount funded in policy code' | grep -v 'total_il_high_credit_limit' >> mldata.csv

# now, copy the last file from the source CSV to the full csv
cat LoanStats_2016Q3.csv | grep -v 'Notes offered by Prospectus' | grep -v 'Total amount funded in policy code' |  grep -v 'total_il_high_credit_limit' >> mldata.csv

echo "Done. mldata.csv contains all the data now"
echo ""


#--------------------------------------------------------------------------
# Now, we need to install MySQL and create the database and tables we are going
# to use.
#--------------------------------------------------------------------------

echo ""
echo "Updating the instance...."
sleep 1
# update your instance
sudo yum update -y
# install mysql server and command line tools

echo "Installing MySQL..."
sleep 1
sudo yum install -y mysql mysql-server

# start the mysql server
echo "Starting MySQL..."
sudo service mysqld start


