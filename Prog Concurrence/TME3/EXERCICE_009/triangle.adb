--TME3 EX9
--En binome SUN_Xin & YUAN_Xiao

with graphique, ada.text_io,Ada.Integer_Text_IO;
use graphique, ada.text_io,Ada.Integer_Text_IO;

procedure triangle is
	XMAX : constant Natural := 400;
	YMAX : constant Natural := 400;
	x1,x2,x3,y1,y2,y3 : Natural;
	pret : boolean :=false;
	nbr_cote : integer := 0;
	
	task tri is
		entry creer;
		entry dessin(xn,yn,xm,ym:in Natural);
		entry fermer;
	end tri;
	task blabla;
	
	task body blabla is
	begin
		tri.creer;
		put_line("La fenetre a cree.");
		x1 := XMAX/3;
		y1 := 2*XMAX/3;			
		x2 := XMAX/2;
		y2 := YMAX/3;
		x3 := 2*XMAX/3;
		y3 := y1;		
		tri.dessin(x1,y1,x2,y2);
		tri.dessin(x1,y1,x3,y3);
		tri.dessin(x3,y3,x2,y2);
		put_line("On a fini dessin de triangle.");
		tri.fermer;
	end blabla;

	task body tri is

	begin
	loop
		select
			when pret = false =>
				accept creer do
					put_line("On cree la fenetre.");
					Creer_Fenetre(XMAX, YMAX, "white", "blue");
					delay 2.0;
				end creer;
				pret := true;
		or
			when nbr_cote = 3 =>
				accept fermer do
					put_line("On finit dessin de triangle, en attente de fermeture de fenetre.");
					Attendre_Fermeture_Fenetre;
					delay 2.0;
				end fermer;
		or 
			when pret = true and nbr_cote < 3 =>
					accept dessin(xn,yn,xm,ym:in Natural) do 
						Afficher_Ligne (xn,yn,xm,ym);
						put_line("Lier les deux points suivants: p1("&natural'image(xn)&","&natural'image(yn)&") et p2("&natural'image(xm)&","&natural'image(ym)&")");
						nbr_cote := nbr_cote + 1;
						delay 2.0;
					end dessin;
		or terminate;
		end select;
	end loop;
	end tri;
	
begin
	null;
end triangle;    
