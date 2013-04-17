with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure composants is
------------------- Gestion valeurs aleatoires
package Alea_Int is new Ada.Numerics.Discrete_Random (Natural);
use Alea_Int;
   
Graine : Generator;
Capteur_Erreur : exception;
----------------------------------------------------
nb_composants : constant Natural := 10;
nb_capteurs : constant Natural := 3;
pro : Natural := 0;

task type capteur is
  entry setVal(val , comp : out Natural);
end capteur;

task type composant is
  -- Pour recuperer l'identifiant du composant
  entry init(id : Natural);
end composant;

task body capteur is
	proba : Natural;
begin
  accept setVal(val , comp : out Natural) do
	proba := Alea_Int.Random(Graine) mod 10 + 1; 
	if proba > 1 then
  		val := Alea_Int.Random(Graine) mod 2;
		comp := comp + 1;
	end if;
  end setVal;
end capteur;

task body composant is
-- identifiant du composant, utile pour avoir un affichage
-- qui permet de suivre l'evolution du programme
identifiant : Natural;
-- ensemble des capteurs associes au composant
tab_capteurs : array(1..nb_capteurs) of capteur;
compteur  , comp : Natural :=0;
val : Natural;
begin
	select
		accept init(id : Natural) do
			identifiant := id;
		end init;
		for I in 1..nb_capteurs loop
			tab_capteurs(I).setVal(val , comp);
			if val = 1 then
				compteur := compteur + 1;
			end if;
		end loop;
		if comp = 3 then 
			pro := pro + 1;
		else 
			raise Capteur_Erreur;
		end if;

		case compteur is
			when 1 => put_line("Composant : "&Natural'image(identifiant)&". Les conditions d'execution du composant sont acceptable.");
			when 2 => put_line("Composant : "&Natural'image(identifiant)&". Les conditions d'execution du composant sont bonnes.");
			when 3 => put_line("Composant : "&Natural'image(identifiant)&". Les conditions d'execution du composant sont optimales.");
			when others => put_line("Composant : "&Natural'image(identifiant)&". Les conditions d'execution du composant sont risque.");
		end case;
	or
		terminate;
	end select;
	exception
		when Capteur_Erreur => put_line("Le Capteur de Composant "&Natural'image(identifiant)&" ne repond pas.");
end composant;

-- ensemble des composants
tab_composants : array (1..nb_composants) of composant;

begin
  for i in 1..nb_composants loop
    tab_composants(i).init(i);
  end loop;
  delay 0.5;
  put_line("La probabilite de reussir transmission requets est  "&Natural'image(pro*100/nb_composants)&" / 100 .");
end composants;


