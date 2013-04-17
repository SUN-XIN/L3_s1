with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure premier_progQ3 is

  function factorielle(n : Natural) return Positive is
    fact : Positive;
  begin
    fact := 1;
    for i in 2..N loop
      fact := fact*i;
    end loop;
    return fact;
  end factorielle;

  res : Positive;
  nombre : integer;
  begin

	put("Saisissez un entier : ");
  	Get(nombre);
  	while nombre <0 loop
  		put("Saisissez un nombre positif : ");
  		Get(nombre);
  	end loop;
   	res := factorielle(nombre);
  		Put("La factorielle de ");
  		Put(nombre,width => 2);
  		Put(" est ");
  		Put(res,width => 9);
  		New_Line;		  
end premier_progQ3;
