with graphique, ada.text_io;
use graphique, ada.text_io;

PROCEDURE Triangle_Tp1 IS
   XMAX : constant Natural := 600;
   YMAX : CONSTANT Natural := 600;
   X, Y, Dx, Dy: Natural;
   e :float;
   TASK TYPE Bresenham(X0,Y0,X1,Y1 : Natural);
   TASK BODY Bresenham IS
   BEGIN
         Dx := X1-X0;
         Dy := Y1-Y0;   
         E := float(dy/dx);
         X :=X0;
         Y :=Y0; 
     FOR I IN 1..Dx LOOP
        Afficher_Point (X,Y);
        DELAY 0.1;
        X := X+1;
        E := E+float(2*Dy);
        IF integer(E) >= Dx THEN      
        Y := Y+1;
        E := E-float(2*Dx);
        END IF;
     END LOOP;
   END Bresenham;
 BEGIN     
         Creer_Fenetre(XMAX, YMAX, "white", "blue");
    DECLARE
                T : Bresenham(10, 320, 410, 400);
      BEGIN
       NULL;
   END;
       Attendre_Fermeture_Fenetre;
END Triangle_Tp1;
           
