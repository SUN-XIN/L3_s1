with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;

procedure division is

  function division(dividende : integer; diviseur : integer) return integer is
  begin
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
    
	exception 
		when Constraint_Error=> Put_line("PB : division par zero!");
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
  exception 
	when Constraint_Error=> Put_line("PB : division par zero!");
    new_line;
  end calcul2;

begin
	calcul1;
    new_line;
	calcul2;
end division ;
