select * from bank_loan_data

select count(id) as Total_NumberOf_Application from bank_loan_data

select count(id) as PMTD_Total_Loan_Application from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

select SUM(loan_amount) AS Total_Funded_Amount from bank_loan_data

select SUM(loan_amount) AS MTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 12 and year(issue_date) = 2021

select SUM(loan_amount) AS PMTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 11 and year(issue_date) = 2021

select SUM(total_payment) AS Total_Amount_Received from bank_loan_data

select SUM(total_payment) AS MTD_Total_Amount_Received from bank_loan_data
where Month(issue_date) = 12 and year(issue_date) = 2021

select SUM(total_payment) AS PMTD_Total_Amount_Received from bank_loan_data
where Month(issue_date) = 11 and year(issue_date) = 2021

select ROUND(AVG(int_rate)*100,5) AS Average_interast_Rate from bank_loan_data

select ROUND(AVG(int_rate)*100,5) AS MTD_Average_interast_Rate from bank_loan_data
where MONTH(issue_date) = 12 and year(issue_date) = 2021

select ROUND(AVG(int_rate)*100,5) AS PMTD_Average_interast_Rate from bank_loan_data
where MONTH(issue_date) = 11 and year(issue_date) = 2021

select ROUND(AVG(dti)*100,5) AS Average_Debt_to_Income_Ratio from bank_loan_data

select ROUND(AVG(dti)*100,5) AS MTD_Average_Debt_to_Income_Ratio from bank_loan_data
where MONTH(issue_date) = 12 and year(issue_date) = 2021

select ROUND(AVG(dti)*100,5) AS PMTD_Average_Debt_to_Income_Ratio from bank_loan_data
where MONTH(issue_date) = 11 and year(issue_date) = 2021

select 
(count(case when loan_status = 'Fully Paid' or loan_status = 'current' then id end)*100)/count(id) as Good_Loan_Percentage
from bank_loan_data

select count(id) as Good_Loan_Application 
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

select SUM(loan_amount) as Good_Loan_Funded_Amount
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

select SUM(total_payment) as Good_Loan_Total_Received_Amount
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'current'

select 
(count(case when loan_status = 'Charged off' then id end)*100)/count(id) as Bad_Loan_Percenatge
from bank_loan_data

select count(id) as Bad_Loan_Application 
from bank_loan_data
where loan_status = 'Charged off'  

select SUM(loan_amount) as Bad_Loan_Funded_Amount
from bank_loan_data
where loan_status = 'Charged off'

select SUM(total_payment) as Bad_Loan_Total_Received_Amount
from bank_loan_data
where loan_status = 'Charged off' 

select
loan_status,
count(id) as Total_loan_Application,
ROUND(AVG(dti)*100,5) AS Average_DTI,
ROUND(AVG(int_rate)*100,5) AS Average_Interast_Rate,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by loan_status

select 
address_state,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by address_state
order by address_state

select 
term,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by term
order by sum(total_payment)
 

 select 
emp_length,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by emp_length
order by count(id) desc

select 
purpose,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by purpose
order by count(id) desc

select 
home_ownership,
count(id) as Total_Loan_Application,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by home_ownership
order by count(id) desc