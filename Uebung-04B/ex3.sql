/* 3.1 Umbenennung */

select persnr as nr, name from professoren as p;

select persnr as nr, name from assistenten as a;

/* 3.2 Vereinigung */

select * from (
	select persnr as nr, name from professoren
	union
	select persnr as nr, name from assistenten
) as mitarbeiter;

/* 3.3 Schnittmenge */

select name from (
	select persnr as nr, name from professoren
	union
	select persnr as nr, name from assistenten
) as mitarbeiter
where name in (select name from professoren) and name in (select name from assistenten);

/* 3.4 Differenz */

select name from assistenten
where name not in (select name from studenten);

/* 3.5 Division */

select matrnr, count(hoeren.vorlnr) as besucht
from hoeren
group by matrnr
having count(vorlnr) = (select count(vorlnr) from vorlesungen)