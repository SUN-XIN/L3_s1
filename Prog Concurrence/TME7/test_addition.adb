with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO,  Ada.Integer_Text_IO, Matrice;

procedure Test_addition is
  A : Une_Matrice_Entiere(Lignes => 5, Colonnes => 6);
  B : Une_Matrice_Entiere(Lignes => 5, Colonnes => 6);
  C : Une_Matrice_Entiere(Lignes => 5, Colonnes => 6);

begin
  Initialiser(A);
  Initialiser(B);
  Afficher_liste(A);
  Put_line("+");
  Afficher_liste(B);
  Put_line("=");
  C := A + B;
  Afficher_liste(C);
end Test_addition;
