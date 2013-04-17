with System;
use System;

package body Graphique is

	type Os_Unsigned is range 0 .. 2**32-1;
	for Os_Unsigned'Size use 32;
	
	procedure Creer_Fenetre (Width  : in Natural;
						     Height : in Natural;
							 Bg_Color : in String;
							 Fg_Color : in String) is
	
		procedure Creer_Fenetre (W, H : in Os_Unsigned;
								 Bgc, Fgc : in System.Address);
		pragma import (C, Creer_Fenetre, "creer_fenetre");
		
		Bgc : String (1.. Bg_Color'Length + 1) := Bg_Color & Ascii.nul;
		Fgc : String (1.. Fg_Color'Length + 1) := Fg_Color & Ascii.nul;
		
	begin
		Bgc (1.. Bg_Color'Length + 1) := Bg_Color & Ascii.nul;
		Fgc (1.. Fg_Color'Length + 1) := Fg_Color & Ascii.nul;
		Creer_Fenetre (Os_Unsigned (Width), Os_Unsigned(Height), Bgc'Address, Fgc'Address);
	end Creer_Fenetre;

	procedure Remplir_Fenetre is
	
		procedure Remplir_Fenetre_Interne;
		pragma import (C, Remplir_Fenetre_Interne, "effacer_fenetre");

	begin
		Remplir_Fenetre_Interne;
	end Remplir_Fenetre;


	procedure Attendre_Fermeture_Fenetre is
	
		procedure Attendre_Fermeture_Fenetre_Interne;
		pragma import (C, Attendre_Fermeture_Fenetre_Interne, "attendre_fermeture_fenetre");

	begin
		Attendre_Fermeture_Fenetre_Interne;
	end Attendre_Fermeture_Fenetre;

	procedure Afficher_Point (X, Y : in Natural) is
	
		procedure Afficher_Point_Interne (X, Y : in Os_Unsigned);
		pragma import (C, Afficher_Point_Interne, "afficher_point");
	
	begin
		Afficher_Point_Interne (Os_Unsigned(X), Os_Unsigned(Y));
	end Afficher_Point;

	procedure Afficher_Point_Rapide (X, Y : in Natural) is
	
		procedure Afficher_Point_Rapide_Interne (X, Y : in Os_Unsigned);
		pragma import (C, Afficher_Point_Rapide_Interne, "afficher_point_rapide");
	
	begin
		Afficher_Point_Rapide_Interne(Os_Unsigned(X), Os_Unsigned(Y));
	end Afficher_Point_Rapide;

	procedure Afficher_Ligne (X1, Y1, X2, Y2: in Natural) is
	
		procedure Afficher_Ligne_Interne (X1, Y1, X2, Y2 : in Os_Unsigned);
		pragma import (C, Afficher_Ligne_Interne, "afficher_ligne");
	
	begin
		Afficher_Ligne_Interne (Os_Unsigned(X1), Os_Unsigned(Y1), Os_Unsigned(X2), Os_Unsigned(Y2));
	end Afficher_Ligne;

	procedure Afficher_Ligne_Rapide (X1, Y1, X2, Y2: in Natural) is
	
		procedure Afficher_Ligne_Rapide_Interne (X1, Y1, X2, Y2 : in Os_Unsigned);
		pragma import (C, Afficher_Ligne_Rapide_Interne, "afficher_ligne_rapide");
	
	begin
		Afficher_Ligne_Rapide_Interne (Os_Unsigned(X1), Os_Unsigned(Y1), Os_Unsigned(X2), Os_Unsigned(Y2));
	end Afficher_Ligne_Rapide;

end Graphique;
