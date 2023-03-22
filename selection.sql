--Donner les villes que nous pouvons atteindre par vols directs qui partent de Paris

SELECT DISTINCT a.villeAero FROM VOL v JOIN AEROPORT a ON v.codeAeroArr = a.codeAero WHERE v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris');

--En considerant les horaires des vols, 
--veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant UNE correspondance. 
--L’objectif est de permettre aux passagers de realiser leur correspondance et que la date du vol de correspondance soit superieure a la date du vol de depart.

SELECT DISTINCT a.villeAero FROM VOL v JOIN AEROPORT a ON v.codeAeroArr = a.codeAero WHERE v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris') AND v.codeAeroArr IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero != 'Paris') AND v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero != 'Paris');

--En considerant les horaires des vols, veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant DEUX correspondances
-- Il faut que la date du vol de correspondance soit superieure a la date du vol de depart

SELECT DISTINCT a.villeAero FROM VOL v JOIN AEROPORT a ON v.codeAeroArr = a.codeAero WHERE v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris') AND v.codeAeroArr IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero != 'Paris') AND v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero != 'Paris') AND v.codeAeroArr IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero != 'Paris') AND v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero != 'Paris');