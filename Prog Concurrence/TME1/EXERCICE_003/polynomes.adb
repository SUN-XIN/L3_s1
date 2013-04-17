with Ada.Text_Io;
use Ada.Text_Io;

package body Polynomes is

procedure Affiche_PP(P : in T_PP) is
First : Boolean := TRUE;
begin
   for I in P'Range loop
      if P(I) /= 0 then
         if First then
            Put (Natural'Image(P(I)) & " X^" & Natural'Image(I - P'first));
            First := FALSE;
         else
            Put (" + " & Natural'Image(P(I)) & " X^" & Natural'Image(I - P'first));
         end if;
      end if;
   end loop;
   New_Line;
end Affiche_PP;

function Somme_PP(PP1,PP2 : T_PP) return T_PP is 
begin
  if (PP1'length)>(PP2'length) then
	return RePP(PP1,PP2);
  else return RePP(PP2,PP1);
  end if;
end Somme_PP;

function RePP(PP1,PP2 : T_PP) return T_PP is
SPP1 : T_PP(1..PP1'length);
SPP2 : T_PP(1..PP2'length);
PPS : T_PP(1..PP1'length);
begin
  for I in 1..PP1'length loop
	SPP1(I) := PP1(I+PP1'last-PP1'length);
  end loop;
  for I in 1..PP2'length loop
	SPP2(I) := PP2(I+PP2'last-PP2'length);
	PPS(I) := SPP1(I)+SPP2(I);
  end loop;

  for I in PP2'length+1..PP1'length loop
	PPS(I) := SPP1(I);
  end loop;
  return PPS;
end RePP;

function Derive_PP(PP : T_PP) return T_PP is 
PPS : T_PP(PP'first..PP'last-1);
begin
  for I in PP'first+1..PP'last loop
        if PP(I) /= 0 then
           PPS(I-1) := PP(I)*(I - PP'first);
	else PPS(I-1) := 0;
        end if;
   end loop;
   return PPS;
end Derive_PP;

function Evalue_PP(PP : T_PP; X : Integer) return Integer is 
somme : integer := 0;
begin
for I in PP'Range loop
      if PP(I) /= 0 then
         somme := somme + PP(I) * ( x**(I - PP'first) );
      end if;
   end loop;
   return somme;
end Evalue_PP;

end Polynomes;
