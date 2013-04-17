with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_addition is
  A : Une_Matrice_Entiere(1..10,1..10);
  B : Une_Matrice_Entiere(1..10,1..10);
  C : Une_Matrice_Entiere(1..10,1..10);

begin
  Put_Line("Saisie de A");
  Initialiser_Une_Matrice(A);
  Put_Line("Saisie de B");
  Initialiser_Une_Matrice(B);
  Afficher_Une_Matrice(A);
  Put_Line("+");
  Afficher_Une_Matrice(B);
  New_Line;
  Put_Line("=");
  C := A + B;
  Afficher_Une_Matrice(C);
end Test_addition;
