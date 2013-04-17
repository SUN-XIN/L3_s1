with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_addition_dim is
  A : Une_Matrice_Entiere(3..10,7..12);
  B : Une_Matrice_Entiere(2..9,2..7);
  C : Une_Matrice_Entiere(6..13,10..15);

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
end Test_addition_dim;
