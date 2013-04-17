with Ada.text_io, Ada.Numerics.Discrete_Random, Ada.Exceptions;
use Ada.text_io;

procedure choix_serveur is

NB_CLIENTS : constant natural := 5;
NB_SERVEURS : constant natural := 3;
erreur : exception;

task type client is
  entry init(id : natural);
end client;
	
task type serveur is
  entry init(id : natural);
  entry callable(mark : out boolean);
  entry service(id_client : natural);
end serveur;

tab_clients : array(1..NB_CLIENTS) of client;
tab_serveurs : array(1..NB_SERVEURS) of serveur;

task body client is
  package Random_Natural is new Ada.Numerics.Discrete_Random(Natural);
  use Random_Natural;
  G : Generator;
  num_ser , id_client : Natural;
  mark : boolean;
begin
  accept init(id : natural) do
    id_client := id;
  end init;
  for I in 1..NB_SERVEURS loop
    Reset(G);
    num_ser := (random(G) mod NB_SERVEURS) + 1;
    tab_serveurs(num_ser).callable(mark);
    while (mark = false) loop
      begin
        num_ser := (random(G) mod NB_SERVEURS) + 1;
        tab_serveurs(num_ser).callable(mark);
        raise erreur;
        exception
          when erreur => put_line("Le Serveur "&natural'image(num_ser)&" est plein. Le Client "&natural'image(id_client)&" doit rechoissir le serveur.");
      end;
    end loop;
    tab_serveurs(num_ser).service(id_client);
    put_line("La service de Client "&natural'image(id_client)&" est termine.");
  end loop;
end client;

task body serveur is
  id_serveur : natural;
  compteur : natural := 0;
begin
  loop
    select
      accept init(id : natural) do
        id_serveur := id;
      end init;
    or
      accept service(id_client : natural) do
       put_line("Le Serveur "&natural'image(id_serveur)&" est en service de Client "&natural'image(id_client));
--&", c'est sa "&natural'image(compteur)&"em service.");
      end service;
    or
      accept callable(mark : out boolean) do
        if compteur = NB_CLIENTS then
	  mark := false;
	else
	  compteur := compteur + 1;
	  mark := true;
        end if;
      end callable;
    or
      terminate;
    end select;
  end loop;
end serveur;

begin
  for I in 1..NB_SERVEURS loop
    tab_serveurs(I).init(I);
  end loop;
  for I in 1..NB_CLIENTS loop
    tab_clients(I).init(I);
  end loop;
end choix_serveur;
