with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO,  Ada.Integer_Text_IO, Matrice;

procedure Test_scalaire is
  A : Une_Matrice_Entiere(Lignes => 5, Colonnes => 6);

begin
  Initialiser(A);
  Afficher_liste(A);
  Put_line("* 2");
  Put_line("=");
  A := A * 2;
  Afficher_liste(A);
  Put_line("-----------------------------");
  Afficher_liste(A);
  Put_line("* 0");
  Put_line("=");
  A := 0 * A;
  Afficher_liste(A);
end Test_scalaire;
