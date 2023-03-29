--Donner les villes que nous pouvons atteindre par vols directs qui partent de Paris

SELECT DISTINCT a.villeAero FROM VOL v JOIN AEROPORT a ON v.codeAeroArr = a.codeAero WHERE v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris');

--En considerant les horaires des vols, 
--veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant UNE correspondance. 
--L’objectif est de permettre aux passagers de realiser leur correspondance en prenant en compte la date et l'heure de départ et la date et heure d'arrivée.

SELECT DISTINCT a2.villeAero
FROM VOL v1
JOIN AEROPORT a1 ON v1.codeAeroDep = a1.codeAero AND a1.villeAero = 'Paris'
JOIN AEROPORT a2 ON v1.codeAeroArr = a2.codeAero
WHERE EXISTS (
  SELECT 1
  FROM VOL v2
  WHERE v1.codeAeroArr = v2.codeAeroDep
  AND v1.dateHeureArr < v2.dateHeureVol
);



--En considerant les horaires des vols, veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant DEUX correspondances
-- Il faut que la date du vol de correspondance soit superieure a la date du vol de depart