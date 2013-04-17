with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure anneau_double is

NBSITES : constant positive := 5;

type tache;
type acc_tache is access tache;

-- type des taches de l'anneau
-- l'identite (id) de la tache est unique
-- l'entier qui lui est associe (Valeur) est choisi aleatoirement
task type tache(id : Natural; Valeur : natural) is
  -- permet de recuperer les pointeurs sur les taches suivante et precedente
  entry init (succ : in acc_tache ; pred : in acc_tache);
end tache;                

task Creer_Anneau;

-- la tache Creer_Anneau doit posseder un acces a la premiere tache creee
task body Creer_Anneau is
  package Random_Natural is new Ada.Numerics.Discrete_Random (Natural);
  use Random_Natural;
  
  G : Generator;

begin
  Reset (G);
  
  -- creation des taches de l'anneau
  -- A COMPLETER

  -- creation de l'anneau
  -- A COMPLETER
   			
end Creer_Anneau;

task body tache is                  
begin
  -- initialisation des taches suivante et precedente
  -- A COMPLETER

  -- affichage de la tache (avec son identite et son entier), 
  -- de la tache suivante (avec son identite et son entier) 
  -- et de la tache precedent (avec son identite et son entier) 
  -- A COMPLETER
end tache;                       

begin
  null;
end anneau_double;