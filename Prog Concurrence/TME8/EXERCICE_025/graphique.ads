-- Encapsulation d'une bibliotheque graphique BASIQUE (voire elementaire;-)
package Graphique is
	
	-- Creation d'une fenetre associee au programme
	procedure Creer_Fenetre (Width  : in Natural;
                             Height : in Natural;
                             Bg_Color : in String;
                             Fg_Color : in String);

	-- Remplissage de la fenetre avec la couleur d'arriere plan
	procedure Remplir_Fenetre;
	
	-- Le programme attend la fermeture de la fenetre pour se terminer
	procedure Attendre_Fermeture_Fenetre;

	-- Affichage d'un point dans la couleur d'avant-plan
	procedure Afficher_Point (X, Y : in Natural);
	procedure Afficher_Point_Rapide (X, Y : in Natural);
	
	-- Affichage d'une ligne dans la couleur d'avant-plan
	procedure Afficher_Ligne (X1, Y1, X2, Y2: in Natural);
	procedure Afficher_Ligne_Rapide (X1, Y1, X2, Y2: in Natural);

end Graphique;
