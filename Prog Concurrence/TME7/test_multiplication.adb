with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO,  Ada.Integer_Text_IO, Matrice;

procedure Test_multiplication is
  A : Une_Matrice_Entiere(Lignes => 5, Colonnes => 6);
  B : Une_Matrice_Entiere(Lignes => 6, Colonnes => 4);
  C : Une_Matrice_Entiere(Lignes => 5, Colonnes => 4);

begin
  Initialiser(A);
  Initialiser(B);
  Afficher_liste(A);
  Put_line("*");
  Afficher_liste(B);
  Put_line("=");
  C := A * B;
  Afficher_liste(C);
end Test_multiplication;
