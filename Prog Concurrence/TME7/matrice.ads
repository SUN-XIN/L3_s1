package Matrice is
  
type Un_Element_De_Liste; 

type Ptr_Element_De_Liste is access Un_Element_De_Liste;

-- type associe a un element de la matrice :
-- Prochain est l'adresse du prochain eleement sur la meme ligne,
-- Colonne est la colonne a laquelle se trouve l'element,
-- Donnee est la valeur de l'element.
type Un_Element_De_Liste is
record
  Prochain : Ptr_Element_De_Liste;
  Colonne  : Positive;
  Donnee   : Integer;
end record; 

-- tableau permettant de stocker l'adresse du premier element de chaque ligne
type Tab_Ptr is array (Positive range <>) of Ptr_Element_De_Liste;

-- type Une_Matrice_entiere avec deux discriminants : le nombre de lignes (qui determine la taille du 
-- tableau) et le nombre de colonnes (necessaire pour connaitre la taille de la matrice et savoir ou se
-- trouvent les 0)
type Une_Matrice_Entiere(Lignes, Colonnes : Positive) is         
record
  Tete : Tab_Ptr(1..Lignes);
end record; 

-- Retourne la valeur de l'element de la Matrice se trouvant en position Ligne, Colonne
function  Valeur(Matrice : in Une_Matrice_Entiere; Ligne : in Positive; Colonne : in Positive) 
                                                                                 return Integer;
-- Initialise a Valeur l'element de la Matrice se trouvant en position Ligne, Colonne
procedure Valeur(Matrice : in out Une_Matrice_Entiere; Ligne : in Positive; Colonne : in Positive;
                 Valeur : in Integer);

-- Initialiser une matrice par saisie des valeurs au clavier
-- l'initialisation doit se faire ligne par ligne
procedure Initialiser(Matrice : in out Une_Matrice_Entiere);

-- Procedure d'affichage de la matrice utilisant la fonction Valeur
procedure Afficher(Matrice : in Une_Matrice_Entiere);

-- Procedure d'affichage de la matrice par parcours de la liste
procedure Afficher_liste(Matrice : in Une_Matrice_Entiere);

-- Addition de 2 matrices
function "+"(Matrice1, Matrice2 : in Une_Matrice_Entiere) return Une_Matrice_Entiere;

-- Multiplication d'une matrice par un scalaire avec commutativite
function "*"(Matrice  : in Une_Matrice_Entiere; Scalaire : in Integer) return Une_Matrice_Entiere;
function "*"(Scalaire : in Integer; Matrice  : in Une_Matrice_Entiere) return Une_Matrice_Entiere;

-- Multiplication d'une matrice par une matrice
function "*"(Matrice1, Matrice2 : in Une_Matrice_Entiere) return Une_Matrice_Entiere;
    
end Matrice;
