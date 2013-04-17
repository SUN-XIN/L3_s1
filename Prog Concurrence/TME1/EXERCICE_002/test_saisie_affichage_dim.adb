with Ada.Text_IO, Matrice;
use Ada.Text_IO, Matrice;

procedure Test_saisie_affichage_dim is
	
  A : Une_Matrice_Entiere(4..13,31..35);

begin
  Initialiser_Une_Matrice(A);
  Afficher_Une_Matrice(A); 
end Test_saisie_affichage_dim;
