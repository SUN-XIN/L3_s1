with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Matrice is
  
  -- procedure d'initialisation d'une matrice par saisie des valeurs au clavier
  -- l'initialisation doit se faire ligne par ligne
  procedure Initialiser_Une_Matrice(Matrice: in out Une_Matrice_Entiere) is
  
   nombre : integer;
   begin
  	for I in Matrice'range(1) loop
  		for J in Matrice'range(2) loop  			
  			Get(nombre);
  			Matrice(I, J) := nombre;
  		end loop;
  	end loop;
  			
  end Initialiser_Une_Matrice;

  -- procedure d'affichage d'une matrice 
  procedure Afficher_Une_Matrice(Matrice : in Une_Matrice_Entiere) is
    begin 
    for I in Matrice'range(1) loop
    	for J in Matrice'range(2) loop    	
    		put(Matrice(I,J),width => 4);
    	end loop;
    	new_line;
    end loop;
  end Afficher_Une_Matrice;
	
  -- fonction d'addition de 2 matrices
  function "+"(Matrice1, Matrice2 : Une_Matrice_Entiere) return Une_Matrice_Entiere is
    res : Une_Matrice_Entiere(1..Matrice1'Length(1), 1..Matrice1'Length(2));
    	
    begin
    for I in 1..Matrice1'Length(1)  loop
    	for J in 1.. Matrice1'Length(2) loop
    		res(I,J) := Matrice1(Matrice1'First(1)+I-1, Matrice1'First(2)+J-1) + Matrice2(Matrice2'First(1)+I-1, Matrice2'First(2)+J-1);
    	end loop;
    end loop;
    return res;
  end "+";
  
  --fonction de multiplication d'une matrice par un scalaire
  function "*"(Matrice  : in Une_Matrice_Entiere; Scalaire : Integer) return 	Une_Matrice_Entiere is
  
    res : Une_Matrice_Entiere(Matrice'range(1), Matrice'range(2));
    
    begin
    for I in Matrice'range(1) loop
    	for J in Matrice'range(2) loop	
    		res(I,J) := Scalaire * Matrice(I,J );
    	end loop;
    end loop;
    return res;	
  end "*";

  -- fonction de multiplication d'un scalaire par une matrice
  function "*"(Scalaire : Integer; Matrice  : in Une_Matrice_Entiere) return Une_Matrice_Entiere is
  begin
   return Matrice*Scalaire;	
  end "*";
	
  --fonction de multiplication d'une matrice par une matrice
  function "*"(Matrice1, Matrice2 : in Une_Matrice_Entiere) return Une_Matrice_Entiere is
    
    res : Une_Matrice_Entiere(1..Matrice1'Length(1), 1..Matrice2'Length(2));	
    
    begin	
    for I in 1..Matrice1'Length(1) loop
    	for J in 1..Matrice2'Length(2) loop	
    			res(I,J) :=0;
    			--nombre de colonne de la première matrice (ou le nb lignes de la 2ème matrice)
				for K in 1..Matrice1'Length(2)	loop
					res(I,J) :=  res(I,J) + Matrice1(Matrice1'First(1)+I-1, Matrice1'First(2)+K-1) *	Matrice2(Matrice2'First(1)+K-1, Matrice2'First(2)+J-1);
				end loop;
    	end loop;
    end loop;
    return res;	
  end "*";

end Matrice;

