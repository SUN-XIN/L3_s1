-- crible d'eratosthene avec une tache creee par nombre premier
-- (creation dynamique de tache au fur et a mesure de la decouverte
-- de nouveaux nombres premiers)
with ada.text_io;
use ada.text_io;

procedure erato is
  task type filtre(NP : natural) is
    entry a_filtrer(num : natural);
  end filtre;

  type A_filtre is access filtre;

  function cree_nouveau_filtre(NP : natural) return A_filtre is
  	Premier : A_filtre;
  begin
	Premier := new filtre(NP);
  	return Premier;
  end cree_nouveau_filtre;

  task body filtre is
    suiv : A_filtre := null;    -- pointeur sur le filtre suivant
    p_num : natural;
    -- A completer
  begin
	put_line("  (*"&natural'image(NP)&" *)");
	loop
		select
			accept a_filtrer(num : natural) do
				p_num := num;
			end a_filtrer;
			if (p_num mod NP) /= 0 then	
				if (suiv = null) then
					suiv := cree_nouveau_filtre(p_num);
				else
					suiv.all.a_filtrer(p_num);
				end if;
			end if;
		or
			terminate;
		end select;
	end loop;
  end filtre;

prems : filtre(2);

begin
  for i in 3..100 loop
    prems.a_filtrer(i);
  end loop;
end erato;
