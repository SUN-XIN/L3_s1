with Ada.Text_Io,Ada.Command_Line;
use Ada.Text_Io, Ada.Command_Line;

package Polynomes is

type T_PP is array (Natural range <>) of Integer;

procedure Affiche_PP(P : in T_PP);

function Somme_PP(PP1,PP2 : T_PP) return T_PP ;
function RePP(PP1,PP2 : T_PP) return T_PP;

function Derive_PP(PP : T_PP) return T_PP;

function Evalue_PP(PP : T_PP; X : Integer) return Integer;

end Polynomes;
