with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO,  Ada.Integer_Text_IO, Matrice;

procedure Test_fct_Valeur is
  A : Une_Matrice_Entiere(Lignes => 5, Colonnes => 6);
begin
  Initialiser(A);
  Put_line("Affichage de A :");
  Afficher(A);
end Test_fct_Valeur;


