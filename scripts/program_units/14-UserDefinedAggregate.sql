--job_id bazl� toplam 1000 tl yi ge�meyecek �ekilde y�zde 10 bonus da��t�m hesab�
select CalcBonus(tyt_salarysum(t.employee_id, t.salary)) over(partition by t.job_id order by employee_id) bonus
      ,sum(t.salary) over(partition by t.job_id) salary_sum
      ,t.*
  from employees t
 where job_id = 'AD_ASST'




