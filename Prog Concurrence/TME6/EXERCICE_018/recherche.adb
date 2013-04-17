with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;

procedure recherche is
   trouver:exception;
   type tableau is array (natural range <>) of integer;
	
   function trouve(tab : tableau; element : integer; etape : integer ) return integer is
   mark : integer := 0;		     
   begin
      if tab(etape) = element then
	raise trouver;
      else
	if etape = tab'length then
		return 0; 
	else 
		mark := trouve(tab, element ,etape+1);
        end if;
      end if;
      return mark;
   exception
      when trouver => return 1; 
   end trouve;

   Mon_tab : tableau(1..10);
   i : integer := 0;
begin
   Mon_tab := (3, -2, 5, 7, -7, 1, -5, 0, 9, 4);
   for elem in -10 .. 10 loop
      i := trouve(Mon_tab, elem,1) ;
      if i = 1 then
	put_line("L'element " & natural'image(elem) & " se trouve dans le tableau");
      else
        put_line("L'element " & natural'image(elem) & " ne se trouve pas dans le tableau");
      end if;
   end loop;
end recherche;

