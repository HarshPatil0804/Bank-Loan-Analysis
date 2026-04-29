select * from bank_loan_data

--Total Loan Application
select count(id) as Total_Loan_Application from bank_loan_data


--MTD Total Loan Application
select count(id) as MTD_Total_Loan_Application from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021


--PMTD Total Loan Application
select count(id) as PMTD_Total_Loan_Application from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021


--Total Funded Amoun
select SUM(loan_amount) AS Total_Funded_Amount from bank_loan_data


--MTD Total Funded Amoun
select SUM(loan_amount) AS MTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 12 and year(issue_date) = 2021


--PMTD Total Funded Amoun
select SUM(loan_amount) AS PMTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 11 and year(issue_date) = 2021


--Total Amount Received
select SUM(total_payment) AS Total_Amount_Received from bank_loan_data


--MTD Total Amount Received
select SUM(total_payment) AS MTD_Total_Amount_Received from bank_loan_data
where Month(issue_date) = 12 and year(issue_date) = 2021


--PMTD Total Amount Received
select SUM(total_payment) AS PMTD_Total_Amount_Received from bank_loan_data
where Month(issue_date) = 11 and year(issue_date) = 2021


--Average Interast Rate 
select ROUND(AVG(int_rate)*100,5) AS Average_interast_Rate from bank_loan_data


--MTD Average Interast Rate 
select ROUND(AVG(int_rate)*100,5) AS MTD_Average_interast_Rate from bank_loan_data
where MONTH(issue_date) = 12 and year(issue_date) = 2021


--PMTD Average Interast Rate 
select ROUND(AVG(int_rate)*100,5) AS PMTD_Average_interast_Rate from bank_loan_data
where MONTH(issue_date) = 11 and year(issue_date) = 2021


--Average Debt to Income_Ratio
select ROUND(AVG(dti)*100,5) AS Average_Debt_to_Income_Ratio from bank_loan_data


--MTD Average Debt to Income_Ratio
select ROUND(AVG(dti)*100,5) AS MTD_Average_Debt_to_Income_Ratio from bank_loan_data
where MONTH(issue_date) = 12 and year(issue_date) = 2021


--PMTD Average Debt to Income_Ratio
select ROUND(AVG(dti)*100,5) AS PMTD_Average_Debt_to_Income_Ratio from bank_loan_data
where MONTH(issue_date) = 11 and year(issue_date) = 2021


--Good Loan Percentage
select 
(count(case when loan_status = 'Fully Paid' or loan_status = 'current' then id end)*100)/count(id) as Good_Loan_Percentage
from bank_loan_data


--Good Loan Application
select count(id) as Good_Loan_Application 
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'


--Good Loan Funded Amount
select SUM(loan_amount) as Good_Loan_Funded_Amount
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'


--Good Loan Total Received Amount
select SUM(total_payment) as Good_Loan_Total_Received_Amount
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'


--Bad Loan Percenatge
select 
(count(case when loan_status = 'Charged off' then id end)*100)/count(id) as Bad_Loan_Percenatge
from bank_loan_data


--Bad Loan Application
select count(id) as Bad_Loan_Application 
from bank_loan_data
where loan_status = 'Charged off'  


--BadLoan Funded Amount
select SUM(loan_amount) as Bad_Loan_Funded_Amount
from bank_loan_data
where loan_status = 'Charged off'


--Bad Loan Total Received Amount
select SUM(total_payment) as Bad_Loan_Total_Received_Amount
from bank_loan_data
where loan_status = 'Charged off' 


--Loan Status
select
loan_status,
count(id) as Total_loan_Application,
ROUND(AVG(dti)*100,5) AS Average_DTI,
ROUND(AVG(int_rate)*100,5) AS Average_Interast_Rate,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by loan_status


--Month Analysis 
select 
MONTH(issue_date) AS Month_NO, 
DATENAME(MONTH, issue_date) as Month_Name, 
count(id) as Total_Loan_Application, 
sum(loan_amount) as Total_Funded_Amount, 
sum(total_payment) as Total_Received_Amount 
from bank_loan_data 
group by MONTH(issue_date), DATENAME(MONTH, issue_date) 
order by MONTH(issue_date) 


--Regional Analysis
select 
address_state,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by address_state
order by address_state


--Loan Term Analysis
select 
term,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by term
order by sum(total_payment)
 

--Employee Length Analysis
select 
emp_length,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by emp_length
order by count(id) desc


--Loan Purpose Analysis
select 
purpose,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by purpose
order by count(id) desc


--Home OwnerShip Analysis
select 
home_ownership,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by home_ownership
order by count(id) desc