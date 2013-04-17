with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO,  Ada.Integer_Text_IO, Matrice;

procedure Test_ajout_1 is
  A : Une_Matrice_Entiere(Lignes => 5, Colonnes => 6);
begin
  Initialiser(A);
  Put_line("Affichage de A :");
  Afficher_liste(A);
  Put_Line("A(4,1)=1");
  Valeur(A,4,1,1);
  Afficher_liste(A);
  Put_Line("A(4,6)=2");
  Valeur(A,4,6,2);
  Afficher_liste(A);
  Put_Line("A(4,3)=3");
  Valeur(A,4,3,3);
  Afficher_liste(A);
end Test_ajout_1;
