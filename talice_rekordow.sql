

declare
 pracownik employees%rowtype;
 type pr_rec is record (imie varchar2(100),nazwisko varchar2(100));
 type t_pr is table of pr_rec index by BINARY_INTEGER;
 tabliczka t_pr;
 pr_upr pr_rec;
 cursor pracownicy is 
 (select * from employees) ;
begin
 open pracownicy;
 loop 
 fetch pracownicy into pracownik;
 exit when pracownicy%notfound;
 tabliczka(pracownicy%rowcount).imie:=pracownik.first_name;
 dbms_output.put_line(tabliczka(1).imie);
 end loop;
 close pracownicy;
end;
