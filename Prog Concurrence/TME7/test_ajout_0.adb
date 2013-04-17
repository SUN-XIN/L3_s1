with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO,  Ada.Integer_Text_IO, Matrice;

procedure Test_ajout_0 is
  A : Une_Matrice_Entiere(Lignes => 5, Colonnes => 6);
begin
  Initialiser(A);
  Put_line("Affichage de A :");
  Afficher_liste(A);
  Put_Line("A(2,1)=0");
  Valeur(A,2,1,0);
  Afficher_liste(A);
  Put_Line("A(2,6)=0");
  Valeur(A,2,6,0);
  Afficher_liste(A);
  Put_Line("A(2,3)=0");
  Valeur(A,2,3,0);
  Afficher_liste(A);
end Test_ajout_0;
