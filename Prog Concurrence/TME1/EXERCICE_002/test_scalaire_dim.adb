with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO, Ada.Integer_Text_IO, Matrice;

procedure Test_Scalaire_dim is
	
  A : Une_Matrice_Entiere(5..13,20..26);
  scal : Integer;

begin
  Put("Saisie du scalaire : ");
  Get(scal);
  Initialiser_Une_Matrice(A);
  Afficher_Une_Matrice(A);
  Put_Line("*");
  Put(scal, width => 8);
  New_Line;
  Put_Line("=");
  A := A * scal;
  Afficher_Une_Matrice(A);
 
end Test_Scalaire_dim;
