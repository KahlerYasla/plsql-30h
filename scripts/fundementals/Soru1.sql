--Gelen stringin(p_gstr) i�in gelen index numaras�na(p_i) ve p_ch da belirtilen ayraca g�re keserek i�eri�ini d�nen fonksiyonun yaz�lmas�.
/*A�a��da unit test i�in beklenen sonu�lar iletilmi�tir.
Senaryo                           Beklenen Sonu� 
String null , index null          null
String not null, index null       null  
String null, index not null       null  
String not null, index <= 0       null  
String '1', index 1               1
String '1', index >1              null
String '1a;2',index 1             1a
String '1av;2vs',index 2          2vs
String 'ali;ahmet;x', index 2     ahmet
String '1;2;3', index 4           null
*/

create or replace function isimsoyisimSubStr(p_gstr in varchar2, p_i in number, p_ch in varchar2 := ';') return varchar2 is
begin
  return null;
end;
/