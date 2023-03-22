
select villeAero,codeAeroArr from AEROPORT natural join VOL where codeAeroDep in (select codeAero from AEROPORT where villeAero='Paris') group by codeAeroArr;