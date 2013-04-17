with ada.Text_IO;
use ada.Text_IO;

procedure Prod_Cons is
	Dimension : constant Positive := 5;
	type Tab_buffer is
		array(Positive range<>) of integer;
	type T_stock(taille:Positive) 
	is record
		nb_cases: natural := 0;
		Tab:Tab_buffer(1..taille);
	end record;

	task Consom;
	task Produc;
	task Gestionnaire is
		entry Depot(val:in integer);
		entry Retrait(val:out integer);
	end Gestionnaire;

	task body Consom is
	val: integer;
	begin
		for I in 1..Dimension loop
			Gestionnaire.Retrait(val);
			put_line("Le consomteur a recupere"&natural'image(val));
		end loop;
	end Consom;

	task body Produc is
	begin
		for I in 1..Dimension loop
			Gestionnaire.Depot(I);
			put_line("Le producteur a depose "&natural'image(I));
		end loop;
	end Produc;

	task body Gestionnaire is
	stock : T_stock(Dimension);
	begin
		loop
			select
				when stock.nb_cases < Dimension =>
					accept Depot (val:in integer) do 
						stock.nb_cases := stock.nb_cases + 1;
						stock.Tab(stock.nb_cases) := val;
						put_line("Depot du message"&integer'image(val)&" dans la case"&natural'image(stock.nb_cases));
					end Depot;
			or
				when stock.nb_cases > 0 =>
					accept Retrait (val:out integer) do
						val := stock.Tab(1);
						stock.Tab(1..stock.nb_cases-1)  := stock.Tab(2..stock.nb_cases);
						stock.nb_cases := stock.nb_cases - 1;
						put_line("Retrait du message"&integer'image(val)&" depuis la case"&natural'image(stock.nb_cases+1));
					end Retrait;
			or	terminate;
			end select;
		
		end loop;
	end Gestionnaire;

begin
	null;	
end Prod_Cons;	 
	

