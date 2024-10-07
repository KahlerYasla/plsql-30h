--job_id bazlý toplam 1000 tl yi geçmeyecek þekilde yüzde 10 bonus daðýtým hesabý
select CalcBonus(tyt_salarysum(t.employee_id, t.salary)) over(partition by t.job_id order by employee_id) bonus
      ,sum(t.salary) over(partition by t.job_id) salary_sum
      ,t.*
  from employees t
 where job_id = 'AD_ASST'




