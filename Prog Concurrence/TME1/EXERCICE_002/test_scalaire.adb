with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO, Ada.Integer_Text_IO, Matrice;

procedure Test_Scalaire is
	
  A : Une_Matrice_Entiere(1..5,1..5);
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
  Put_Line("----------------------------------------------");
  Put(scal, width => 8);
  New_Line;
  Put_Line("*");
  Afficher_Une_Matrice(A);
  Put_Line("=");
  A := scal * A;
  Afficher_Une_Matrice(A);
end Test_Scalaire;
