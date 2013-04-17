with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure arbreBinaire is

package Alea_Int is new Ada.Numerics.Discrete_Random (natural);
use Alea_Int;

Graine : Generator;

-- nombre de valeur aleatoires a tirer
NBVALEURS : constant positive := 20;

task type noeud(valeur : natural) is
  entry recoit(val : in natural);
  entry affiche;
end noeud;

type acc_noeud is access noeud;
	
function nouveau_noeud(val : in natural) return acc_noeud is
-- fonction de creation d'une nouvelle tache
-- une tache ne peut pas directement creer une tache de meme
-- type, mais elle peut appeler une fonction qui le fait
	new_one : acc_noeud;
begin
	new_one := new noeud(val);
	return new_one;
end nouveau_noeud;

task body noeud is
 filsGauche, filsDroit : acc_noeud := NULL;
 compteur,no : natural := 0;
begin
 loop
 	select
		accept recoit(val : in natural) do
			no := val;

		if no = valeur then
			compteur := compteur + 1;
		else
			if no < valeur then
				if filsGauche = null then
					put_line(natural'image(valeur) & " creer " & natural'image(val) & " a gauche");
					filsGauche := nouveau_noeud(no);
				else 
					filsGauche.all.recoit(no);
				end if;
			else
				if filsDroit = null then
					put_line(natural'image(valeur) & " creer " & natural'image(val) & " a droite");
					filsDroit := nouveau_noeud(no);
				else 
					filsDroit.all.recoit(no);
				end if;
			end if;
		end if;

		end recoit;
 	or
		accept affiche do
			if filsGauche /= null then
				filsGauche.all.affiche;
			end if;
			put(natural'image(valeur));
			if filsDroit /= null then
				filsDroit.all.affiche;
			end if;
		end affiche;
 	or
		terminate;
	end select;
 end loop;
end noeud;		

-- Declaration des variables de la tache principale
first_noeud : noeud(5);
nb : natural;

begin
  Alea_Int.Reset(Graine);
  for I in 1..100 loop
    nb := Alea_Int.Random(Graine) mod NBVALEURS + 1;
    first_noeud.recoit(nb);
  end loop;
  put_line("Termine de creation l'arbre. On affiche : ");
  first_noeud.affiche;
end arbreBinaire;    
