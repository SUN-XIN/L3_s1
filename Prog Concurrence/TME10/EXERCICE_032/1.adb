with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure anneau_min is

NBSITE : constant positive := 4;

type tache;
type acc_tache is access tache;

task type tache(Valeur : natural) is	
  entry recevoir(mes : natural);
  entry calcul_start;
end tache;                

task Creer_Anneau is 
  entry init (suc : out acc_tache);
end Creer_Anneau;

task body Creer_Anneau is
package Random_Natural is new Ada.Numerics.Discrete_Random (Natural);
  use Random_Natural;
  G : generator;
  premier : acc_tache ;
  test : natural;
begin
  test := random(G) mod 100;
  put_line("creation premier: "&natural'image(test));
  premier := new tache(test);
  reset(G);
  for I in 1..NBSITE loop
    accept init(suc : out acc_tache) do
      if I < NBSITE then
        test := random(G) mod 100;
        put_line("creation : "&natural'image(test));
        suc := new tache(test);
      else
        suc := premier;
      end if;
   end init;
  end loop;
  put_line("fin de creation");
  premier.all.calcul_start;
end Creer_Anneau;

task body tache is                  
  suivant : acc_tache;
  min_loc : natural := Valeur;
begin
  Creer_Anneau.init(suivant);
  select
    accept calcul_start;
    put_line("On commence le calcul.");
    suivant.all.recevoir(Valeur);
    accept recevoir(mes : natural) do
      put_line("Le min est"&natural'image(mes));
    end recevoir;
  put_line("fin de calcul.");
  or
    accept recevoir(mes : natural) do
      if mes < Valeur then
        min_loc := mes;
      end if;
    end recevoir;
    suivant.all.recevoir(min_loc);
  end select;
end tache;                       

begin
   null;
end anneau_min;    
