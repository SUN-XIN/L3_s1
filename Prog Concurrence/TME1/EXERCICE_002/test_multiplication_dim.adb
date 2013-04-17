with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_multiplication_dim is
 
  A : Une_Matrice_Entiere(7..16,6..10);
  B : Une_Matrice_Entiere(2..6,6..9);
  C : Une_Matrice_Entiere(11..20,30..33);

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
end Test_multiplication_dim;
