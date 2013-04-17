with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_saisie_affichage is
	
  A : Une_Matrice_Entiere(1..10,1..10);

begin
  Initialiser_Une_Matrice(A);
  Afficher_Une_Matrice(A); 
end Test_saisie_affichage;
