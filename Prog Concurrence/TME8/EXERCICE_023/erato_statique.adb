-- crible d'eratosthène statique avec une liste a pointeurs des nbr premiers
with ada.text_io;
use ada.text_io;

procedure erato_statique is

type nb_premiers;
type A_nb_premiers is access nb_premiers;

type nb_premiers is record 
  n : natural;
  suiv : a_nb_premiers;
end record;

procedure affiche(L : in a_nb_premiers) is
  p : a_nb_premiers := L;
begin
  while p /= null loop
    put(natural'image(p.n) & "  ");
    p := p.all.suiv;
  end loop;
end affiche;

function ajouter_nb_premier(L : a_nb_premiers; n : natural) 
                                       return a_nb_premiers is 
  p : a_nb_premiers:= L;
begin
  if p = null
    then return new nb_premiers'(n,null);
  end if;
  while (p.all.suiv /= null) loop
    p := p.all.suiv;
  end loop;
  -- p pointe sur le dernier
  p.all.suiv := new nb_premiers'(n,null);
  return L;
end ajouter_nb_premier;

procedure filtrer (n : in natural; L : in out a_nb_premiers) is
  p : a_nb_premiers := L;
begin
  while p /= null loop
    if n mod p.all.n /= 0 then
      p := p.all.suiv;
    else	
      return;
    end if;
  end loop;
  -- n est un nouveau nombre premier
  L := ajouter_nb_premier(L,n);
end filtrer;

Liste_nb_premiers : a_nb_premiers;

begin
  Liste_nb_premiers := new nb_premiers'(2,null);
  for i in 3..100 loop
    filtrer(i,Liste_nb_premiers);
  end loop;
  affiche(Liste_nb_premiers);
end erato_statique;	
