with ada.text_io;
use ada.text_io;

procedure affichage is
fin : constant natural := 10;

-- declaration d'un type tache avec une entier naturel comme discriminant
task type boucle(n:natural);
-- Corps de la tache qui affiche les "fin" premiers entiers 
-- (en s'identifiant a chaque affichage) et qui signale a la fin qu'elle a termine
task body boucle is
begin
	for I in 1..fin loop
		put_line("Je suis la tache No."&Natural'Image(n)&", le numéro courant est "&Natural'Image(I));
	end loop;
	new_line;
end boucle;
-- Declaration de 6 taches avec des discriminants differents
        T1:boucle(1);
	T2:boucle(2);
	T3:boucle(3);
	T4:boucle(4);
	T5:boucle(5);
	T6:boucle(6);
begin
  put_line(" --Debut tache principale--");

  put_line(" --Fin tache principale--");
end affichage;	 
	

