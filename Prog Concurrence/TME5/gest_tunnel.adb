--LI330 Prc TME5 Exercice_13
--Fait par binome : SUN Xin & YUAN Xiao
with Ada.text_io,Ada.Numerics.Discrete_Random;
use Ada.text_io;

procedure Tunnel_une_voie is

package Alea_Int is new Ada.Numerics.Discrete_Random(Integer);
Graine : Alea_Int.Generator;
function Duree_Attente return Duration is
begin
	return 0.1 * Duration(Alea_Int.Random(Graine) mod 10);
end Duree_Attente;

NB_TRAINS : constant natural := 15;
NB_MAX : constant natural := 5;
type signal is (open,closed);
type T_TRAIN is (Ta,Tb);
nb_passe : natural:=0;

Protected type Mark is 
	procedure Changer_Etat;
	entry Demand_Entrer;
	private 
		Etat : signal := closed;
end Mark;
protected body Mark is
	procedure Changer_Etat is 
	begin
		if Etat = closed then 
			Etat := open;
		else
		Etat := closed;
		end if;
	end Changer_Etat;
	entry Demand_Entrer when Etat = open is
	begin
		null;
	end Demand_Entrer;
end Mark;

Les_Marks:array(T_TRAIN) of Mark;

Protected Tunnel is
	entry Entrer;
	procedure Sortir;
	entry Vide;
	private 
		nb_t:natural:=0;
end Tunnel;

Protected body Tunnel is

	entry Entrer when nb_t < NB_MAX and nb_passe < NB_MAX is
	begin
		nb_t := nb_t + 1;
		nb_passe := nb_passe + 1;
		Put_Line("    Il y a "&natural'image(nb_t)&" de train dans ce Tunnel, et il est passé deja "&natural'image(nb_passe)&" de train sur ce circul.");
	end Entrer;

	procedure Sortir is
	begin
		nb_t := nb_t - 1;
		Put_Line("        Il y a "&natural'image(nb_t)&" de train dans ce Tunnel.");
	end Sortir;

	entry Vide when nb_t = 0 is
	begin
		Put_Line("            Le tunnel est vide.");
	end Vide;
end Tunnel;

task type TRAIN(typ:T_TRAIN) is 
	entry Init(id:Positive);
end TRAIN;
task body TRAIN is
	my_id:Positive;
begin
	accept Init(id:Positive) do
		my_id:=id;
	end Init;
	Les_Marks(typ).Demand_Entrer;
	Put_Line("Le train "&natural'image(my_id)&" dont sens "&T_TRAIN'image(typ)&" demande entrer à tunnel.");
	Tunnel.Entrer;
	Put_Line("Le train "&natural'image(my_id)&" dont sens "&T_TRAIN'image(typ)&" est entré à tunnel.");
	delay Duree_Attente;
	Tunnel.Sortir;
	Put_Line("Le train"&natural'image(my_id)&" dont sens "&T_TRAIN'image(typ)&" est sorti depuis tunnel.");
end TRAIN;

task Gestion;
	sens : T_TRAIN := Ta;
task body Gestion is
begin
	loop
		Les_Marks(sens).Changer_Etat;
		Put_Line("On change l'etat de Mark"&" dont sens "&T_TRAIN'image(sens));
		while nb_passe < NB_MAX loop 
			delay 0.1;
		end loop;
		nb_passe := 0;
		Les_Marks(sens).Changer_Etat;
		Put_Line("On change l'etat de Mark"&" dont sens "&T_TRAIN'image(sens));
		Tunnel.Vide;
		if sens=Ta then
			sens:=Tb;
			Put_Line("On change le sens vers Tb.");
		else
			sens:=Ta;
			Put_Line("On change le sens vers Ta.");
		end if;
	end loop;
end Gestion;

TRAIN_A:array(1..NB_TRAINS) of TRAIN(Ta);
TRAIN_B:array(1..NB_TRAINS) of TRAIN(Tb);

begin
	for i in 1..NB_TRAINS loop
		TRAIN_A(i).Init(i);
		TRAIN_B(i).Init(i);
	end loop;	
end Tunnel_une_voie;
