with graphique, Ada.Numerics.Generic_Elementary_Functions;
use graphique;

procedure Von_Koch_Seq is

package Math_FLoat is new Ada.Numerics.Generic_Elementary_Functions(Float);
use Math_FLoat;

procedure tracer_segment(xm, ym, xn, yn : natural) is
    xa, xb, xc, ya, yb, yc, longueur : float;

begin    
    longueur := sqrt(float (( (ym -yn) * (ym -yn) + (xm -xn) * (xm -xn) )));
    if (longueur > 8.0) then
        xa := float(2 * xm + xn) / 3.0;
        xc := float(xm + 2 * xn) / 3.0;
        ya := float(2 * ym + yn) / 3.0;
        yc := float(ym + 2 * yn) / 3.0;
        
        xb := xa + (xc - xa - (sqrt(3.0) * float(yc - ya))) / 2.0;
        yb := ya + (yc - ya + (sqrt(3.0) * float(xc - xa))) / 2.0;
        
        tracer_segment(natural(xm), natural(ym), natural(xa), natural(ya));
        tracer_segment(natural(xa), natural(ya), natural(xb), natural(yb));
        tracer_segment(natural(xb), natural(yb), natural(xc), natural(yc));
        tracer_segment(natural(xc), natural(yc), natural(xn), natural(yn));

    else
        Afficher_Ligne(xm, ym, xn, yn);
    end if;
end tracer_segment;

    XU, YU, XV, YV, XW, YW : natural;
    XMAX : constant natural := 400;
    YMAX : constant natural := 400;
    

begin

    creer_fenetre(XMAX, YMAX,"white","blue");

    YV := YMAX/8; 
    XV := XMAX/2;
    YU := YV + natural(0.5196 * float(XMAX)) ; 
    XU := XV - natural(3.0 * float(XMAX)/10.0);
    YW := YU; 
    XW := XV + natural(3.0 * float(XMAX)/10.0);
    
    tracer_segment(XV, YV, XU, YU);
    tracer_segment(XW, YW, XV, YV);
    tracer_segment(XU, YU, XW, YW);
    
    Attendre_Fermeture_Fenetre;

end Von_Koch_Seq;    
