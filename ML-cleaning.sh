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
mysql -u root -e 'USE mldata;  CREATE TABLE `mldata` (  `id` int(11) DEFAULT NULL,  `member_id` int(11) DEFAULT NULL,  `loan_amnt` float DEFAULT NULL,  `funded_amnt` float DEFAULT NULL,  `funded_amnt_inv` float DEFAULT NULL,  `term` varchar(255) DEFAULT NULL,  `int_rate` varchar(10) DEFAULT NULL,  `installment` float DEFAULT NULL,  `grade` varchar(2) DEFAULT NULL,  `sub_grade` varchar(2) DEFAULT NULL,  `emp_title` varchar(255) DEFAULT NULL,  `emp_length` varchar(32) DEFAULT NULL,  `home_ownership` varchar(12) DEFAULT NULL,  `annual_inc` int(11) DEFAULT NULL,  `verification_status` varchar(64) DEFAULT NULL,  `issue_d` varchar(16) DEFAULT NULL,  `loan_status` varchar(32) DEFAULT NULL,  `pymnt_plan` varchar(8) DEFAULT NULL,  `url` varchar(255) DEFAULT NULL,  `desc` varchar(255) DEFAULT NULL,  `purpose` varchar(255) DEFAULT NULL,  `title` varchar(255) DEFAULT NULL,  `zip_code` varchar(5) DEFAULT NULL,  `addr_state` varchar(2) DEFAULT NULL,  `dti` float DEFAULT NULL,  `delinq_2yrs` int(11) DEFAULT NULL,  `earliest_cr_line` varchar(16) DEFAULT NULL,  `inq_last_6mths` int(11) DEFAULT NULL,  `mths_since_last_delinq` int(11) DEFAULT NULL,  `mths_since_last_record` int(11) DEFAULT NULL,  `open_acc` int(11) DEFAULT NULL,  `pub_rec` int(11) DEFAULT NULL,  `revol_bal` float DEFAULT NULL,  `revol_util` varchar(10) DEFAULT NULL,  `total_acc` int(11) DEFAULT NULL,  `initial_list_status` varchar(8) DEFAULT NULL,  `out_prncp` float DEFAULT NULL,  `out_prncp_inv` float DEFAULT NULL,  `total_pymnt` float DEFAULT NULL,  `total_pymnt_inv` float DEFAULT NULL,  `total_rec_prncp` float DEFAULT NULL,  `total_rec_int` float DEFAULT NULL,  `total_rec_late_fee` float DEFAULT NULL,  `recoveries` float DEFAULT NULL,  `collection_recovery_fee` float DEFAULT NULL,  `last_pymnt_d` varchar(32) DEFAULT NULL,  `last_pymnt_amnt` float DEFAULT NULL,  `next_pymnt_d` varchar(32) DEFAULT NULL,  `last_credit_pull_d` varchar(32) DEFAULT NULL,  `collections_12_mths_ex_med` int(11) DEFAULT NULL,  `mths_since_last_major_derog` int(11) DEFAULT NULL,  `policy_code` int(11) DEFAULT NULL,  `application_type` varchar(128) DEFAULT NULL,  `annual_inc_joint` varchar(255) DEFAULT NULL,  `dti_joint` varchar(255) DEFAULT NULL,  `verification_status_joint` varchar(255) DEFAULT NULL,  `acc_now_delinq` int(11) DEFAULT NULL,  `tot_coll_amt` varchar(255) DEFAULT NULL,  `tot_cur_bal` varchar(255) DEFAULT NULL,  `open_acc_6m` varchar(255) DEFAULT NULL,  `open_il_6m` varchar(255) DEFAULT NULL,  `open_il_12m` varchar(255) DEFAULT NULL,  `open_il_24m` varchar(255) DEFAULT NULL,  `mths_since_rcnt_il` varchar(255) DEFAULT NULL,  `total_bal_il` varchar(255) DEFAULT NULL,  `il_util` varchar(255) DEFAULT NULL,  `open_rv_12m` varchar(255) DEFAULT NULL,  `open_rv_24m` varchar(255) DEFAULT NULL,  `max_bal_bc` varchar(255) DEFAULT NULL,  `all_util` varchar(255) DEFAULT NULL,  `total_rev_hi_lim` varchar(255) DEFAULT NULL,  `inq_fi` varchar(255) DEFAULT NULL,  `total_cu_tl` varchar(255) DEFAULT NULL,  `inq_last_12m` varchar(255) DEFAULT NULL,  `acc_open_past_24mths` varchar(255) DEFAULT NULL,  `avg_cur_bal` varchar(255) DEFAULT NULL,  `bc_open_to_buy` varchar(255) DEFAULT NULL,  `bc_util` varchar(255) DEFAULT NULL,  `chargeoff_within_12_mths` int(11) DEFAULT NULL,  `delinq_amnt` int(11) DEFAULT NULL,  `mo_sin_old_il_acct` varchar(255) DEFAULT NULL,  `mo_sin_old_rev_tl_op` varchar(255) DEFAULT NULL,  `mo_sin_rcnt_rev_tl_op` varchar(255) DEFAULT NULL,  `mo_sin_rcnt_tl` varchar(255) DEFAULT NULL,  `mort_acc` varchar(255) DEFAULT NULL,  `mths_since_recent_bc` varchar(255) DEFAULT NULL,  `mths_since_recent_bc_dlq` varchar(255) DEFAULT NULL,  `mths_since_recent_inq` varchar(255) DEFAULT NULL,  `mths_since_recent_revol_delinq` varchar(255) DEFAULT NULL,  `num_accts_ever_120_pd` varchar(255) DEFAULT NULL,  `num_actv_bc_tl` varchar(255) DEFAULT NULL,  `num_actv_rev_tl` varchar(255) DEFAULT NULL,  `num_bc_sats` varchar(255) DEFAULT NULL,  `num_bc_tl` varchar(255) DEFAULT NULL,  `num_il_tl` varchar(255) DEFAULT NULL,  `num_op_rev_tl` varchar(255) DEFAULT NULL,  `num_rev_accts` varchar(255) DEFAULT NULL,  `num_rev_tl_bal_gt_0` varchar(255) DEFAULT NULL,  `num_sats` varchar(255) DEFAULT NULL,  `num_tl_120dpd_2m` varchar(255) DEFAULT NULL,  `num_tl_30dpd` varchar(255) DEFAULT NULL,  `num_tl_90g_dpd_24m` varchar(255) DEFAULT NULL,  `num_tl_op_past_12m` varchar(255) DEFAULT NULL,  `pct_tl_nvr_dlq` varchar(255) DEFAULT NULL,  `percent_bc_gt_75` varchar(255) DEFAULT NULL,  `pub_rec_bankruptcies` int(11) DEFAULT NULL,  `tax_liens` int(11) DEFAULT NULL,  `tot_hi_cred_lim` varchar(255) DEFAULT NULL,  `total_bal_ex_mort` varchar(255) DEFAULT NULL,  `total_bc_limit` varchar(255) DEFAULT NULL,  `total_il_high_credit_limit` varchar(255) DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1;'

#----------------------------------------------------------------------------# Now that the database is created, we need to import the CSV data. Mysqlimport
# is a convenient command line tool that lets you take a CSV and insert it into
# a MySQL database.

mysqlimport --fields-terminated-by=',' \
    --fields-enclosed-by='"' --local -u root mldata  mldata.csv

#----------------------------------------------------------------------------# Now we need to clean the data. We built you a MySQL script that will do it
# automatically for you. Please refer to the github link in the post to 
# download it.#----------------------------------------------------------------------------

mysql -u root  < ML-data-cleaner.sql

#----------------------------------------------------------------------------# Now we need to export both clean data sets into CSV format so we can import 
# them into S3 for use with Machine Learning. 
#----------------------------------------------------------------------------


mysql -u root --database=mldata --batch -e \
    "SELECT * FROM mldata WHERE issue_d < '2016-01-01'" \    | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > \
    mldata-final-2007-2015-cleaned-v3.0.csv  mysql -u root --database=mldata --batch -e \
    "SELECT * FROM mldata WHERE issue_d > '2015-12-31'" \    | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > mldata-final-2016-cleaned-v3.0.csv  

      