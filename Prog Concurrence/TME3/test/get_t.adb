with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO;


procedure get_t is
num : natural;
begin
	get(num);
	put("le num = "&natural'Image(num));
end get_t;    
