package Matrice is

  --declaration du type matrice
  type Une_Matrice_Entiere is array (Positive range <>, Positive range <>) of Integer; 
	
  -- procedure d'initialisation d'une matrice par saisie des valeurs au clavier
  -- l'initialisation doit se faire ligne par ligne
  procedure Initialiser_Une_Matrice(Matrice : in out Une_Matrice_Entiere);
	
  -- procedure d'affichage d'une matrice 
  procedure Afficher_Une_Matrice(Matrice : in Une_Matrice_Entiere);

  -- fonction d'addition de 2 matrices
  function "+"(Matrice1, Matrice2 : Une_Matrice_Entiere) return Une_Matrice_Entiere;

  -- fonction de multiplication d'une matrice par un scalaire
  function "*"(Matrice  : Une_Matrice_Entiere; Scalaire : Integer) return Une_Matrice_Entiere;

  -- fonction de multiplication d'un scalaire par une matrice
  function "*"(Scalaire : Integer; Matrice  : Une_Matrice_Entiere) return Une_Matrice_Entiere;

  -- fonction de multiplication d'une matrice par une matrice
  function "*"(Matrice1, Matrice2 : Une_Matrice_Entiere) return Une_Matrice_Entiere;

end Matrice;
