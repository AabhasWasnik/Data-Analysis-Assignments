
# AABHAS WASNIK 

# Q1 -   		Show the orderNumber, status and comments from orders table for shipped status only.
#               If some comments are having null values then show them as “-“.

SELECT orderNumber , status , ifnull(comments , '-') as comments 
from orders 
where status = 'Shipped' 

# Q2 -          Select employee number, first name, job title and job title abbreviation from employees table based on following conditions.
#               If job title is one among the below conditions, then job title abbreviation column should show below forms.
#               ●	President then “P”
#               ●	Sales Manager / Sale Manager then “SM”
#               ●	Sales Rep then “SR”
#               ●	Containing VP word then “VP”
 	
select employeeNumber ,firstName ,jobTitle,
 case 
      when jobTitle = 'President' then 'p'
	  when jobTitle in('Sales Manager (APAC)','Sale Manager (EMEA)' , 'Sales Manager (NA)' ) then 'SM'
      when jobTitle = 'Sales Rep'  then 'SR'
      when jobTitle like '%VP%' then 'VP'
End as job_title_abbreviation
from employees
order by  job_title_abbreviation;