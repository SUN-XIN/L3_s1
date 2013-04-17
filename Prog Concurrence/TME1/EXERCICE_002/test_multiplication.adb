with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_multiplication is
 
  A : Une_Matrice_Entiere(1..5,1..4);
  B : Une_Matrice_Entiere(1..4,1..8);
  C : Une_Matrice_Entiere(1..5,1..8);

begin
  Put_Line("Saisie de A");
  Initialiser_Une_Matrice(A);
  Put_Line("Saisie de B");
  Initialiser_Une_Matrice(B);
  Afficher_Une_Matrice(A);
  Put_Line("*");
  Afficher_Une_Matrice(B);
  New_Line;
  Put_Line("=");
  C := A * B;
  Afficher_Une_Matrice(C);
end Test_multiplication;
