with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_Matrice_Sure is
  A        : Une_Matrice_Entiere(1..9,1..10);
  B        : Une_Matrice_Entiere(1..9,1..10);
  C        : Une_Matrice_Entiere(1..9,1..10);
  D        : Une_Matrice_Entiere(1..10,1..9);
  reponse  : character;
  excep_add : exception;
  excep_mul : exception;

begin

  Initialiser_Une_Matrice(A);
  Initialiser_Une_Matrice(B);
  Initialiser_Une_Matrice(D);

  Put_line("Que voulez-vous effectuer d'abord : l'addition(a) ou la multiplication(m) ?");
  get(reponse);
  if (reponse = 'a') then
	Put_line("Addition");
	if C'length(1)/=A'length(1) or else
	   C'length(2)/=A'length(2) then
	   raise excep_add;
        end if;
        C := A + B;
        Afficher_Une_Matrice(C);

 	Put_line("Multiplication");
  	if C'length(1)/=B'length(2) or else
    	   C'length(2)/=A'length(1) then
     	   raise excep_mul;
  	end if;
 	C := A*D;
  	Afficher_Une_Matrice(C);
  else
 	Put_line("Multiplication");
  	if C'length(1)/=B'length(2) or else
    	   C'length(2)/=A'length(1) then
     	   raise excep_mul;
  	end if;
 	C := A*D;
  	Afficher_Une_Matrice(C);

	Put_line("Addition");
	if C'length(1)/=A'length(1) or else
	   C'length(2)/=A'length(2) then
	   raise excep_add;
        end if;
        C := A + B;
        Afficher_Une_Matrice(C);
  end if;

  exception
	when excep_add => Put_Line("La taille des matrices ne permet pas l'addition");
	when excep_mul => Put_Line("La taille des matrices ne permet pas la multiplication");

end Test_Matrice_Sure;
