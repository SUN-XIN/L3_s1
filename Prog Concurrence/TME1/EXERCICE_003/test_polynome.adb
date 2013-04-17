with Ada.Text_Io, Ada.Command_Line, Polynomes, Jeu_De_Test;
use Ada.Text_Io, Ada.Command_Line, Polynomes, Jeu_De_Test;

procedure Test_polynome is

procedure Auto_C(Num : Natural) is
begin
   case Num is
   when 1 =>     Put("pp1 =");Affiche_PP(PP1);
                 Put("pp2 =");Affiche_PP(PP2);
                 Put("pp3 =");Affiche_PP(PP3);
   when 2 =>     Put_Line("pp1(1) = " & Integer'Image(Evalue_PP(PP1,1)));
                 Put_Line("pp1(2) = " & Integer'Image(Evalue_PP(PP1,2)));
                 Put_Line("pp1(-1) = " & Integer'Image(Evalue_PP(PP1,-1)));
                 Put_Line("pp2(1) = " & Integer'Image(Evalue_PP(PP2,1)));
                 Put_Line("pp2(0) = " & Integer'Image(Evalue_PP(PP2,0)));
                 Put_Line("pp2(3) = " & Integer'Image(Evalue_PP(PP2,3)));
                 Put_Line("pp3(0) = " & Integer'Image(Evalue_PP(PP3,0)));
                 Put_Line("pp3(1) = " & Integer'Image(Evalue_PP(PP3,1)));
                 Put_Line("pp3(-2) = " & Integer'Image(Evalue_PP(PP3,-2)));
   when 3 =>     Put("derivee pp1 =");Affiche_PP(Derive_PP(PP1));
                 Put("derivee pp2 =");Affiche_PP(Derive_PP(PP2));
                 Put("derivee pp3 =");Affiche_PP(Derive_PP(PP3));
   when 4 =>     Put("pp1 + pp2 =");Affiche_PP(Somme_PP(PP1,PP2));
                 Put("pp2 + pp1 =");Affiche_PP(Somme_PP(PP2,PP1));
                 Put("pp1 + pp3 =");Affiche_PP(Somme_PP(PP1,PP3));
                 Put("pp3 + pp1 =");Affiche_PP(Somme_PP(PP3,PP1));
                 Put("pp2 + pp3 =");Affiche_PP(Somme_PP(PP2,PP3));
                 Put("pp3 + pp2 =");Affiche_PP(Somme_PP(PP3,PP2));
                 Put("pp1 + pp1 =");Affiche_PP(Somme_PP(PP1,PP1));
                 Put("pp2 + pp2 =");Affiche_PP(Somme_PP(PP2,PP2));
                 Put("pp3 + pp3 =");Affiche_PP(Somme_PP(PP3,PP3));
      when others => null;
   end case;
end Auto_C;


begin
   if Argument_Count /= 0 then
      Put_Line("Test no = " & Argument(1));
      Auto_C(Natural'Value(Argument(1)));
   end if;
end Test_polynome;
