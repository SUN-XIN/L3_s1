with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_Matrice_Sure is
  A        : Une_Matrice_Entiere(1..9,1..10);
  B        : Une_Matrice_Entiere(1..9,1..10);
  C        : Une_Matrice_Entiere(1..9,1..10);
  D        : Une_Matrice_Entiere(1..10,1..9);
  reponse  : character;

protected add_mul is
  procedure add;
  procedure mul;
end add_mul;

protected body add_mul is
procedure add is
begin
	Put_line("Addition");
       	C := A + B;
       	Afficher_Une_Matrice(C);
  	exception
		when Constraint_Error => Put_Line("La taille des matrices ne permet pas l'addition");	
end add;

procedure mul is
begin
	Put_line("Multiplication");
	C := A*D;
	Afficher_Une_Matrice(C);
  	exception
		when Constraint_Error => Put_Line("La taille des matrices ne permet pas la multiplication");
end mul;

end add_mul;

begin
  Initialiser_Une_Matrice(A);
  Initialiser_Une_Matrice(B);
  Initialiser_Une_Matrice(D);

  Put_line("Que voulez-vous effectuer d'abord : l'addition(a) ou la multiplication(m) ?");
  get(reponse);
  if (reponse = 'a') then 
	add_mul.add;
	add_mul.mul;
  else
	add_mul.mul;
	add_mul.add;
  end if;

end Test_Matrice_Sure;
