with Ada.Text_IO, Ada.Integer_Text_IO, Matrice;
use Ada.Text_IO,  Ada.Integer_Text_IO, Matrice;

procedure Test_Matrice is

  A        : Une_Matrice_Entiere(Lignes => 10, Colonnes => 8);
  B        : Une_Matrice_Entiere(Lignes => 8,  Colonnes => 10);
  C        : Une_Matrice_Entiere(Lignes => 10, Colonnes => 10);
begin

  Initialiser(A);
  Put_line("Affichage de A :");
  Afficher(A);


  A := A * 12;
  Put_line("Affichage de A * 12 :");
  Afficher(A);
  


  for i in 1 .. B.Lignes loop
     for j in 1 .. B.Colonnes loop
        declare
           X : integer;
        begin
          if (I+J) mod 3 = 0 then
             X := 0;
          else
             X := i+j;
          end if;
          Valeur(B, i, j, X);
        end;
     end loop;
  end loop;

  Put_line("Affichage de B :");
  Afficher(B);

  new_line;
  C := A * B;
  Put_line("Affichage de C :");
  Afficher(C);
 
 end Test_Matrice;
