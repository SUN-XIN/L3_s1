with graphique, ada.text_io;
use graphique, ada.text_io;

procedure triangle is
	XMAX : constant Natural := 400;
	YMAX : constant Natural := 400;
	XV,YV,XU,YU,XW,YW : Natural;
	task type dessin (xn,yn,xm,ym : Natural);
	task body dessin is
	begin
		Afficher_Ligne(xn,yn,xm,ym);
	end dessin;
	
	begin
		XU := XMAX/3;
		YU := 2*XMAX/3;
		XV := XMAX/2;
		YV := YMAX/3;
		XW := 2*XMAX/3;
		YW := YU;
		Creer_Fenetre(XMAX, YMAX, "white", "blue");
		declare
			T1 : dessin(XU, YU, XV, YV);
			T2 : dessin(XU, YU, XW, YW);
			T3 : dessin(XW, YW, XV, YV);
		begin
			null;
		end;
	Attendre_Fermeture_Fenetre;
end triangle;    
