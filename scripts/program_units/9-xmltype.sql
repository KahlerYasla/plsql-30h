create or replace force type "practice_typ" as object (
"id"  number(22),
"name"  varchar2(50),
constructor function "practice_typ"  return self as result 
);


CREATE OR REPLACE force TYPE BODY "practice_typ" is
  constructor FUNCTION "practice_typ" RETURN self AS result is
  BEGIN
    RETURN;
  END; 
END;


declare
  typ_practice "practice_typ" := "practice_typ"(1,'OZan');
begin
  typ_practice."id" := 1;
  dbms_output.put_line( typ_practice."name");
end;



declare
 
  typ_practice "practice_typ" := "practice_typ"();
  xmln        xmltype;

begin
  
 
  typ_practice."name" := 'Test';
  typ_practice."id" := 1;
  

  xmln := xmltype.createxml(typ_practice);
  dbms_output.put_line(xmln.getstringval());

end;



declare
  v_xml varchar2(32000) := '<practice_typ><id>2</id><name>Test</name></practice_typ>';
  typ_practice "practice_typ";
  xmln        xmltype;
begin
  xmln := xmltype.createxml(v_xml);
  
  xmln.toObject(typ_practice);
  
  dbms_output.put_line( typ_practice."id");
  
end;


create or replace type "practice_tyl" as table of "practice_typ";

create or replace type "practices_typ" as object
(
"practices" "practice_tyl"
);


declare
  typ_practice  "practice_typ";
  tyl_practice  "practice_tyl";
  typ_practices "practices_typ";
  v_xmltype     xmltype;

begin
  typ_practice := "practice_typ"(1, 'Practice');
  v_xmltype    := xmltype.createxml(typ_practice);
  dbms_output.put_line(v_xmltype.getstringval());


  --type oluþtu
  tyl_practice := "practice_tyl"();
  tyl_practice.extend;
  tyl_practice(1) := typ_practice;
  tyl_practice.extend;
  tyl_practice(2) := "practice_typ"(2, 'Practice 2');

  typ_practices := "practices_typ"(tyl_practice);

  v_xmltype := xmltype.createxml(typ_practices);
  dbms_output.put_line(v_xmltype.getstringval());

  dbms_output.put_line('First Loop-----');
  for r in (select * from table(tyl_practice)) loop
    dbms_output.put_line(r."id" || ',' || r."name");
  end loop;
  
  for r in (select * from table(typ_practices."practices")) loop
    dbms_output.put_line(r."id" || ',' || r."name");
  end loop;
  

  select cast(multiset (select "practice_typ"(employee_id, first_name) from employees) as "practice_tyl")
    into tyl_practice
    from dual;

  dbms_output.put_line('Second Loop-----');
  for r in (select * from table(tyl_practice)) loop
    dbms_output.put_line(r."id" || ',' || r."name");
  end loop;

  dbms_output.put_line('Third Loop-----');
  select "practice_typ"(employee_id, first_name) bulk collect into tyl_practice from employees;
  for r in (select * from table(tyl_practice)) loop
    dbms_output.put_line(r."id" || ',' || r."name");
  end loop;
end;

create or replace function objectarray_test return  "practice_tyl" is
tyl_practice "practice_tyl";
begin
 select "practice_typ"(employee_id, first_name) bulk collect into tyl_practice from employees;

  return tyl_practice;
end;  



SELECT extractvalue(x.rowdetail, 'HES_ROW/SID/text()') SID,   extractvalue(x.rowdetail, 'HES_ROW/SID/text()') SN
  FROM (select xmltype('<?xml version="1.0"?>
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <soap:Body>
    <totalFundListByContractResponse xmlns="http://tempuri.org/">
      <totalFundListByContractResult>
        <HES_HEADER xmlns="">
          <HESAPTAR>30.01.2021</HESAPTAR>
          <PAGENUM>1/575</PAGENUM>
          <HES_LIST>
            <HES_ROW>
              <SID>921206</SID>
              <SN>1991</SN>
              <SFN>0</SFN>
              <TFP>1443.21</TFP>
              <FK>101</FK>
              <RNUM>1000</RNUM>
            </HES_ROW>
            <HES_ROW>
              <SID>921207</SID>
              <SN>1992</SN>
              <SFN>0</SFN>
              <TFP>1443.21</TFP>
              <FK>101</FK>
              <RNUM>1000</RNUM>
            </HES_ROW>            
          </HES_LIST>
        </HES_HEADER>
      </totalFundListByContractResult>
    </totalFundListByContractResponse>
  </soap:Body>
</soap:Envelope>') xmlcol
           from dual) t
      ,XMLTable(xmlnamespaces('http://www.w3.org/2003/05/soap-envelope' as "soap",
                              'http://www.w3.org/2001/XMLSchema-instance' as "xsi",
                              'http://www.w3.org/2001/XMLSchema' as "xsd",
                              'http://tempuri.org/' as "k",
                              default ''),
                '/soap:Envelope/soap:Body/k:totalFundListByContractResponse/k:totalFundListByContractResult/HES_HEADER/HES_LIST/HES_ROW'
                passing t.xmlcol columns rowdetail xmltype path '/') x



