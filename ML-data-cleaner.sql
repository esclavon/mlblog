
#
# Here are the SQL queries needed to scrub the data set. This file is fully 
# executable. If you pass it to the SQL engine (as shown below), it will
# clean everything up. It takes about 5-7 minutes to run on a large instance and
# it will take a little while longer to run on a t2.micro instance. This script
# needs the database mldata and the table also called mldata to be created prior
# to running. It also needs to have the data imported as per the blog.
#
# example usage:  [ec2-user@aws ~]$ mysql -u root  < ML_SQL_final.sql
#
#

# Switch to the correct database database (mldata)
#
USE mldata;
# Database changed


# There are some blank records we are deleting (i assume from blank lines 
# in the CSV)
#
DELETE FROM mldata where id = '0';

#
# Now we want to only look at complete loans. We removed the in process loans 
# because they had not matured and could not provide predictive value
#
DELETE FROM mldata 
WHERE loan_status != 'Fully Paid' 
  AND loan_status != 'Charged Off';

# We are converting loan date from string to date format so we can sort/qualify 
# with MySQL easier

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2007', '2007-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2007', '2007-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2007', '2007-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2007', '2007-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2007', '2007-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2007', '2007-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2007', '2007-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2007', '2007-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2007', '2007-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2007', '2007-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2007', '2007-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2007', '2007-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2008', '2008-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2008', '2008-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2008', '2008-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2008', '2008-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2008', '2008-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2008', '2008-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2008', '2008-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2008', '2008-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2008', '2008-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2008', '2008-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2008', '2008-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2008', '2008-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2009', '2009-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2009', '2009-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2009', '2009-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2009', '2009-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2009', '2009-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2009', '2009-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2009', '2009-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2009', '2009-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2009', '2009-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2009', '2009-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2009', '2009-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2009', '2009-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2010', '2010-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2010', '2010-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2010', '2010-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2010', '2010-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2010', '2010-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2010', '2010-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2010', '2010-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2010', '2010-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2010', '2010-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2010', '2010-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2010', '2010-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2010', '2010-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2011', '2011-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2011', '2011-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2011', '2011-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2011', '2011-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2011', '2011-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2011', '2011-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2011', '2011-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2011', '2011-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2011', '2011-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2011', '2011-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2011', '2011-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2011', '2011-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2012', '2012-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2012', '2012-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2012', '2012-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2012', '2012-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2012', '2012-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2012', '2012-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2012', '2012-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2012', '2012-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2012', '2012-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2012', '2012-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2012', '2012-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2012', '2012-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2013', '2013-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2013', '2013-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2013', '2013-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2013', '2013-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2013', '2013-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2013', '2013-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2013', '2013-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2013', '2013-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2013', '2013-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2013', '2013-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2013', '2013-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2013', '2013-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2014', '2014-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2014', '2014-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2014', '2014-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2014', '2014-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2014', '2014-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2014', '2014-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2014', '2014-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2014', '2014-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2014', '2014-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2014', '2014-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2014', '2014-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2014', '2014-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2015', '2015-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2015', '2015-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2015', '2015-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2015', '2015-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2015', '2015-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2015', '2015-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2015', '2015-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2015', '2015-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2015', '2015-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2015', '2015-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2015', '2015-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2015', '2015-12-01');

UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jan-2016', '2016-01-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Feb-2016', '2016-02-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Mar-2016', '2016-03-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Apr-2016', '2016-04-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'May-2016', '2016-05-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jun-2016', '2016-06-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Jul-2016', '2016-07-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Aug-2016', '2016-08-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Sep-2016', '2016-09-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Oct-2016', '2016-10-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Nov-2016', '2016-11-01');
UPDATE mldata SET issue_d = REPLACE(issue_d, 'Dec-2016', '2016-12-01'); 

# We are going to double check that all rows are in the correct format and 
# there aren’t any nonconforming records.
#
SELECT issue_d FROM mldata WHERE issue_d NOT LIKE '20%';

# There are whitespaces before and/or after the records and we need to remove 
# them
#
UPDATE mldata SET issue_d = TRIM(issue_d);

# We need to remove the percent sign from interest rate so that we can make it 
# numeric, not string
#
UPDATE mldata SET int_rate = REPLACE(int_rate, '%', '');

# Again, we need to remove extraneous whitespaces
#
UPDATE mldata SET int_rate = TRIM(int_rate);



# We need to remove the percent sign from the revolving credit utilization so 
# that we can make it numeric, not string
#
UPDATE mldata SET revol_util = REPLACE(revol_util, '%', '');

# We need to remove the white spaces from term
#
UPDATE mldata SET term = TRIM(term);

# We removed the month and converted earliest_cr_line to just year so the 
# format is just year
# 
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Jan-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Feb-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Mar-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Apr-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'May-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Jun-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Jul-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Aug-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Sep-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Oct-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Nov-', '');
UPDATE mldata SET earliest_cr_line = REPLACE(earliest_cr_line, 'Dec-', '');

# We need to remove the white spaces from ealriest_cr_line
#
UPDATE mldata SET term = TRIM(term);

# Check to make sure there are no null values
#
SELECT earliest_cr_line FROM mldata WHERE earliest_cr_line IS NULL;

# We are adding in the boolean target column for AWS machine learning
#
ALTER TABLE mldata ADD COLUMN `fail2pay` int(11) AFTER `total_il_high_credit_limit`;

# Now, we are going to populate the fail2pay column
#
# First, set them all to zero.
#
UPDATE mldata SET fail2pay = '0';  

# Now, set the loans to 1 if they defaulted
#
UPDATE mldata SET fail2pay = '1' WHERE loan_status = 'Charged Off';

# We found some records to have excessively high incomes. They looked fishy and
# we presumed they may be typos. We chose $430,000 because that is the top 1% of # incomes in the USA in 2013. Anything above that is an outlier.
#
DELETE FROM mldata WHERE annual_inc > '430000';

# We removed the month and converted last_credit_pull_d to just year
#
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Jan-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Feb-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Mar-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Apr-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'May-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Jun-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Jul-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Aug-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Sep-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Oct-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Nov-', '');
UPDATE mldata SET last_credit_pull_d = REPLACE(last_credit_pull_d, 'Dec-', '');

# We deleted blank records
#
DELETE FROM mldata WHERE last_credit_pull_d = '';


# We dropped unnecessary columns. We chose to only use the columns that were 
# available to investors when deciding on funding a loan.
#
ALTER TABLE `mldata`.`mldata` DROP COLUMN `id`, DROP COLUMN `member_id`, DROP COLUMN `loan_amnt`, DROP COLUMN `funded_amnt`, DROP COLUMN `funded_amnt_inv`, DROP COLUMN `int_rate`, DROP COLUMN `url`, DROP COLUMN `emp_title`, DROP COLUMN `pymnt_plan`, DROP COLUMN `desc`, DROP COLUMN `title`, DROP COLUMN `initial_list_status`, DROP COLUMN `out_prncp`, DROP COLUMN `out_prncp_inv`, DROP COLUMN `total_pymnt`, DROP COLUMN `total_pymnt_inv`, DROP COLUMN `total_rec_prncp`, DROP COLUMN `total_rec_int`, DROP COLUMN `total_rec_late_fee`, DROP COLUMN `recoveries`, DROP COLUMN `collection_recovery_fee`, DROP COLUMN `last_pymnt_d`, DROP COLUMN `last_pymnt_amnt`, DROP COLUMN `next_pymnt_d`, DROP COLUMN `policy_code`, DROP COLUMN `application_type`, DROP COLUMN `annual_inc_joint`, DROP COLUMN `dti_joint`, DROP COLUMN `verification_status_joint`, DROP COLUMN `acc_now_delinq`, DROP COLUMN `tot_coll_amt`, DROP COLUMN `tot_cur_bal`, DROP COLUMN `open_acc_6m`, DROP COLUMN `open_il_6m`, DROP COLUMN `open_il_12m`, DROP COLUMN `open_il_24m`, DROP COLUMN `mths_since_rcnt_il`, DROP COLUMN `total_bal_il`, DROP COLUMN `il_util`, DROP COLUMN `open_rv_12m`, DROP COLUMN `open_rv_24m`, DROP COLUMN `max_bal_bc`, DROP COLUMN `all_util`, DROP COLUMN `total_rev_hi_lim`, DROP COLUMN `inq_fi`, DROP COLUMN `total_cu_tl`, DROP COLUMN `inq_last_12m`, DROP COLUMN `acc_open_past_24mths`, DROP COLUMN `avg_cur_bal`, DROP COLUMN `bc_open_to_buy`, DROP COLUMN `bc_util`, DROP COLUMN `mo_sin_old_il_acct`, DROP COLUMN `mo_sin_old_rev_tl_op`, DROP COLUMN `mo_sin_rcnt_rev_tl_op`, DROP COLUMN `mo_sin_rcnt_tl`, DROP COLUMN `mort_acc`, DROP COLUMN `mths_since_recent_bc`, DROP COLUMN `mths_since_recent_bc_dlq`, DROP COLUMN `mths_since_recent_inq`, DROP COLUMN `mths_since_recent_revol_delinq`, DROP COLUMN `num_accts_ever_120_pd`, DROP COLUMN `num_actv_bc_tl`, DROP COLUMN `num_actv_rev_tl`, DROP COLUMN `num_bc_sats`, DROP COLUMN `num_bc_tl`, DROP COLUMN `num_il_tl`, DROP COLUMN `num_op_rev_tl`, DROP COLUMN `num_rev_accts`, DROP COLUMN `num_rev_tl_bal_gt_0`, DROP COLUMN `num_sats`, DROP COLUMN `num_tl_120dpd_2m`, DROP COLUMN `num_tl_30dpd`, DROP COLUMN `num_tl_90g_dpd_24m`, DROP COLUMN `num_tl_op_past_12m`, DROP COLUMN `pct_tl_nvr_dlq`, DROP COLUMN `percent_bc_gt_75`, DROP COLUMN `tot_hi_cred_lim`, DROP COLUMN `total_bal_ex_mort`, DROP COLUMN `total_bc_limit`, DROP COLUMN `total_il_high_credit_limit`, DROP COLUMN `verification_status`, DROP COLUMN `loan_status`, DROP COLUMN `last_credit_pull_d`, DROP COLUMN `chargeoff_within_12_mths`, DROP COLUMN `pub_rec_bankruptcies`, DROP COLUMN `tax_liens`;



# We are dropping records with empty values from revol_util column
#
SELECT COUNT(revol_util) FROM mldata WHERE revol_util = '';
# +-------------------+
# | count(revol_util) |
# +-------------------+
# |               308 |
# +-------------------+
# 1 row in set (0.19 sec)
#
#
DELETE FROM mldata WHERE revol_util = '';

# This is our final record count of 471540 including 2016 data points
#
SELECT COUNT(*) FROM mldata;
# +----------+
# | count(*) |
# +----------+
# |   471540 |
# +----------+
# 1 row in set (0.00 sec)


#  Add a few indices and alter columns for speed 
#
ALTER TABLE `mldata`.`mldata` CHANGE COLUMN `issue_d` `issue_d` date DEFAULT NULL;
ALTER TABLE `mldata`.`mldata` ADD INDEX `issue_d` (`issue_d`) comment '';
ALTER TABLE `mldata`.`mldata` CHANGE COLUMN `id` `id` int(11) NOT NULL, ADD PRIMARY KEY (`id`);
ALTER TABLE `mldata`.`predictions` ADD PRIMARY KEY (`id`), ADD INDEX `bestAnswer` (`bestAnswer`) comment '', ADD INDEX `score` (`score`) comment '', ADD INDEX `idXscore` (`id`, `score`) comment '', ADD INDEX `idXba` (`id`, `bestAnswer`) comment '', ADD INDEX `all3` (`id`, `bestAnswer`, `score`) comment '';


# This is the query we used to get 2007-2015 data set for modeling
#
# SELECT id, term, installment, grade, sub_grade, emp_length, home_ownership,
#       annual_inc, purpose, zip_code, addr_state, dti, delinq_2yrs,
#       earliest_cr_line, inq_last_6mths, mths_since_last_delinq, 
#       mths_since_last_record, open_acc, pub_rec, revol_bal, revol_util,
#       total_acc, collections_12_mths_ex_med, mths_since_last_major_derog,
#       delinq_amnt, fail2pay
# FROM mldata
# WHERE issue_d < '2016-01-01';


# This is the query we used to get the 2016 data for batch predictions 
#
# SELECT id, term, installment, grade, sub_grade, emp_length, home_ownership,
#       annual_inc, purpose, zip_code, addr_state, dti, delinq_2yrs,
#       earliest_cr_line, inq_last_6mths, mths_since_last_delinq, 
#       mths_since_last_record, open_acc, pub_rec, revol_bal, revol_util,
#       total_acc, collections_12_mths_ex_med, mths_since_last_major_derog,
#       delinq_amnt
# FROM mldata
# WHERE issue_d > '2015-12-31';



#---------------------------------------------------------------------------
# Once we completed the model and created a batch of predictions, we need to 
# process them and put the results back into MySQL for QuickSight
#---------------------------------------------------------------------------
#
# Download the results in CSV format from S3 and edit it to remove the top row 
# with column names
#
# Create the table to store the results
#
CREATE TABLE `mldata`.`predictions` (
	`id` int(11) NOT NULL,
	`bestAnswer` binary(1) NOT NULL,
	`score` float(2,10)
) COMMENT='';

# On the linux CLI, import the CSV into the new table
#
# mysqlimport --fields-terminated-by=',' --local -u mldata -p 
# --host=mldata2.clvnregvkdyn.us-east-1.rds.amazonaws.com --port=3306 
# predictions predictions.csv


# Now we are going to clone the mldata table and add in the 2016 predictions 
# 
CREATE TABLE mldata_pred LIKE mldata;

# Once the table is copied, we need to alter it and add in the columns we will 
# use for the prediction results.
#
ALTER TABLE mldata_pred
ADD COLUMN `id_pred` INT(11) NOT NULL AFTER `fail2pay`,
ADD COLUMN `bestAnswer` BINARY(1) NOT NULL AFTER `id_pred`,
ADD COLUMN `score` FLOAT(2,10) AFTER `bestAnswer`,
ADD COLUMN `match_status` VARCHAR(10) AFTER `score`;

# Now, populate the new columns from the mldata table. This will be the table we 
# use for QuickSight

INSERT INTO mldata_pred
  SELECT ml.*,pre.*,'Not-Match' 
  FROM mldata ml 
  INNER JOIN predictions pre 
  WHERE ml.id=pre.id ; 

# Now we are going to update the table and check each record and define whether the prediction matched what really occurred or if it was incorrect
#
UPDATE mldata_pred
SET mldata_pred.match_status = 
   IF(mldata_pred.fail2pay=mldata_pred.bestAnswer, 'Matched', 'NotMatched');


