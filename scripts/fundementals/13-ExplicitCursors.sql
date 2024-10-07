
declare
  cursor c_emp is
    select * from employees where rownum < 2;

  cursor c_emp2(cp_empid employees.employee_id%type) is
    select *
      from employees
     where employee_id = cp_empid
       and rownum < 2
       for update of employee_id nowait;

  r_emp employees%rowtype;
begin
  --cursor açýlýr
  open c_emp;
  
  loop
    fetch c_emp
      into r_emp;
    exit when c_emp%notfound;
  
    dbms_output.put_line(r_emp.employee_id);
  
  end loop;

  dbms_output.put_line(c_emp%rowcount);
  close c_emp;

  if c_emp%isopen then
    close c_emp;
  end if;

  for r_emp in c_emp loop    
    dbms_output.put_line(r_emp.employee_id||','||r_emp.first_name);
  end loop;

  for r in (select * from employees) loop
  
    dbms_output.put_line(r.email);
  
    for r2 in c_emp2(r.employee_id) loop
    
      dbms_output.put_line(r2.employee_id||','||r2.first_name);
    
      update employees set salary = 1 where current of c_emp2;
      dbms_output.put_line(sql%rowcount || ' row updated');
    
    end loop;
  
  end loop;
  rollback;
end;
--select * from employees where employee_id = 197 for update
/*
begin
  for xxx in (select distinct department_id dpi from departments where department_id in (10, 20)) loop
  
    for r in (select * from employees where department_id = xxx.dpi) loop
      dbms_output.put_line(r.department_id||','||r.first_name);
    end loop;
    
  end loop;
end;
*/
