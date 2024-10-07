create or replace type a_salarysum force as object
(
  g_bonus  number(8, 2),
  g_sumbonus  number(8, 2),
  g_return number(8, 2),

  static function odciaggregateinitialize(p_context in out a_salarysum) return number,

  member function odciaggregateiterate(self  in out a_salarysum,
                                       value in tyt_salarysum) return number,
  member function odciaggregateterminate(self        in a_salarysum,
                                         returnvalue out number,
                                         flags       in number) return number,
  member function odciaggregatemerge(self       in out a_salarysum,
                                     p_context2 in a_salarysum) return number
)
/
create or replace type body a_salarysum is
  static function odciaggregateinitialize(p_context in out a_salarysum) return number is
  begin
--    dbms_output.put_line('Initialize g_Return:' || p_context.g_return || ' g_bonus' || p_context.g_bonus);         
    p_context := a_salarysum(1000, 0, null);
    return odciconst.success;
  end;
  member function odciaggregateiterate(self  in out a_salarysum,
                                       value in tyt_salarysum) return number is
  begin
    dbms_output.put_line('Iterate Employee ID: ' || value.employee_id || ' Salary:' || value.salary||' g_bonus:' || self.g_bonus || ' g_sumbonus:'|| self.g_sumbonus);         
    
    
    
    if self.g_sumbonus + value.salary * 0.1 <= self.g_bonus then
      g_return := value.salary * 0.1;  
    else
      g_return := self.g_bonus - self.g_sumbonus;
    end if;
      
    self.g_sumbonus := self.g_sumbonus + g_return;
    
    return odciconst.success;
  end;
  member function odciaggregateterminate(self        in a_salarysum,
                                         returnvalue out number,
                                         flags       in number) return number is
  begin
   -- dbms_output.put_line('Terminate g_Return:' || self.g_return || ' g_bonus' || self.g_bonus || ' flags'||flags);         
    returnvalue := self.g_return;
    return odciconst.success;
  end;
  member function odciaggregatemerge(self       in out a_salarysum,
                                     p_context2 in a_salarysum) return number is
  begin
  --  dbms_output.put_line('Merge g_Return:' || self.g_return || ' g_bonus' || self.g_bonus);         
    self.g_return := self.g_return + p_context2.g_return;
    return odciconst.success;
  end;
end;
/
