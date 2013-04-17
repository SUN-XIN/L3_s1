with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;

procedure division is
	div_zero:exception;
  function division(dividende : integer; diviseur : integer) return integer is
  begin
    if diviseur=0 then raise div_zero;
    end if;
    return dividende/diviseur;

  end division;

  procedure calcul1 is
  a,b : integer ;
  begin 
	put_line("Calcul1");
    put_line("Saisie du dividende");
    get(a);
    put_line("Saisie du diviseur");
    get(b);
    put_line(integer'image(a)&"/"&integer'image(b)&"="&integer'image(division(a,b)));
    new_line;	
  end calcul1;

  procedure calcul2 is
  a,b,c : integer ;
  begin 
	put_line("Calcul2");
    put_line("Saisie du dividende 1");
    get(a);
    put_line("Saisie du dividende 2");
    get(b);
    put_line("Saisie du diviseur 2");
    get(c);
    put_line(integer'image(a) & "/(" & integer'image(b) & "/" & integer'image(c)
                              & ") =" & integer'image(division(a,division(b,c))));
    new_line;
  end calcul2;

begin
	calcul1;  
    new_line;
	calcul2;
	exception 
	when div_zero => Put_line("PB : division par zero!");
end division ;
