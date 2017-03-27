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
echo -n "changing to your home directory "
echo ~/
cd ~/


# removing old copies of files if they have been previously downloaded
rm -f LoanStats3*.csv.zip
rm -f LoanStats3*.csv
rm -f LoanStats_2016Q*.csv.zip
rm -f LoanStats_2016Q*.csv


# proceed to download all 7 files one at a time 

LD=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats3a.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats3a.csv.zip > /dev/null 2>&1
  echo "Downloaded LoanStats3a.csv.zip"
else
  echo "[Error] Could not download LoanStats3a.csv.zip. HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats3b.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats3b.csv.zip > /dev/null 2>&1
  echo "Downloaded LoanStats3b.csv.zip"
else
  echo "[Error] Could not download LoanStats3b.csv.zip. HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats3c.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats3c.csv.zip > /dev/null 2>&1
  echo "Downloaded LoanStats3c.csv.zip"
else
  echo "[Error] Could not download LoanStats3c.csv.zip. HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats3d.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats3d.csv.zip > /dev/null 2>&1
  echo "Downloaded LoanStats3d.csv.zip"
else
  echo "[Error] Could not download LoanStats3d.csv.zip. HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats_2016Q1.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats_2016Q1.csv.zip > /dev/null 2>&1
  echo "Downloaded LoanStats_2016Q1.csv.zip"
else
  echo "[Error] Could not download LoanStats_2016Q1.csv.zip  HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats_2016Q2.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats_2016Q2.csv.zip > /dev/null 2>&1
  echo "Downloaded LoanStats_2016Q2.csv.zip"
else
  echo "[Error] Could not download LoanStats_2016Q2.csv.zip  HTTP code $LD"
  exit
fi

LD=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' https://resources.lendingclub.com/LoanStats_2016Q3.csv.zip`

if [ "$LD" = "200" ]
then
  wget https://resources.lendingclub.com/LoanStats_2016Q3.csv.zip > /dev/null 2>&1
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
unzip LoanStats_2016Q2.csv.zip 
unzip LoanStats_2016Q3.csv.zip 

touch mldata.csv
cat LoanStats3a.csv | grep -v 'Notes offered by Prospectus' \
       | grep -v 'Total amount funded in policy code' > mldata.csv
       | grep -v 'Total amount funded in policy code' \
      | grep -v 'Total amount funded in policy code' \
      | grep -v 'Total amount funded in policy code' \
      'Notes offered by Prospectus' | \
      'Notes offered by Prospectus' | \
      'Notes offered by Prospectus' | \
      
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
sleep 1
sudo yum install -y mysql mysql-server
echo "Starting MySQL..."


      