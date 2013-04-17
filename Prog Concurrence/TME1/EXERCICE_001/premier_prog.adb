with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure premier_prog is
		res : Positive;
--function factorielle(n : Natural) return Positive is
  --fact : Positive;
  
--begin
--  fact := 1;
--  for i in 2..N loop
--    fact := fact*i;
--  end loop;
--  return fact;
--end factorielle;

-- Question 5
function factorielle(n : Natural) return Positive is
begin
  if n = 0 then
  		return 1;
  else
  		return  n * factorielle(n-1); 
  end if;
end factorielle;

nombre : integer;

-- Question 3.
--begin
	--put("Saisissez un entier : ");
  --	Get(nombre);
  --	while nombre <0 loop
  	--	put("Saisissez un nombre positif : ");
  	--	Get(nombre);
  	--end loop;
   --	res := factorielle(nombre);
  	--	Put("La factorielle de ");
  	--	Put(nombre,width => 2);
  	--	Put(" est ");
  	--	Put(res,width => 9);
  	--	New_Line;		  
--end premier_prog;

--Question 4
begin
  	put("Saisissez un entier : ");
  	Get(nombre);
  	while nombre >=0 loop  		
  		res := factorielle(nombre);
  		Put("La factorielle de ");
  		Put(nombre,width => 2);
  		Put(" est ");
  		Put(res,width => 9);
  		New_Line;
  		put("Saisissez un entier : ");
  		Get(nombre);
  	end loop;
   		  
end premier_prog;



