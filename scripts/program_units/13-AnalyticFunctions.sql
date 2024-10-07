--intro
select count(*) from employees t;
select count(*) over () from employees t;
select t.*, count(*) over () total_count from employees t;

--partition by
select job_id, sum(salary), count(*) from employees t group by job_id;
select  t.*, count(*) over (partition by job_id) job_count, sum(salary) over (partition by job_id) job_salary from employees t 

--order by
select  t.*, count(*) over () job_count, sum(salary) over () job_salary from employees t ;
select  t.*, count(*) over (order by job_id) job_count, sum(salary) over (order by job_id) job_salary from employees t 


--Partition By + Order By
select  t.*, count(*) over (partition by job_id order by job_id) job_count, sum(salary) over (partition by job_id order by job_id) job_salary from employees t ;
select  t.*, count(*) over (partition by job_id order by employee_id) job_count, sum(salary) over (partition by job_id order by employee_id) job_salary from employees t ;
select  t.*, count(*) over (partition by job_id order by manager_id) job_count, sum(salary) over (partition by job_id order by manager_id) job_salary from employees t; 


--filtering

--error
select  t.* from employees t where sum(salary) over (partition by job_id) > 10000;

select *
  from (select t.*
              ,sum(salary) over(partition by job_id) job_salary
          from employees t)
 where job_salary > 10000

--windowing,sliding
/*
default olarak 
range between unbounded preceding and current row 
çalýþýr
*/
      
--jobid bazýnda toplar
select t.*
      ,count(*) over(order by job_id) job_count
      ,sum(salary) over(order by job_id ) job_salary
  from employees t
  order by job_id;
  
--sýrayla toplar  
select t.*
      ,count(*) over(order by job_id rows between unbounded preceding and current row) job_count
      ,sum(salary) over(order by job_id rows between unbounded preceding and current row) job_salary
  from employees t
  order by job_id;
  
  --bir öncekini toplamý bir sonraki ile artarak toplar
  select t.*
      ,count(*) over(order by job_id rows between unbounded preceding and 1 following) job_count
      ,sum(salary) over(order by job_id rows between unbounded preceding and 1 following) job_salary
  from employees t
  order by job_id;
  
 --hep bir öncekini toplar
  select t.*
      ,count(*) over(order by job_id rows between 1 preceding and current row) job_count
      ,sum(salary) over(order by job_id rows between 1 preceding and current row) job_salary
  from employees t
  order by job_id;
  

--Previous and Next Values
select t.*,
       lag (t.employee_id) over ( order by employee_id) pre_employee_id,
       lead (t.employee_id) over ( order by employee_id) next_employee_id
from   employees t;

--First and Last Values  
select t.*
      ,first_value(first_name || ' ' || last_name) over(partition by job_id order by employee_id) as first_employee
      --default windowing clause stops at current row
      ,last_value(first_name || ' ' || last_name) over(partition by job_id order by employee_id) as last_employee
      ,last_value(first_name || ' ' || last_name) over(partition by job_id order by employee_id range between current row and unbounded following) as last_employee
      ,first_value(first_name || ' ' || last_name) over(partition by job_id order by employee_id desc) as last_employee2
  from employees t;

--Row number,Dense-rank, rank

/*
Row_number - her bir row yeni rakam üretir
Rank - Ayný deðere sahip rowlar ayný deðeri üretir. 
Dense_rank - Ayný deðere sahip rowlar ayný deðeri üretir. Fakat arada gap olmaz.

*/


select t.*
      ,row_number() over(order by job_id) rn
      ,rank() over(order by job_id) rk
      ,dense_rank() over(order by job_id) dr
  from employees t;
